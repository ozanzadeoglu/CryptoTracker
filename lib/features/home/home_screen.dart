import 'package:crypto_tracker/core/localization/l10n/app_localizations.dart';
import 'package:crypto_tracker/core/localization/locale_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.appTitle),
      ),
      body: Center(
        child: Column(
          spacing: 20,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(AppLocalizations.of(context)!.hello('Ozan')),
            ElevatedButton(
              onPressed: () {
                context.read<LocaleProvider>().setLocale(const Locale('en'));
              },
              child: const Text('English'),
            ),
            ElevatedButton(
              onPressed: () {
                context.read<LocaleProvider>().setLocale(const Locale('tr'));
              },
              child: const Text('Türkçe'),
            ),
          ],
        ),
      ),
    );
  }
}