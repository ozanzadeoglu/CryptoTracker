import 'dart:async';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:crypto_tracker/core/connectivity/i_connectivity_service.dart';

/// An implementation of [IConnectivityService] that uses the `connectivity_plus` package.
class ConnectivityServiceImpl implements IConnectivityService {
  final Connectivity _connectivity = Connectivity();
  final _controller = StreamController<bool>.broadcast();
  
  bool _isOnline = true; // Assume online by default until the first check.

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
    _updateConnectionStatus(result);
  }

  void _updateConnectionStatus(List<ConnectivityResult> result) {
    // We consider the device "online" if it's connected to either WiFi or mobile data.
    final hasConnection = result.contains(ConnectivityResult.mobile) || 
                          result.contains(ConnectivityResult.wifi);
    
    // Only emit a new value if the connectivity status has actually changed.
    if (hasConnection != _isOnline) {
      _isOnline = hasConnection;
      _controller.add(_isOnline);
    }
  }

  @override
  void dispose() {
    _controller.close();
  }
}