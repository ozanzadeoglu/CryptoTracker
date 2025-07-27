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
  String get errorMessage => 'Bir Hata Oluştu';

  @override
  String get tryAgain => 'Tekrar Dene';

  @override
  String get sortOptionsGainers => 'Yükseliş';

  @override
  String get sortOptionsLosers => 'Düşüş';

  @override
  String get sortOptionsMarketCap => 'Piyasa Değeri';

  @override
  String get sortOptionsAlphabetic => 'Alfabetik (A-Z)';

  @override
  String get searchCoins => 'Kripto para ara';

  @override
  String get noCoinsFound => 'Hiç kripto para bulunamadı.';

  @override
  String hello(String userName) {
    return 'Merhaba, $userName!';
  }
}
