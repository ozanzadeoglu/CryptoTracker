import 'package:crypto_tracker/core/cache/cache_config.dart';
import 'package:crypto_tracker/features/market/domain/models/coin_model.dart';
import 'package:hive_ce/hive.dart';

part 'cached_coins.g.dart';

@HiveType(typeId: HiveTypeIds.cachedCoins)
class CachedCoins {
  CachedCoins({required this.date, required this.cachedCoins});

  @HiveField(0)
  DateTime date;

  @HiveField(1)
  List<Coin> cachedCoins;
}
