import 'package:crypto_tracker/core/localization/l10n/app_localizations.dart';
import 'package:crypto_tracker/core/localization/locale_provider.dart';
import 'package:crypto_tracker/core/network/api_client.dart';
import 'package:crypto_tracker/core/services/logging/impl/console_logger_service.dart';
import 'package:crypto_tracker/core/services/logging/logger_service.dart.dart';
import 'package:crypto_tracker/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await dotenv.load(fileName: ".env");
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => LocaleProvider()),

        //Low level dependencies
        Provider<ILoggerService>(
          create: (_) => ConsoleLoggerService.instance,
          dispose: (_, service) => service.dispose(),
        ),


        ProxyProvider<ILoggerService, ApiClient>(
          update: (_, logger, __) =>
              ApiClient(logger),
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

    return MaterialApp(
      locale: localeProvider.locale,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      onGenerateTitle: (context) => AppLocalizations.of(context)!.appTitle,

      home: const HomeScreen(),
    );
  }
}
