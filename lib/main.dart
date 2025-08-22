import 'dart:async';

import 'package:crypto_tracker/core/cache/cache_config.dart';
import 'package:crypto_tracker/core/cache/i_cache_service.dart';
import 'package:crypto_tracker/core/cache/impl/hive_cache_service.dart';
import 'package:crypto_tracker/core/cache_orchestrator/cache_orchestrator.dart';
import 'package:crypto_tracker/core/connectivity/i_connectivity_service.dart';
import 'package:crypto_tracker/core/connectivity/impl/connectivity_service_impl.dart';
import 'package:crypto_tracker/core/core_settings/i_settings_repository.dart';
import 'package:crypto_tracker/core/localization/l10n/app_localizations.dart';
import 'package:crypto_tracker/core/models/app_locales.dart';
import 'package:crypto_tracker/core/models/theme_preference.dart';
import 'package:crypto_tracker/core/network/api_client.dart';
import 'package:crypto_tracker/core/network/dio_client.dart';
import 'package:crypto_tracker/core/router/app_router.dart';
import 'package:crypto_tracker/core/services/logging/impl/console_logger_service.dart';
import 'package:crypto_tracker/core/services/logging/logger_service.dart';
import 'package:crypto_tracker/core/theme/app_theme.dart';
import 'package:crypto_tracker/features/currency_exchange/data/datasources/current_exchange_rates_remote_data_source_impl.dart';
import 'package:crypto_tracker/features/currency_exchange/data/datasources/historical_exchange_rates_local_data_source_impl.dart';
import 'package:crypto_tracker/features/currency_exchange/data/datasources/historical_exchange_rates_remote_data_source_impl.dart';
import 'package:crypto_tracker/features/currency_exchange/data/datasources/i_current_exchange_rates_remote_data_source.dart';
import 'package:crypto_tracker/features/currency_exchange/data/datasources/i_historical_exchange_rates_local_data_source.dart';
import 'package:crypto_tracker/features/currency_exchange/data/datasources/i_historical_exchange_rates_remote_data_source.dart';
import 'package:crypto_tracker/features/currency_exchange/data/repository/currency_repository_impl.dart';
import 'package:crypto_tracker/features/currency_exchange/domain/repository/i_currency_repository.dart';
import 'package:crypto_tracker/features/currency_exchange/domain/usecases/get_historical_rates_usecase.dart';
import 'package:crypto_tracker/features/currency_exchange/domain/usecases/get_rate_for_date_usecase.dart';
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
import 'package:crypto_tracker/features/settings/domain/repositories/i_settings_writer.dart';
import 'package:crypto_tracker/hive_registrar.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:hive_ce_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();

  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  // --- CONNECTIVITY INITIALIZATION ---
  final connectivityService = ConnectivityServiceImpl();
  // Perform the initial connectivity check before the app even runs.
  await connectivityService.initialize();

  await dotenv.load(fileName: ".env");
  await Hive.initFlutter();
  // Hive_ce QOL function to register adapters at once.
  Hive.registerAdapters();

  final settingsBox = await Hive.openBox(CacheBoxNames.settings);
  final marketCacheBox = await Hive.openBox(CacheBoxNames.marketCache);
  final dailyExchangeRatesBox = await Hive.openBox(
    CacheBoxNames.dailyExchangeRates,
  );

  final settingsCache = HiveCacheService<SettingsFeature>(
    settingsBox,
    ConsoleLoggerService.instance,
  );
  ILoggerService logger = ConsoleLoggerService.instance;

  final settingsLocal = SettingsLocalDataSourceImpl(settingsCache);
  final settingsRepoImpl = SettingsRepositoryImpl(settingsLocal, logger);
  await settingsRepoImpl.init();

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

        Provider<ApiClient<CoinGeckoApi>>(
          create: (context) => ApiClient(
            context.read<ILoggerService>(),
            DioClient.createCoinGeckoDio(),
          ),
        ),

        Provider<ApiClient<FrankfurterApi>>(
          create: (context) => ApiClient(
            context.read<ILoggerService>(),
            DioClient.createFrankfurterDio(),
          ),
        ),

        // --- Feature: Settings ---
        Provider<ICacheService<SettingsFeature>>(create: (_) => settingsCache),

        Provider<ISettingsLocalDataSource>(create: (_) => settingsLocal),

        Provider<ISettingsRepository>(
          create: (_) => settingsRepoImpl,
          dispose: (_, repo) {
            if (repo is SettingsRepositoryImpl) repo.dispose();
          },
        ),
        Provider<ISettingsWriter>(
          create: (_) => settingsRepoImpl,
          dispose: (_, repo) {
            if (repo is SettingsRepositoryImpl) repo.dispose();
          },
        ),

        // --- Feature: Market ---

        // Cache service with the marketCacheBox
        Provider<ICacheService<MarketFeature>>(
          create: (context) => HiveCacheService<MarketFeature>(
            marketCacheBox,
            context.read<ILoggerService>(),
          ),
        ),
        // Remote data source of market feature, used in MarketRepository
        Provider<IMarketRemoteDataSource>(
          create: (context) => MarketRemoteDataSourceImpl(
            context.read<ApiClient<CoinGeckoApi>>(),
            context.read<ILoggerService>(),
          ),
        ),

        // Local data source of market feature, used in MarketRepository
        Provider<IMarketLocalDataSource>(
          create: (context) => MarketLocalDataSourceImpl(
            context.read<ICacheService<MarketFeature>>(),
            context.read<ILoggerService>(),
          ),
        ),
        // Market Repository, takes everything as dependency.
        ProxyProvider4<
          IMarketRemoteDataSource,
          IMarketLocalDataSource,
          IConnectivityService,
          ILoggerService,
          IMarketRepository
        >(
          update: (_, remote, local, connectivity, logger, __) =>
              MarketRepositoryImpl(
                remoteDataSource: remote,
                localDataSource: local,
                connectivityService: connectivity,
                loggerService: logger,
              ),
        ),

        // UseCases
        ProxyProvider<IMarketRepository, GetMarketCoinsUseCase>(
          update: (_, repo, __) => GetMarketCoinsUseCase(repo),
        ),
        ProxyProvider<IMarketRepository, SearchCoinsUseCase>(
          update: (_, repo, __) => SearchCoinsUseCase(repo),
        ),

        // --- Feature: Exchange Rate ---
        Provider<ICacheService<ExchangeRatesFeature>>(
          create: (context) => HiveCacheService<ExchangeRatesFeature>(
            dailyExchangeRatesBox,
            context.read<ILoggerService>(),
          ),
        ),

        Provider<ICurrentExchangeRatesRemoteDatasource>(
          create: (context) => CurrentExchangeRatesRemoteDataSourceImpl(
            context.read<ApiClient<CoinGeckoApi>>(),
            context.read<ILoggerService>(),
          ),
        ),

        Provider<IHistoricalExchangeRatesRemoteDataSource>(
          create: (context) => HistoricalExchangeRatesRemoteDataSourceImpl(
            context.read<ApiClient<FrankfurterApi>>(),
            context.read<ILoggerService>(),
          ),
        ),

        Provider<IHistoricalExchangeRatesLocalDataSource>(
          create: (context) => HistoricalExchangeRatesLocalDataSourceImpl(
            context.read<ICacheService<ExchangeRatesFeature>>(),
            context.read<ILoggerService>(),
          ),
        ),

        Provider<ICurrencyRepository>(
          create: (context) => CurrencyRepositoryImpl(
            context.read<ICurrentExchangeRatesRemoteDatasource>(),
            context.read<IHistoricalExchangeRatesRemoteDataSource>(),
            context.read<IHistoricalExchangeRatesLocalDataSource>(),
            context.read<ILoggerService>(),
          ),
        ),

        // Use cases
        Provider<GetRateForDateUsecase>(
          create: (context) =>
              GetRateForDateUsecase(context.read<ICurrencyRepository>()),
        ),

        Provider<GetHistoricalRatesUsecase>(
          create: (context) =>
              GetHistoricalRatesUsecase(context.read<ICurrencyRepository>()),
        ),

        // Orchestrator (depends on the above providers)
        Provider<CacheOrchestrator>(
          lazy: false,
          create: (context) {
            return CacheOrchestrator(
              context.read<ISettingsRepository>(),
              context.read<ICacheService<MarketFeature>>(),
              context.read<ILoggerService>(),
            );
          },
          dispose: (_, orchestrator) => orchestrator.dispose(),
        ),
      ],

      child: const CryptoTrackerState(),
    ),
  );
  FlutterNativeSplash.remove();
}

class CryptoTrackerState extends StatefulWidget {
  const CryptoTrackerState({super.key});

  @override
  State<CryptoTrackerState> createState() => _CryptoTrackerStateState();
}

class _CryptoTrackerStateState extends State<CryptoTrackerState> {
  late final ISettingsRepository _settingsRepo;

  // Local UI state derived from the settings repo
  late ThemeMode _themeMode;
  Locale? _locale;

  // Subscriptions
  StreamSubscription<ThemePreference>? _themeSub;
  StreamSubscription<AppLocale>? _localeSub;

  @override
  void initState() {
    super.initState();
    _settingsRepo = Provider.of<ISettingsRepository>(context, listen: false);
    _themeMode = _mapThemePreferenceToThemeMode(_settingsRepo.themePreference);
    _locale = _mapLocaleTagToLocale(_settingsRepo.localeTag.name);
    // Subscribe to streams to reactively update UI
    _themeSub = _settingsRepo.themePreferenceStream.listen((pref) {
      final newMode = _mapThemePreferenceToThemeMode(pref);
      if (newMode != _themeMode) {
        setState(() => _themeMode = newMode);
      }
    });

    _localeSub = _settingsRepo.localeTagStream.listen((tag) {
      final newLocale = _mapLocaleTagToLocale(tag.name);
      // Compare using toString to avoid minor Locale instance inequality issues
      if (newLocale?.toString() != _locale?.toString()) {
        setState(() => _locale = newLocale);
      }
    });
  }

  @override
  void dispose() {
    _themeSub?.cancel();
    _localeSub?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: AppRouter.router,
      locale: _locale,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      onGenerateTitle: (context) => AppLocalizations.of(context)!.appTitle,
      themeMode: _themeMode,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      title: "TrackIt",
    );
  }

  ThemeMode _mapThemePreferenceToThemeMode(ThemePreference pref) {
    switch (pref) {
      case ThemePreference.light:
        return ThemeMode.light;
      case ThemePreference.dark:
        return ThemeMode.dark;
      case ThemePreference.system:
        return ThemeMode.system;
    }
  }

  Locale? _mapLocaleTagToLocale(String? tag) {
    if (tag == null || tag.isEmpty) return null;
    return Locale(tag);
  }
}
