import 'package:crypto_tracker/core/connectivity/i_connectivity_service.dart';
import 'package:crypto_tracker/core/network/api_result.dart';

/// A mixin to provide common data fetching logic for repositories.
///
/// It handles the core online/offline decision-making, allowing repositories to
/// simply define the remote and local fetch operations declaratively.
mixin RepositoryHelperMixin {
  /// The repository class that uses this mixin must provide an instance
  /// of [IConnectivityService] by overriding this getter.
  IConnectivityService get connectivityService;

  /// A generic helper to fetch data, prioritizing the remote source when online
  /// and falling back to the local source when offline.
  ///
  /// It takes two functions as parameters:
  /// - [remoteFetch]: The function to execute to get data from the network.
  /// - [localFetch]: The function to execute to get data from the local cache.
  Future<ApiResult<T>> fetchData<T>({
    required Future<ApiResult<T>> Function() remoteFetch,
    required Future<ApiResult<T>> Function() localFetch,
  }) async {
    if (connectivityService.isOnline) {
      final remoteResult = await remoteFetch();

      // In the future, you could add generic "cache-on-success" logic here.
      // For example, if the remote fetch was successful, you could call a
      // `cacheOnSuccess` method before returning.

      return remoteResult;
    } else {
      return await localFetch();
    }
  }
}
