import 'package:crypto_tracker/core/cache/cache_config.dart';
import 'package:crypto_tracker/core/cache/impl/hive_cache_service.dart';
import 'package:crypto_tracker/core/connectivity/i_connectivity_service.dart';
import 'package:crypto_tracker/core/connectivity/impl/connectivity_service_impl.dart';
import 'package:crypto_tracker/core/localization/l10n/app_localizations.dart';
import 'package:crypto_tracker/core/localization/locale_provider.dart';
import 'package:crypto_tracker/core/network/api_client.dart';
import 'package:crypto_tracker/core/router/app_router.dart';
import 'package:crypto_tracker/core/services/logging/impl/console_logger_service.dart';
import 'package:crypto_tracker/core/services/logging/logger_service.dart.dart';
import 'package:crypto_tracker/core/theme/app_theme.dart';
import 'package:crypto_tracker/core/theme/theme_provider.dart';
import 'package:crypto_tracker/features/market/data/datasources/i_market_local_data_source.dart';
import 'package:crypto_tracker/features/market/data/datasources/i_market_remote_data_source.dart';
import 'package:crypto_tracker/features/market/data/datasources/market_local_data_source_impl.dart';
import 'package:crypto_tracker/features/market/data/datasources/market_remote_data_source_impl.dart';
import 'package:crypto_tracker/features/market/data/repository/market_repository_impl.dart';
import 'package:crypto_tracker/features/market/domain/repositories/i_market_repository.dart';
import 'package:crypto_tracker/features/market/domain/usecases/get_market_coins_usecase.dart';
import 'package:crypto_tracker/features/market/domain/usecases/search_coins_usecase.dart';
import 'package:crypto_tracker/features/settings/data/datasources/i_settings_local_data_source.dart';
import 'package:crypto_tracker/features/settings/data/datasources/settings_local_data_source_impl.dart';
import 'package:crypto_tracker/features/settings/data/repositories/settings_repository_impl.dart';
import 'package:crypto_tracker/features/settings/domain/repositories/i_settings_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // --- CONNECTIVITY INITIALIZATION ---
  final connectivityService = ConnectivityServiceImpl();
  // Perform the initial connectivity check before the app even runs.
  await connectivityService.initialize();

  await dotenv.load(fileName: ".env");
  await Hive.initFlutter();

  final settingsBox = await Hive.openBox(CacheBoxNames.settings);
  final apiCacheBox = await Hive.openBox(CacheBoxNames.marketCache);

  runApp(
    MultiProvider(
      providers: [
        //========================================================================
        // CORE - INFRASTRUCTURE & SINGLETON SERVICES
        // (Services that have no other provider dependencies)
        //========================================================================
        Provider<ILoggerService>(
          create: (_) => ConsoleLoggerService.instance,
          dispose: (_, service) => service.dispose(),
        ),
        Provider<IConnectivityService>(
          create: (_) => connectivityService, // From main()
          dispose: (_, service) => service.dispose(),
        ),
        ProxyProvider<ILoggerService, ApiClient>(
          update: (_, logger, __) => ApiClient(logger),
        ),

        //========================================================================
        // FEATURE DATA & DOMAIN LAYERS
        // (Grouped by feature for clarity)
        //========================================================================

        // --- Feature: Settings ---
        Provider<ISettingsLocalDataSource>(
          create: (_) =>
              SettingsLocalDataSourceImpl(HiveCacheService(settingsBox)),
        ),
        ProxyProvider<ISettingsLocalDataSource, ISettingsRepository>(
          update: (_, ds, __) => SettingsRepositoryImpl(ds),
        ),

        // --- Feature: Market ---
        ProxyProvider<ApiClient, IMarketRemoteDataSource>(
          update: (_, apiClient, __) => MarketRemoteDataSourceImpl(apiClient),
        ),
        Provider<IMarketLocalDataSource>(
          create: (_) =>
              MarketLocalDataSourceImpl(HiveCacheService(apiCacheBox)),
        ),
        ProxyProvider3<
          IMarketRemoteDataSource,
          IMarketLocalDataSource,
          IConnectivityService,
          IMarketRepository
        >(
          update: (_, remote, local, connectivity, __) => MarketRepositoryImpl(
            remoteDataSource: remote,
            localDataSource: local,
            connectivityService: connectivity,
          ),
        ),

        // UseCases
        ProxyProvider<IMarketRepository, GetMarketCoinsUseCase>(
          update: (_, repo, __) => GetMarketCoinsUseCase(repo),
        ),
        ProxyProvider<IMarketRepository, SearchCoinsUseCase>(
          update: (_, repo, __) => SearchCoinsUseCase(repo),
        ),

        //========================================================================
        // GLOBAL UI PROVIDERS
        // (ChangeNotifiers that control global UI state)
        //========================================================================
        ChangeNotifierProxyProvider<ISettingsRepository, ThemeProvider>(
          create: (context) =>
              ThemeProvider(context.read<ISettingsRepository>()),
          update: (_, repo, previous) => previous ?? ThemeProvider(repo),
        ),
        ChangeNotifierProvider(create: (_) => LocaleProvider()),
      ],

      child: const CryptoTrackerState(),
    ),
  );
}

class CryptoTrackerState extends StatelessWidget {
  const CryptoTrackerState({super.key});
  @override
  Widget build(BuildContext context) {
    final localeProvider = context.watch<LocaleProvider>();
    final themeProvider = context.watch<ThemeProvider>();

    return MaterialApp.router(
      routerConfig: AppRouter.router,
      locale: localeProvider.locale,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      onGenerateTitle: (context) => AppLocalizations.of(context)!.appTitle,
      themeMode: themeProvider.themeMode,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      title: "TrackIt",
    );
  }
}
