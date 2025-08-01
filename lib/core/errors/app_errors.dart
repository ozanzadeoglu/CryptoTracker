/// App-level error types that are displayed to users.
///
/// These errors represent user-facing error scenarios that require user
/// communication. Each error type has localized messages and is passed
/// through [ApiResult] to provide consistent error handling across the app.
///
/// **Important**: This enum is STRICTLY for errors that will be shown to users.
/// Technical errors, cache failures, and internal issues should NOT use
/// this enum - they should be handled silently without user communication.
///
/// ## Usage
/// 
/// Errors are created in infrastructure services and data sources, then passed
/// through repositories to the UI:
/// 
/// ```dart
/// // In infrastructure service (ApiClient, HiveCacheService)
/// return ApiResult.failure(
///   ApiFailure.network(error: AppError.networkConnection),
/// );
/// 
/// // Cache failure - NO AppError (handle silently)
/// return ApiResult.failure(
///   ApiFailure.cache(), // No error field - handle silently
/// );
/// 
/// // In data source
/// return ApiResult.failure(
///   ApiFailure.unknown(error: AppError.unknown),
/// );
/// 
/// // In repository (translates infrastructure errors to feature context)
/// case Failure(failure: final error):
///   return ApiResult.failure(
///     ApiFailure.network(error: AppError.noOfflineSearch),
///   );
/// 
/// // In UI
/// if (result is Failure) {
///   final userMessage = result.failure.error?.localized(context);
///   // Display userMessage to user if error is not null
/// }
/// ```
///
/// ## Error Flow
/// 
/// 1. **Infrastructure Services** (ApiClient, HiveCacheService)
///    - Create technical errors with logging
///    - May include error for network/server issues
///    - Cache failures have NO error field (handle silently)
/// 
/// 2. **Data Sources** (RemoteDataSource, LocalDataSource)
///    - Use infrastructure services
///    - May create feature-specific errors
/// 
/// 3. **Repositories**
///    - Translate infrastructure errors to feature context
///    - Provide appropriate error for the feature
/// 
/// 4. **UI Layer**
///    - Display error messages to users
///    - Handle retry actions
///
/// ## When to Use AppError
/// 
/// ✅ **Use AppError when:**
/// - User can take action (retry, check connection)
/// - User needs to understand why something failed
/// - Error is temporary and user can resolve it
/// 
/// ❌ **Do NOT use AppError when:**
/// - Error is technical/internal
/// - App can handle it silently
/// - User cannot do anything about it
/// - Cache failures, data corruption, etc.
///
/// ## Examples of Silent Errors
/// 
/// ```dart
/// // Cache write failure - handle silently
/// return ApiResult.failure(ApiFailure.cache());
/// 
/// // Cache read failure - handle silently
/// return ApiResult.failure(ApiFailure.cache());
/// 
/// // Unknown technical error - handle silently
/// return ApiResult.failure(ApiFailure.unknown());
/// ```
///
/// ## Localization
/// 
/// Each error type has a localized message defined in the app's
/// localization files. Use the [localized] extension method to get
/// the user-friendly message:
/// 
/// ```dart
/// final message = AppError.networkConnection.localized(context);
/// ```
///
/// ## Error Categories
/// 
/// - **Network errors**: User can retry (check connection, try again)
/// - **Server errors**: User can retry later (server temporarily down)
/// - **General errors**: Generic fallback for unexpected issues
///
/// ## Silent Error Handling
/// 
/// Most [ApiFailure] types should NOT have error:
/// - [ApiFailure.cache] - Handle silently with fallbacks
/// - [ApiFailure.unknown] - Log only, show generic message if needed
/// - Technical infrastructure errors - Log and handle silently
enum AppError {
  /// Network connectivity issues that users can resolve.
  /// 
  /// Examples: No internet connection, connection timeout.
  /// Users can check their connection and retry.
  noNetworkConnection,

  /// Server errors that are temporary.
  /// 
  /// Examples: Server temporarily unavailable, rate limiting.
  /// Users can retry the operation later.
  serverUnavailable,

  // Market feature specific errors.

  /// Displayed when users tries to use search feature
  /// while offline.
  noOfflineSearch
}