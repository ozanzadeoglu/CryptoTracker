import 'package:crypto_tracker/core/errors/app_errors.dart';
import 'package:crypto_tracker/core/network/api_client.dart';
import 'package:crypto_tracker/core/network/api_failure.dart';
import 'package:crypto_tracker/core/network/api_result.dart';
import 'package:crypto_tracker/core/services/logging/logger_service.dart';
import 'package:dio/dio.dart';
import 'package:mocktail/mocktail.dart';
import 'package:flutter_test/flutter_test.dart';

class MockDio extends Mock implements Dio {}

class MockLogger extends Mock implements ILoggerService {}

void main() {
  late ApiClient apiClient;
  late MockDio mockDio;
  late MockLogger mockLogger;

  setUp(() {
    mockDio = MockDio();
    mockLogger = MockLogger();
    apiClient = ApiClient(mockLogger, mockDio);

    when(
      () => mockLogger.logInfo(any(), source: any(named: 'source')),
    ).thenAnswer((_) async {});
    when(
      () => mockLogger.logWarning(
        any(),
        error: any(named: 'error'),
        source: any(named: 'source'),
      ),
    ).thenAnswer((_) async {});

    when(
      () => mockLogger.logError(
        any(),
        error: any(named: 'error'),
        stackTrace: any(named: 'stackTrace'),
        source: any(named: 'source'),
      ),
    ).thenAnswer((_) async {});
  });

  tearDown(() {
    verifyNoMoreInteractions(mockDio);
    verifyNoMoreInteractions(mockLogger);
  });

  group('ApiClient.get', () {
    const testPath = '/test-endpoint';
    final testRequestOptions = RequestOptions(path: testPath);
    int fromJsonCallback(dynamic json) => json['id'] as int;

    test('should return success and log info when request succeeds', () async {
      // ARRANGE
      final response = Response(
        data: {'id': 1},
        requestOptions: testRequestOptions,
      );
      when(() => mockDio.get(testPath)).thenAnswer((_) async => response);

      // ACT
      final result = await apiClient.get<int>(
        path: testPath,
        fromJson: fromJsonCallback,
      );

      // ASSERT
      expect(result, const ApiResult.success(1));

      verify(() => mockDio.get(testPath)).called(1);
      verify(
        () => mockLogger.logInfo(
          'Requesting GET path: $testPath',
          source: 'ApiClient',
        ),
      ).called(1);
    });

    test(
      'should return unknown failure for a non-Dio exception and log a critical error',
      () async {
        // ARRANGE
        final exception = Exception('An error occured');
        when(() => mockDio.get(testPath)).thenThrow(exception);

        // ACT
        final result = await apiClient.get(
          path: testPath,
          fromJson: fromJsonCallback,
        );

        // ASSERT
        expect(result, const ApiResult<int>.failure(ApiFailure.unknown()));

        verify(() => mockDio.get(testPath)).called(1);
        verify(
          () => mockLogger.logInfo(
            'Requesting GET path: $testPath',
            source: 'ApiClient',
          ),
        ).called(1);
        verify(
          () => mockLogger.logError(
            'A critical error occurred in ApiClient.get',
            error: exception,
            stackTrace: any(named: 'stackTrace'),
            source: 'ApiClient',
          ),
        ).called(1);
      },
    );
    group('when Dio throws a DioException', () {
      final testCases = [
        // Network Errors
        _DioTestCase(
          DioExceptionType.connectionTimeout,
          NetworkFailure,
          AppError.noNetworkConnection,
        ),
        _DioTestCase(
          DioExceptionType.sendTimeout,
          NetworkFailure,
          AppError.noNetworkConnection,
        ),
        _DioTestCase(
          DioExceptionType.receiveTimeout,
          NetworkFailure,
          AppError.noNetworkConnection,
        ),
        _DioTestCase(
          DioExceptionType.connectionError,
          NetworkFailure,
          AppError.noNetworkConnection,
        ),
        // Bad Response Errors
        _DioTestCase(
          DioExceptionType.badResponse,
          NotFoundFailure,
          AppError.serverUnavailable,
          statusCode: 404,
        ),
        _DioTestCase(
          DioExceptionType.badResponse,
          ServerFailure,
          null,
          statusCode: 401,
        ),
        _DioTestCase(
          DioExceptionType.badResponse,
          ServerFailure,
          null,
          statusCode: 403,
        ),
        _DioTestCase(
          DioExceptionType.badResponse,
          ServerFailure,
          null,
          statusCode: 400,
        ),
        _DioTestCase(
          DioExceptionType.badResponse,
          ServerFailure,
          AppError.serverUnavailable,
          statusCode: 500
        ),
        // Other Errors
        _DioTestCase(DioExceptionType.cancel, UnknownFailure, null),
        _DioTestCase(DioExceptionType.unknown, UnknownFailure, null),
      ];

      for (final tc in testCases) {
        test(
          'should return ${tc.failureType} for type ${tc.failureType.toString()} with status ${tc.statusCode ?? 'N/A'}',
          () async {
            
            // ARRANGE
            final dioException = DioException(
              requestOptions: testRequestOptions,
              type: tc.dioExceptionType,
              response: tc.statusCode != null
                  ? Response(
                      requestOptions: testRequestOptions,
                      statusCode: tc.statusCode,
                    )
                  : null,
            );
            when(() => mockDio.get(testPath)).thenThrow(dioException);

            // ACT
            final result = await apiClient.get(
              path: testPath,
              fromJson: fromJsonCallback,
            );

            // ASSERT
            result.when(
              success: (_) => fail('Expected failure but got success'),
              failure: (failure) {
                expect(failure.runtimeType, tc.failureType);
                if (tc.expectedAppError != null) {
                  expect(failure.error, tc.expectedAppError);
                }
                if (failure is ServerFailure) {
                  expect(failure.statusCode, tc.statusCode);
                }
              },
            );

            verify(() => mockDio.get(testPath)).called(1);
            verify(
              () => mockLogger.logInfo(
                'Requesting GET path: $testPath',
                source: 'ApiClient',
              ),
            ).called(1);
            verify(
              () => mockLogger.logWarning(
                'DioException caught',
                error: dioException,
                source: 'ApiClient',
              ),
            ).called(1);

            if (tc.dioExceptionType == DioExceptionType.cancel) {
              verify(
                () => mockLogger.logInfo(
                  any(that: contains('cancelled')),
                  source: 'ApiClient',
                ),
              ).called(1);
            } else {
              verify(
                () => mockLogger.logError(
                  any(),
                  error: any(named: 'error'),
                  source: 'ApiClient',
                ),
              ).called(1);
            }
          },
        );
      }
    });
  });
}

class _DioTestCase {
  // The DioException tested
  final DioExceptionType dioExceptionType;
  // Expected failure type, e.g. NetworkFailure, ServerFailure.
  final Type failureType;
  // Expected app error, if given depending on case.
  final AppError? expectedAppError;
  // Expected status code, if given depending on case.
  final int? statusCode;

  _DioTestCase(
    this.dioExceptionType,
    this.failureType,
    this.expectedAppError, {
    this.statusCode,
  });
}
