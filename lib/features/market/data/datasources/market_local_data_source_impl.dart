import 'package:crypto_tracker/core/cache/i_cache_service.dart';
import 'package:crypto_tracker/features/market/domain/models/coin_model.dart';
import 'package:crypto_tracker/features/market/data/datasources/i_market_local_data_source.dart';

class MarketLocalDataSourceImpl implements IMarketLocalDataSource {
  final ICacheService _cacheService;

  MarketLocalDataSourceImpl(this._cacheService);

  @override
  Future<List<Coin>> getMarketCoins() async {
    // This method is not yet implemented and won't be called in the online-only phase.
    // Returning an empty list is a safe default.
    return []; 
  }

  @override
  Future<void> cacheMarketCoins(List<Coin> coins) async {
    // This method will be implemented.
    return;
  }
}