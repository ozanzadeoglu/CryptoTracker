/// Defines the contract for a service that monitors network connectivity.
abstract class IConnectivityService {
  /// A stream that emits `true` if the device has an active network connection
  /// (WiFi or Mobile) and `false` otherwise.
  Stream<bool> get isOnlineStream;

  /// A synchronous getter to check the current connectivity status.
  /// Useful for one-off checks where listening to a stream is not necessary.
  bool get isOnline;
  
  /// Performs an initial check of the connectivity status.
  /// This should be called once at app startup.
  Future<void> initialize();

  /// Disposes of any resources, like stream controllers.
  void dispose();
}