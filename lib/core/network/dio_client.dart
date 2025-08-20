import 'package:crypto_tracker/core/config/api_keys.dart';
import 'package:dio/dio.dart';

class DioClient {
  const DioClient._();

  /// Creates a Dio instance for the CoinGecko API
  static Dio createCoinGeckoDio() {
    const baseUrl = "https://api.coingecko.com/api/v3/";
    final baseOptions = BaseOptions(
      baseUrl: baseUrl,
      headers: {
        "x-cg-demo-api-key": ApiKeys.coingeckoApiKey,
        "Content-Type": "application/json",
      },
      connectTimeout: const Duration(seconds: 15),
      receiveTimeout: const Duration(seconds: 15),
    );
    return Dio(baseOptions);
  }

  /// Creates a Dio instance for the Frankfurter currency API
  static Dio createFrankfurterDio() {
    const baseUrl = "https://api.frankfurter.app";
    final baseOptions = BaseOptions(
      baseUrl: baseUrl,
      headers: {
        "Content-Type": "application/json",
      },
      connectTimeout: const Duration(seconds: 15),
      receiveTimeout: const Duration(seconds: 15),
    );
    return Dio(baseOptions);
  }

}