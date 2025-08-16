import 'dart:async';

import 'package:crypto_tracker/core/core_settings/i_settings_repository.dart';
import 'package:crypto_tracker/core/models/app_locales.dart';
import 'package:crypto_tracker/core/models/fiat_currency.dart';
import 'package:crypto_tracker/core/models/theme_preference.dart';
import 'package:crypto_tracker/core/network/api_result.dart';
import 'package:crypto_tracker/core/services/logging/logger_service.dart';
import 'package:crypto_tracker/features/settings/domain/repositories/i_settings_writer.dart';
import '../datasources/i_settings_local_data_source.dart';

class SettingsRepositoryImpl implements ISettingsRepository, ISettingsWriter {
  final ISettingsLocalDataSource _localDataSource;
  final ILoggerService _logger;

  SettingsRepositoryImpl(this._localDataSource, this._logger);

  late ThemePreference _themePref;
  late AppLocale _localeTag;
  late FiatCurrency _fiat;

  final _themeController = StreamController<ThemePreference>.broadcast();
  final _localeController = StreamController<AppLocale>.broadcast();
  final _fiatController = StreamController<FiatCurrency>.broadcast();

  // ignore: unused_field
  bool _initialized = false;

  @override
  Future<void> init() async {
    _logger.logInfo(
      "Initializing settings repository",
      source: "SettingsRepositoryImpl",
    );
    // THEME
    final themeRes = await _localDataSource.getThemePreference();
    themeRes.when(
      success: (prefOrNull) {
        _themePref = prefOrNull ?? ThemePreference.system;
      },
      failure: (failure) {
        _logger.logWarning(
          "Unable to read theme.",
          source: "SettingsRepositoryImpl",
          error: failure,
        );
        _themePref = ThemePreference.system;
      },
    );

    // LOCALE
    final localeRes = await _localDataSource.getLocaleTag();
    localeRes.when(
      success: (tag) {
        _localeTag = AppLocale.values.firstWhere(
          (e) => e.name == tag,
          orElse: () => AppLocale.en,
        );
      },
      failure: (failure) {
        _logger.logWarning(
          "Unable to read theme.",
          source: "SettingsRepositoryImpl",
          error: failure,
        );
        _localeTag = AppLocale.en;
      },
    );

    // FIAT
    final fiatRes = await _localDataSource.getPreferredFiat();
    fiatRes.when(
      success: (raw) {
        _fiat = FiatCurrency.values.firstWhere(
          (e) => e.name == raw,
          orElse: () => FiatCurrency.usd,
        );
      },
      failure: (failure) {
        _logger.logWarning(
          "Unable to read fiat currency.",
          source: "SettingsRepositoryImpl",
          error: failure,
        );
        _fiat = FiatCurrency.usd;
      },
    );

    _themeController.add(_themePref);
    _localeController.add(_localeTag);
    _fiatController.add(_fiat);

    _initialized = true;
    _logger.logInfo(
      "Settings repository finished initializing",
      source: "SettingsRepositoryImpl",
    );
  }

  @override
  void dispose() {
    _themeController.close();
    _localeController.close();
    _fiatController.close();
  }

  // Read only api implementations (ISettingsRepository)
  @override
  ThemePreference get themePreference => _themePref;

  @override
  AppLocale get localeTag => _localeTag;

  @override
  FiatCurrency get preferredFiat => _fiat;

  @override
  Stream<ThemePreference> get themePreferenceStream => _themeController.stream;

  @override
  Stream<AppLocale> get localeTagStream => _localeController.stream;

  @override
  Stream<FiatCurrency> get fiatStream => _fiatController.stream;

  // Write only api implementations (ISettingsWriter)
  @override
  Future<void> setTheme(ThemePreference pref) async {
    if (pref == _themePref) return;
    _logger.logInfo(
      "Attempting to set theme",
      source: "SettingsRepositoryImpl",
    );
    final res = await _localDataSource.setThemePreference(pref.name);

    res.when(
      success: (_) {
        _themePref = pref;
        _themeController.add(pref);
        _logger.logInfo("Theme has been set", source: "SettingsRepositoryImpl");
      },
      failure: (failure) {
        _logger.logWarning(
          "Failed to set theme.",
          source: "SettingsRepositoryImpl",
          error: failure,
        );
      },
    );
  }

  @override
  Future<void> setLocaleTag(AppLocale tag) async {
    if (tag == _localeTag) return;
    _logger.logInfo(
      "Attempting to set locale",
      source: "SettingsRepositoryImpl",
    );
    final res = await _localDataSource.setLocaleTag(tag.name);
    res.when(
      success: (_) {
        _localeTag = tag;
        _localeController.add(tag);
        _logger.logInfo(
          "Locale has been set",
          source: "SettingsRepositoryImpl",
        );
      },
      failure: (failure) {
        _logger.logWarning(
          "Failed to set locale.",
          source: "SettingsRepositoryImpl",
          error: failure,
        );
      },
    );
  }

  @override
  Future<void> setPreferredFiat(FiatCurrency fiat) async {
    if (fiat == _fiat) return;
    _logger.logInfo(
      "Attempting to set preferred fiat currency",
      source: "SettingsRepositoryImpl",
    );
    final res = await _localDataSource.setPreferredFiat(fiat.name);
    res.when(
      success: (_) {
        _fiat = fiat;
        _fiatController.add(fiat);
        _logger.logInfo(
          "Preferred fiat currency has been set",
          source: "SettingsRepositoryImpl",
        );
      },
      failure: (failure) {
        _logger.logWarning(
          "Failed to set preferred fiat currency.",
          source: "SettingsRepositoryImpl",
          error: failure,
        );
      },
    );
  }
}
