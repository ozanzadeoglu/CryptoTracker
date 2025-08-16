import 'dart:async';

import 'package:crypto_tracker/core/cache/i_cache_service.dart';
import 'package:crypto_tracker/core/core_settings/i_settings_repository.dart';
import 'package:crypto_tracker/core/models/fiat_currency.dart';
import 'package:crypto_tracker/core/network/api_result.dart';
import 'package:crypto_tracker/core/services/logging/logger_service.dart';

class CacheOrchestrator {
  final ISettingsRepository _settingsRepo;
  final ICacheService<MarketFeature> _marketCache;
  final ILoggerService _logger;
  StreamSubscription<FiatCurrency>? _fiatSub;
  FiatCurrency? _fiat;

  CacheOrchestrator(this._settingsRepo, this._marketCache, this._logger) {
    _fiatSub = _settingsRepo.fiatStream.listen(_onFiatChanged);
    _fiat = _settingsRepo.preferredFiat;
  }

  Future<void> _onFiatChanged(FiatCurrency newFiat) async {
    if (_fiat != null && _fiat == newFiat) return;

    _logger.logInfo(
      "Preffered fiat has been changed, attempting to clear market cache.",
      source: "CacheOrchestrator",
    );

    final result = await _marketCache.clear();
    switch (result) {
      case Success():
        _logger.logInfo(
          "Market cache cleared succesfully",
          source: "CacheOrchestrator",
        );
        _fiat = newFiat;
        break;
      case Failure(failure: final error):
        _logger.logWarning(
          "Market cache couldn't cleared.",
          source: "CacheOrchestrator",
          error: error,
        );
        break;
    }
  }

  void dispose() {
    _fiatSub?.cancel();
  }
}
