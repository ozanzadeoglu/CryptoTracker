import 'package:flutter_dotenv/flutter_dotenv.dart';

class ApiKeys {
  ApiKeys._(); 

  /// Getter for the CoinGecko API Key
  static String get coingeckoApiKey {
    final key = dotenv.env['COINGECKO_API_KEY'];
    if (key == null) {
      throw Exception('COINGECKO_API_KEY not found');
    }
    return key;
  }
}