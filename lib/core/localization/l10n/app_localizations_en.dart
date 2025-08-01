// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get appTitle => 'TrackIt';

  @override
  String get market => 'Market';

  @override
  String get portfolio => 'Portfolio';

  @override
  String get settings => 'Settings';

  @override
  String get errorMessage => 'An Error Occurred';

  @override
  String get tryAgain => 'Try Again';

  @override
  String get sortOptionsGainers => 'Gainers';

  @override
  String get sortOptionsLosers => 'Losers';

  @override
  String get sortOptionsMarketCap => 'Market Cap';

  @override
  String get sortOptionsAlphabetic => 'Name (A-Z)';

  @override
  String get searchCoins => 'Search coins';

  @override
  String get noCoinsFound => 'No coins found.';

  @override
  String get noNetworkConnection =>
      'No internet connection. Please check your connection and try again.';

  @override
  String get serverUnavailable =>
      'Server is temporarily unavailable. Please try again later.';

  @override
  String get cacheReadFailed => 'Unable to load saved data. Please try again.';

  @override
  String get noOfflineSearch =>
      'Search requires internet connection. Please connect to the internet and try again.';

  @override
  String hello(String userName) {
    return 'Hello, $userName!';
  }
}
