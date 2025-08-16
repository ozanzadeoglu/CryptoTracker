import 'dart:async';
import 'package:http/http.dart' as http;
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:crypto_tracker/core/connectivity/i_connectivity_service.dart';

/// An implementation of [IConnectivityService] that uses the `connectivity_plus` package.
class ConnectivityServiceImpl implements IConnectivityService {
  final Connectivity _connectivity = Connectivity();
  final _controller = StreamController<bool>.broadcast();

  bool _isOnline = false; // Assume offline by default until the first check.

  @override
  Stream<bool> get isOnlineStream => _controller.stream;

  @override
  bool get isOnline => _isOnline;

  ConnectivityServiceImpl() {
    // Listen to the stream from the connectivity_plus package to detect changes.
    _connectivity.onConnectivityChanged.listen(_updateConnectionStatus);
  }

  @override
  Future<void> initialize() async {
    final result = await _connectivity.checkConnectivity();
    await _updateConnectionStatus(result);
  }

  Future<void> _updateConnectionStatus(List<ConnectivityResult> result) async {
    // TODO: Check which conditions this method is fired, may need to listen AppLifeCycle
    final hasConnection =
        result.contains(ConnectivityResult.mobile) ||
        result.contains(ConnectivityResult.wifi);

    // If device is connected to mobile or wifi, it's double checked with _checkInternetConnectivity method.
    final newIsOnline = hasConnection
        ? await _checkInternetConnectivity()
        : false;
    // Only emit a new value if the connectivity status has actually changed.
    if (newIsOnline != _isOnline) {
      _isOnline = newIsOnline;
      _controller.add(_isOnline);
    }
  }

  /// Performs an actual internet connectivity check using HTTP request.
  Future<bool> _checkInternetConnectivity() async {
    try {
      final response = await http
          .get(Uri.parse("https://clients3.google.com/generate_204"))
          .timeout(const Duration(seconds: 5));

      // Check for the expected 204 status code and an empty body.
      if (response.statusCode == 204 && response.body.isEmpty) {
        return true;
      } else {
        return false;
      }
    } on Exception catch (_) {
      // The request timed out.
      return false;
    }
  }

  @override
  void dispose() {
    _controller.close();
  }
}
