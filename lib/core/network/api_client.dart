import "package:crypto_tracker/core/errors/app_errors.dart";
import "package:crypto_tracker/core/network/api_failure.dart";
import "package:crypto_tracker/core/network/api_result.dart";
import "package:crypto_tracker/core/services/logging/logger_service.dart";
import "package:dio/dio.dart";


/// Gateway to all remote API's.
class ApiClient {
  final Dio _dio;
  final ILoggerService _logger;

  ApiClient(this._logger, this._dio);

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
    _logger.logInfo("Requesting GET path: $path", source: "ApiClient");
    try {
      final response = await _dio.get(path);
      return ApiResult.success(fromJson(response.data));
    } on DioException catch (e) {
      return ApiResult.failure(_handleDioException(e));
    } catch (e, stackTrace) {
      _logger.logError(
        "A critical error occurred in ApiClient.get",
        error: e,
        stackTrace: stackTrace,
        source: "ApiClient",
      );
      return ApiResult.failure(const ApiFailure.unknown());
    }
  }

  /// Converts a [DioException] into a structured, typed [ApiFailure].
  ApiFailure _handleDioException(DioException e) {
    final uri = e.requestOptions.uri.toString();
    _logger.logWarning("DioException caught", error: e, source: "ApiClient");
    switch (e.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
      case DioExceptionType.connectionError:
        _logger.logError(
          "Network timeout/error on $uri: ${e.message}",
          source: "ApiClient",
        );
        return const ApiFailure.network(AppError.noNetworkConnection);

      case DioExceptionType.badResponse:
        final statusCode = e.response?.statusCode;
        final rawBody = e.response?.data;
        String serverMsg = "HTTP $statusCode";

        // extract error message
        if (rawBody is Map<String, dynamic> && rawBody.containsKey("error")) {
          serverMsg = rawBody["error"];
        }

        // 404
        if (statusCode == 404) {
          _logger.logError("404 Not Found at $uri", source: "ApiClient");
          return const ApiFailure.notFound(AppError.serverUnavailable);
        }

        // auth errors, may caused because of an unvalid api key
        if (statusCode == 401 || statusCode == 403) {
          _logger.logError(
            "Unauthorized ($statusCode) on $uri: $serverMsg",
            source: "ApiClient",
          );
          return ApiFailure.server(statusCode: statusCode);
        }

        // server‐side (5xx)
        if (statusCode != null && statusCode >= 500) {
          _logger.logError(
            "Server error ($statusCode) on $uri: $serverMsg",
            source: "ApiClient",
          );
          return ApiFailure.server(
            error: AppError.serverUnavailable,
            statusCode: statusCode,
          );
        }

        // all other HTTP errors (4xx)
        _logger.logError(
          "Client error ($statusCode) on $uri: $serverMsg",
          source: "ApiClient",
        );

        return ApiFailure.server(statusCode: statusCode);

      case DioExceptionType.cancel:
        _logger.logInfo("Request to $uri was cancelled", source: "ApiClient");
        return const ApiFailure.unknown();

      case DioExceptionType.unknown:
      default:
        _logger.logError(
          "Unknown network error on $uri: ${e.message}",
          error: e,
          source: "ApiClient",
        );
        return const ApiFailure.unknown();
    }
  }
}
