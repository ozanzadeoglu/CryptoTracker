import 'package:dio/dio.dart';
import 'package:crypto_tracker/core/config/api_keys.dart';

class DioClient {
  static const _baseUrl = "https://api.coingecko.com/api/v3/";
  static const _headerApiKey = "x-cg-demo-api-key";
  static const _headerContentType = "Content-Type";
  static const _contentTypeJson = "application/json";

  static final Dio _dio = Dio(
    BaseOptions(
      baseUrl: _baseUrl,
      headers: {
        _headerApiKey: ApiKeys.coingeckoApiKey,
        _headerContentType: _contentTypeJson,
      },
      connectTimeout: const Duration(seconds: 15),
      receiveTimeout: const Duration(seconds: 15),
    ),
  );

  DioClient._internal();

  static final DioClient instance = DioClient._internal();

  Dio get dio => _dio;
}