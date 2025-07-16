import 'package:crypto_tracker/core/config/api_keys.dart';
import 'package:crypto_tracker/core/network/api_failure.dart';
import 'package:crypto_tracker/core/network/api_result.dart';
import 'package:dio/dio.dart';

class ApiClient {
  final Dio _dio;

  static const _baseUrl = "https://api.coingecko.com/api/v3/";
  static const _headerApiKey = 'x-cg-demo-api-key';
  static const _headerContentType = 'Content-Type';
  static const _contentTypeJson = 'application/json';

  ApiClient._internal()
    : _dio = Dio(
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

  static final ApiClient instance = ApiClient._internal();

  /// Generic GET method to handle all GET requests.
  /// It returns an [ApiResult<T>] which is either an [ApiResult.success] or an [ApiResult.failure].
  /// 
  /// [path]: The endpoint path.
  /// [fromJson]: A function that converts the raw JSON map to an object of type T.
  ///             This keeps the ApiService decoupled from specific data models.
  Future<ApiResult<T>> get<T>({
    required String path,
    required T Function(dynamic json) fromJson,
  }) async {
    try {
      final response = await _dio.get(path);
      return ApiResult.success(fromJson(response.data));
    } on DioException catch (e) {
      return ApiResult.failure(_handleDioException(e));
    } catch (e) {
      return ApiResult.failure(ApiFailure.unknown("An unexpected error occurred..."));
    }
  }

   /// Converts a [DioException] into a structured, typed [ApiFailure].
  ApiFailure _handleDioException(DioException e) {
    switch (e.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
      case DioExceptionType.connectionError:
        return const ApiFailure.network(
          "Connection error. Please check your internet connection and try again.",
        );

      // This case represents a response from the server, but with a status code
      // that indicates an error (e.g., 4xx or 5xx).
      case DioExceptionType.badResponse:
        final statusCode = e.response?.statusCode;
        String serverMessage = "An unexpected server error occurred.";

        if (e.response?.data is Map<String, dynamic>) {
          serverMessage = e.response!.data['error'] ?? serverMessage;
        }

        if (statusCode == 404) {
          return ApiFailure.notFound(serverMessage);
        }

        if (statusCode == 401 || statusCode == 403) {
          return ApiFailure.server(
            message: "Unauthorized: $serverMessage",
            statusCode: statusCode,
          );
        }
        if (statusCode != null && statusCode >= 500) {
          return ApiFailure.server(
            message: "Server unavailable: $serverMessage",
            statusCode: statusCode,
          );
        }

        return ApiFailure.server(
          message: serverMessage,
          statusCode: statusCode,
        );

      case DioExceptionType.cancel:
        return const ApiFailure.unknown("Request was cancelled.");

      case DioExceptionType.unknown:
      default:
        return ApiFailure.unknown(
          "An unknown network error occurred: ${e.message}",
        );
    }
  }
}
