// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Turkish (`tr`).
class AppLocalizationsTr extends AppLocalizations {
  AppLocalizationsTr([String locale = 'tr']) : super(locale);

  @override
  String get appTitle => 'TrackIt';

  @override
  String get market => 'Piyasa';

  @override
  String get portfolio => 'Portföy';

  @override
  String get settings => 'Ayarlar';

  @override
  String hello(String userName) {
    return 'Merhaba, $userName!';
  }
}
