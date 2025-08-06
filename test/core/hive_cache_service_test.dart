import 'package:crypto_tracker/core/cache/impl/hive_cache_service.dart';
import 'package:crypto_tracker/core/network/api_failure.dart';
import 'package:crypto_tracker/core/network/api_result.dart';
import 'package:crypto_tracker/core/services/logging/logger_service.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hive_ce_flutter/hive_flutter.dart';
import 'package:mocktail/mocktail.dart';

class MockBox extends Mock implements Box {}

class MockLogger extends Mock implements ILoggerService {}

void main() {
  late MockBox mockBox;
  late MockLogger mockLogger;
  late HiveCacheService hiveCacheService;

  setUp(() {
    mockBox = MockBox();
    mockLogger = MockLogger();
    hiveCacheService = HiveCacheService(mockBox, mockLogger);

    when(
      () => mockLogger.logInfo(any(), source: any(named: 'source')),
    ).thenAnswer((_) {});
    when(
      () => mockLogger.logWarning(
        any(),
        error: any(named: 'error'),
        source: any(named: 'source'),
      ),
    ).thenAnswer((_) {});

    when(
      () => mockLogger.logError(
        any(),
        error: any(named: 'error'),
        stackTrace: any(named: 'stackTrace'),
        source: any(named: 'source'),
      ),
    ).thenAnswer((_) {});
  });

  tearDownAll(() {
    verifyNoMoreInteractions(mockBox);
    verifyNoMoreInteractions(mockLogger);
  });

  group("HiveCacheService.get", () {
    final String testKey = "testKey";

    test(
      "Should succesfully return ApiResult<T?>, and do the logging",
      () async {
        // ARRANGE
        int? response = 1;
        when(() => mockBox.get(testKey)).thenAnswer((_) async => response);

        // ACT
        final result = await hiveCacheService.get<int>(testKey);

        // Assert
        expect(result, const ApiResult<int?>.success(1));

        verify(() => mockBox.get(testKey)).called(1);

        verify(
          () => mockLogger.logInfo(
            "Attempting to GET '$testKey' from cache",
            source: 'HiveCacheService',
          ),
        ).called(1);

        verify(
          () => mockLogger.logInfo(
            "Successfully GET '$testKey' from cache",
            source: 'HiveCacheService',
          ),
        ).called(1);
      },
    );

    test(
      "should return cache failure for HiveError and do the logging",
      () async {
        // ARRANGE
        final response = HiveError("A hive error occured");
        when(() => mockBox.get(testKey)).thenThrow(response);

        // ACT
        final result = await hiveCacheService.get<int>(testKey);

        // Assert
        expect(result, const ApiResult<int?>.failure(ApiFailure.cache()));

        verify(() => mockBox.get(testKey)).called(1);

        verify(
          () => mockLogger.logInfo(
            "Attempting to GET '$testKey' from cache",
            source: 'HiveCacheService',
          ),
        ).called(1);

        verify(
          () => mockLogger.logError(
            "Failed to GET '$testKey' from Hive: ${response.message}",
            error: response,
            stackTrace: any(named: 'stackTrace'),
            source: 'HiveCacheService',
          ),
        ).called(1);
      },
    );

    test(
      "should return unknown failure for any exception and do the logging",
      () async {
        // ARRANGE
        final response = Exception("A exception occured");
        when(() => mockBox.get(testKey)).thenThrow(response);

        // ACT
        final result = await hiveCacheService.get<int>(testKey);

        // Assert
        expect(result, const ApiResult<int?>.failure(ApiFailure.unknown()));

        verify(() => mockBox.get(testKey)).called(1);

        verify(
          () => mockLogger.logInfo(
            "Attempting to GET '$testKey' from cache",
            source: 'HiveCacheService',
          ),
        ).called(1);

        verify(
          () => mockLogger.logError(
            "Unknown error GET '$testKey' from Hive: $response",
            error: response,
            stackTrace: any(named: 'stackTrace'),
            source: 'HiveCacheService',
          ),
        ).called(1);
      },
    );
  });

  group("HiveCacheService.put", () {
    final String testKey = "testKey";
    final int testCache = 5;

    test(
      "Should succesfully return ApiResult<void>, and do the logging",
      () async {
        // ARRANGE
        when(() => mockBox.put(testKey, testCache)).thenAnswer((_) async => {});

        // ACT
        final result = await hiveCacheService.put<int>(testKey, testCache);

        // Assert
        expect(result, const ApiResult<void>.success(null));

        verify(() => mockBox.put(testKey, testCache)).called(1);

        verify(
          () => mockLogger.logInfo(
            any(that: contains("Attempting to PUT")),
            source: 'HiveCacheService',
          ),
        ).called(1);

        verify(
          () => mockLogger.logInfo(
            any(that: contains("Successfully PUT")),
            source: 'HiveCacheService',
          ),
        ).called(1);
      },
    );

    test(
      "On HiveError case, should return cache failure for HiveError and do the logging",
      () async {
        // ARRANGE
        final response = HiveError("A hive error occured");
        when(() => mockBox.put(testKey, testCache)).thenThrow(response);

        // ACT
        final result = await hiveCacheService.put<int>(testKey, testCache);

        // Assert
        expect(result, const ApiResult<void>.failure(ApiFailure.cache()));

        verify(() => mockBox.put(testKey, testCache)).called(1);

        verify(
          () => mockLogger.logInfo(
            any(that: contains("Attempting to PUT")),
            source: 'HiveCacheService',
          ),
        ).called(1);

        verify(
          () => mockLogger.logError(
            any(that: contains("Failed to PUT")),
            error: response,
            stackTrace: any(named: 'stackTrace'),
            source: 'HiveCacheService',
          ),
        ).called(1);
      },
    );

    test(
      "On exception case, should return unknown failure for any exception and do the logging",
      () async {
        // ARRANGE
        final response = Exception("An exception occured");
        when(() => mockBox.put(testKey, testCache)).thenThrow(response);

        // ACT
        final result = await hiveCacheService.put<int>(testKey, testCache);

        // Assert
        expect(result, const ApiResult<void>.failure(ApiFailure.unknown()));

        verify(() => mockBox.put(testKey, testCache)).called(1);

        verify(
          () => mockLogger.logInfo(
            any(that: contains("Attempting to PUT")),
            source: 'HiveCacheService',
          ),
        ).called(1);

        verify(
          () => mockLogger.logError(
            any(that: contains("Unknown error PUT")),
            error: response,
            stackTrace: any(named: 'stackTrace'),
            source: 'HiveCacheService',
          ),
        ).called(1);
      },
    );
  });

  group("HiveCacheService.delete", () {
    final String testKey = "testKey";

    test(
      "Should succesfully return ApiResult<void>, and do the logging",
      () async {
        // ARRANGE
        when(() => mockBox.delete(testKey)).thenAnswer((_) async => {});

        // ACT
        final result = await hiveCacheService.delete(testKey);

        // Assert
        expect(result, const ApiResult<void>.success(null));

        verify(() => mockBox.delete(testKey)).called(1);

        verify(
          () => mockLogger.logInfo(
            any(that: contains("Attempting to DELETE")),
            source: 'HiveCacheService',
          ),
        ).called(1);

        verify(
          () => mockLogger.logInfo(
            any(that: contains("Successfully DELETE")),
            source: 'HiveCacheService',
          ),
        ).called(1);
      },
    );

    test(
      "On HiveError case, should return cache failure for HiveError and do the logging",
      () async {
        // ARRANGE
        final response = HiveError("A hive error occured");
        when(() => mockBox.delete(testKey)).thenThrow(response);

        // ACT
        final result = await hiveCacheService.delete(testKey);

        // Assert
        expect(result, const ApiResult<void>.failure(ApiFailure.cache()));

        verify(() => mockBox.delete(testKey)).called(1);

        verify(
          () => mockLogger.logInfo(
            any(that: contains("Attempting to DELETE")),
            source: 'HiveCacheService',
          ),
        ).called(1);

        verify(
          () => mockLogger.logError(
            any(that: contains("Failed to DELETE")),
            error: response,
            stackTrace: any(named: 'stackTrace'),
            source: 'HiveCacheService',
          ),
        ).called(1);
      },
    );

    test(
      "On exception case, should return unknown failure for any exception and do the logging",
      () async {
        // ARRANGE
        final response = Exception("An exception occured");
        when(() => mockBox.delete(testKey)).thenThrow(response);

        // ACT
        final result = await hiveCacheService.delete(testKey);

        // Assert
        expect(result, const ApiResult<void>.failure(ApiFailure.unknown()));

        verify(() => mockBox.delete(testKey)).called(1);

        verify(
          () => mockLogger.logInfo(
            any(that: contains("Attempting to DELETE")),
            source: 'HiveCacheService',
          ),
        ).called(1);

        verify(
          () => mockLogger.logError(
            any(that: contains("Unknown error DELETE")),
            error: response,
            stackTrace: any(named: 'stackTrace'),
            source: 'HiveCacheService',
          ),
        ).called(1);
      },
    );
  });

    group("HiveCacheService.clear", () {

    test(
      "Should succesfully return ApiResult<void>, and do the logging",
      () async {
        // ARRANGE
        when(() => mockBox.clear()).thenAnswer((_) async => 1);

        // ACT
        final result = await hiveCacheService.clear();

        // Assert
        expect(result, const ApiResult<void>.success(null));

        verify(() => mockBox.clear()).called(1);

        verify(
          () => mockLogger.logInfo(
            any(that: contains("Attempting to CLEAR")),
            source: 'HiveCacheService',
          ),
        ).called(1);

        verify(
          () => mockLogger.logInfo(
            any(that: contains("Successfully CLEARED")),
            source: 'HiveCacheService',
          ),
        ).called(1);
      },
    );

    test(
      "On HiveError case, should return cache failure for HiveError and do the logging",
      () async {
        // ARRANGE
        final response = HiveError("A hive error occured");
        when(() => mockBox.clear()).thenThrow(response);

        // ACT
        final result = await hiveCacheService.clear();

        // Assert
        expect(result, const ApiResult<void>.failure(ApiFailure.cache()));

        verify(() => mockBox.clear()).called(1);

        verify(
          () => mockLogger.logInfo(
            any(that: contains("Attempting to CLEAR")),
            source: 'HiveCacheService',
          ),
        ).called(1);

        verify(
          () => mockLogger.logError(
            any(that: contains("Failed to CLEAR")),
            error: response,
            stackTrace: any(named: 'stackTrace'),
            source: 'HiveCacheService',
          ),
        ).called(1);
      },
    );

    test(
      "On exception case, should return unknown failure for any exception and do the logging",
      () async {
        // ARRANGE
        final response = Exception("An exception occured");
        when(() => mockBox.clear()).thenThrow(response);

        // ACT
        final result = await hiveCacheService.clear();

        // Assert
        expect(result, const ApiResult<void>.failure(ApiFailure.unknown()));

        verify(() => mockBox.clear()).called(1);

        verify(
          () => mockLogger.logInfo(
            any(that: contains("Attempting to CLEAR")),
            source: 'HiveCacheService',
          ),
        ).called(1);

        verify(
          () => mockLogger.logError(
            any(that: contains("Unknown error CLEAR")),
            error: response,
            stackTrace: any(named: 'stackTrace'),
            source: 'HiveCacheService',
          ),
        ).called(1);
      },
    );
  });
}
