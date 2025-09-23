import 'dart:async';
import 'dart:io';

import 'package:connectivity_plus/connectivity_plus.dart';

/// Network connectivity information and monitoring
abstract class NetworkInfo {
  Future<bool> get isConnected;
  Stream<bool> get onConnectivityChanged;
  Future<ConnectionType> get connectionType;
}

/// Connection types
enum ConnectionType { none, wifi, mobile, ethernet, bluetooth, vpn, other }

/// Implementation of NetworkInfo
class NetworkInfoImpl implements NetworkInfo {
  NetworkInfoImpl(this._connectivity);
  final Connectivity _connectivity;

  @override
  Future<bool> get isConnected async {
    final result = await _connectivity.checkConnectivity();
    return result != ConnectivityResult.none;
  }

  @override
  Stream<bool> get onConnectivityChanged => _connectivity.onConnectivityChanged
      .map((result) => result != ConnectivityResult.none);

  @override
  Future<ConnectionType> get connectionType async {
    final result = await _connectivity.checkConnectivity();
    return _mapConnectivityResult(result as ConnectivityResult);
  }

  /// Convert ConnectivityResult to ConnectionType
  ConnectionType _mapConnectivityResult(ConnectivityResult result) {
    switch (result) {
      case ConnectivityResult.none:
        return ConnectionType.none;
      case ConnectivityResult.wifi:
        return ConnectionType.wifi;
      case ConnectivityResult.mobile:
        return ConnectionType.mobile;
      case ConnectivityResult.ethernet:
        return ConnectionType.ethernet;
      case ConnectivityResult.bluetooth:
        return ConnectionType.bluetooth;
      case ConnectivityResult.vpn:
        return ConnectionType.vpn;
      case ConnectivityResult.other:
        return ConnectionType.other;
    }
  }
}

/// Enhanced network info with additional capabilities
class EnhancedNetworkInfo extends NetworkInfoImpl {
  EnhancedNetworkInfo(super.connectivity);

  /// Check if device can reach a specific host
  Future<bool> canReachHost(
    String host, {
    int port = 80,
    Duration timeout = const Duration(seconds: 5),
  }) async {
    try {
      final socket = await Socket.connect(host, port, timeout: timeout);
      socket.destroy();
      return true;
    } catch (e) {
      return false;
    }
  }

  /// Get network speed estimation (rough)
  Future<NetworkSpeed> estimateNetworkSpeed() async {
    if (!await isConnected) {
      return NetworkSpeed.none;
    }

    final connectionType = await this.connectionType;

    switch (connectionType) {
      case ConnectionType.wifi:
        return NetworkSpeed.fast;
      case ConnectionType.mobile:
        return NetworkSpeed
            .medium; // This could be enhanced with more detailed mobile network info
      case ConnectionType.ethernet:
        return NetworkSpeed.fast;
      default:
        return NetworkSpeed.slow;
    }
  }

  /// Check if connection is metered (mobile data)
  Future<bool> get isMetered async {
    final connectionType = await this.connectionType;
    return connectionType == ConnectionType.mobile;
  }

  /// Get detailed connection info
  Future<NetworkDetails> getNetworkDetails() async {
    final isConnected = await this.isConnected;
    final connectionType = await this.connectionType;
    final isMetered = await this.isMetered;
    final speed = await estimateNetworkSpeed();

    return NetworkDetails(
      isConnected: isConnected,
      connectionType: connectionType,
      isMetered: isMetered,
      estimatedSpeed: speed,
    );
  }
}

/// Network speed estimation
enum NetworkSpeed { none, slow, medium, fast }

/// Comprehensive network details
class NetworkDetails {
  const NetworkDetails({
    required this.isConnected,
    required this.connectionType,
    required this.isMetered,
    required this.estimatedSpeed,
  });
  final bool isConnected;
  final ConnectionType connectionType;
  final bool isMetered;
  final NetworkSpeed estimatedSpeed;

  @override
  String toString() =>
      'NetworkDetails(isConnected: $isConnected, connectionType: $connectionType, isMetered: $isMetered, estimatedSpeed: $estimatedSpeed)';
}

/// Network monitoring service
class NetworkMonitor {
  NetworkMonitor(this._networkInfo);
  final NetworkInfo _networkInfo;
  final StreamController<NetworkDetails> _networkController =
      StreamController<NetworkDetails>.broadcast();
  StreamSubscription<bool>? _connectivitySubscription;

  /// Stream of network status changes
  Stream<NetworkDetails> get networkStream => _networkController.stream;

  /// Start monitoring network changes
  void startMonitoring() {
    _connectivitySubscription = _networkInfo.onConnectivityChanged.listen((
      isConnected,
    ) async {
      if (_networkInfo is EnhancedNetworkInfo) {
        final details = await _networkInfo.getNetworkDetails();
        _networkController.add(details);
      } else {
        final connectionType = await _networkInfo.connectionType;
        _networkController.add(
          NetworkDetails(
            isConnected: isConnected,
            connectionType: connectionType,
            isMetered: connectionType == ConnectionType.mobile,
            estimatedSpeed: isConnected
                ? NetworkSpeed.medium
                : NetworkSpeed.none,
          ),
        );
      }
    });
  }

  /// Stop monitoring network changes
  void stopMonitoring() {
    _connectivitySubscription?.cancel();
    _connectivitySubscription = null;
  }

  /// Dispose resources
  void dispose() {
    stopMonitoring();
    _networkController.close();
  }
}
