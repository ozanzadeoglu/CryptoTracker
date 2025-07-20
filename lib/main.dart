import 'package:crypto_tracker/core/cache/cache_config.dart';
import 'package:crypto_tracker/core/cache/i_cache_service.dart';
import 'package:crypto_tracker/core/cache/impl/hive_cache_service.dart';
import 'package:crypto_tracker/core/connectivity/i_connectivity_service.dart';
import 'package:crypto_tracker/core/connectivity/impl/connectivity_service_impl.dart';
import 'package:crypto_tracker/core/localization/l10n/app_localizations.dart';
import 'package:crypto_tracker/core/localization/locale_provider.dart';
import 'package:crypto_tracker/core/network/api_client.dart';
import 'package:crypto_tracker/core/services/logging/impl/console_logger_service.dart';
import 'package:crypto_tracker/core/services/logging/logger_service.dart.dart';
import 'package:crypto_tracker/core/theme/app_theme.dart';
import 'package:crypto_tracker/core/theme/theme_provider.dart';
import 'package:crypto_tracker/features/settings/data/datasources/i_settings_local_data_source.dart';
import 'package:crypto_tracker/features/settings/data/datasources/settings_local_data_source_impl.dart';
import 'package:crypto_tracker/features/settings/data/repositories/settings_repository_impl.dart';
import 'package:crypto_tracker/features/settings/domain/repositories/i_settings_repository.dart';
import 'package:crypto_tracker/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:hive/hive.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // --- CONNECTIVITY INITIALIZATION ---
  // Create a single instance of our service.
  final connectivityService = ConnectivityServiceImpl();
  // Perform the initial connectivity check before the app even runs.
  await connectivityService.initialize();

  await dotenv.load(fileName: ".env");

  final settingsBox = await Hive.openBox(CacheBoxNames.settings);

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => LocaleProvider()),
        Provider<ICacheService>(create: (_) => HiveCacheService(settingsBox)),

        //Low level dependencies
        Provider<ILoggerService>(
          create: (_) => ConsoleLoggerService.instance,
          dispose: (_, service) => service.dispose(),
        ),
        Provider<IConnectivityService>(
          create: (_) => connectivityService,
          dispose: (_, service) => service.dispose(),
        ),

        ProxyProvider<ILoggerService, ApiClient>(
          update: (_, logger, __) => ApiClient(logger),
        ),
        ProxyProvider<ICacheService, ISettingsLocalDataSource>(
          update: (_, cache, __) => SettingsLocalDataSourceImpl(cache),
        ),
        ProxyProvider<ISettingsLocalDataSource, ISettingsRepository>(
          update: (_, ds, __) => SettingsRepositoryImpl(ds),
        ),
        ChangeNotifierProxyProvider<ISettingsRepository, ThemeProvider>(
          create: (context) =>
              ThemeProvider(context.read<ISettingsRepository>()),
          update: (context, repo, previous) => previous ?? ThemeProvider(repo),
        ),
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

    return MaterialApp(
      locale: localeProvider.locale,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      onGenerateTitle: (context) => AppLocalizations.of(context)!.appTitle,
      themeMode: themeProvider.themeMode,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      home: const HomeScreen(),
    );
  }
}
