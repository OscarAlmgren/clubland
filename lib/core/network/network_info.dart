import 'dart:async';
import 'dart:io';

import 'package:connectivity_plus/connectivity_plus.dart';

/// Network connectivity information and monitoring contract.
///
/// This abstract class defines the core methods for checking current
/// network status and listening for changes.
abstract class NetworkInfo {
  /// Returns the current connection status.
  ///
  /// Returns `true` if any form of network connectivity is available.
  Future<bool> get isConnected;

  /// A broadcast stream that emits `true` or `false` whenever the device's
  /// network connectivity status changes.
  Stream<bool> get onConnectivityChanged;

  /// Returns the specific type of network connection currently active.
  Future<ConnectionType> get connectionType;
}

/// Defines the possible types of network connection.
enum ConnectionType {
  /// No connection is available.
  none,

  /// Connected via Wi-Fi.
  wifi,

  /// Connected via mobile data (cellular).
  mobile,

  /// Connected via a wired Ethernet cable.
  ethernet,

  /// Connected via Bluetooth (tethering/PAN).
  bluetooth,

  /// Connected via a Virtual Private Network.
  vpn,

  /// Other connection types not explicitly listed.
  other,
}

/// Concrete implementation of [NetworkInfo] using the `connectivity_plus` package.
class NetworkInfoImpl implements NetworkInfo {
  /// Constructs a [NetworkInfoImpl] with the required `connectivity_plus` dependency.
  NetworkInfoImpl(this._connectivity);

  /// The underlying connectivity package instance.
  final Connectivity _connectivity;

  @override
  Future<bool> get isConnected async {
    // FIX: checkConnectivity returns Future<List<ConnectivityResult>>
    final results = await _connectivity.checkConnectivity();

    // Return true if the list is NOT empty and does not only contain 'none'
    return results.isNotEmpty && !results.contains(ConnectivityResult.none);
  }

  @override
  Stream<bool> get onConnectivityChanged =>
      _connectivity.onConnectivityChanged
      // FIX: Check if the list of results is NOT empty.
      // An empty list (or a list containing only 'none') means no connection.
      .map(
        (results) =>
            results.isNotEmpty && !results.contains(ConnectivityResult.none),
      );

  @override
  Future<ConnectionType> get connectionType async {
    final result = await _connectivity.checkConnectivity();
    return _mapConnectivityResult(result as ConnectivityResult);
  }

  /// Converts [ConnectivityResult] from the package to the internal [ConnectionType] enum.
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

/// Enhanced network info with additional capabilities like host reachability and speed estimation.
class EnhancedNetworkInfo extends NetworkInfoImpl {
  /// Constructs an [EnhancedNetworkInfo].
  EnhancedNetworkInfo(super.connectivity);

  /// Checks if the device can successfully connect to a specific host and port.
  ///
  /// This is useful for checking actual internet access, not just device connectivity.
  Future<bool> canReachHost(
    String host, {
    int port = 80,
    Duration timeout = const Duration(seconds: 5),
  }) async {
    try {
      final socket = await Socket.connect(host, port, timeout: timeout);
      socket.destroy();
      return true;
    } on Exception {
      return false;
    }
  }

  /// Provides a rough estimation of the current network speed based on connection type.
  Future<NetworkSpeed> estimateNetworkSpeed() async {
    if (!await isConnected) {
      return NetworkSpeed.none;
    }

    final connectionType = await this.connectionType;

    switch (connectionType) {
      case ConnectionType.wifi:
      case ConnectionType.ethernet:
        return NetworkSpeed.fast;

      case ConnectionType.mobile:
      case ConnectionType.vpn:
        // This could be enhanced with more detailed mobile network info
        return NetworkSpeed.medium;

      // FIX: Explicitly list remaining ConnectionType values instead of 'default'
      case ConnectionType.bluetooth:
      case ConnectionType.other:
        return NetworkSpeed.slow;

      case ConnectionType.none:
        return NetworkSpeed.none;
    }
  }

  /// Returns `true` if the current connection is considered metered (e.g., mobile data).
  Future<bool> get isMetered async {
    final connectionType = await this.connectionType;
    return connectionType == ConnectionType.mobile;
  }

  /// Retrieves a comprehensive object containing all available network details.
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

/// Defines the general categories for network speed estimation.
enum NetworkSpeed {
  /// No connection.
  none,

  /// Very slow or heavily constrained connection.
  slow,

  /// Average mobile or standard Wi-Fi connection.
  medium,

  /// High-speed or wired connection.
  fast,
}

/// Comprehensive network details gathered at a specific point in time.
class NetworkDetails {
  /// Constructs a [NetworkDetails] object.
  const NetworkDetails({
    required this.isConnected,
    required this.connectionType,
    required this.isMetered,
    required this.estimatedSpeed,
  });

  /// The current general connectivity status.
  final bool isConnected;

  /// The type of network connection active.
  final ConnectionType connectionType;

  /// Indicates if the connection is metered (e.g., mobile data).
  final bool isMetered;

  /// The estimated speed category of the connection.
  final NetworkSpeed estimatedSpeed;

  /// Returns a string representation of the network details.
  @override
  String toString() =>
      'NetworkDetails(isConnected: $isConnected, connectionType: $connectionType, isMetered: $isMetered, estimatedSpeed: $estimatedSpeed)';
}

/// Service that actively monitors and streams detailed network status changes.
class NetworkMonitor {
  /// Constructs a [NetworkMonitor].
  NetworkMonitor(this._networkInfo);

  /// The underlying network information provider.
  final NetworkInfo _networkInfo;

  /// The controller managing the stream of network status updates.
  final StreamController<NetworkDetails> _networkController =
      StreamController<NetworkDetails>.broadcast();

  StreamSubscription<bool>? _connectivitySubscription;

  /// A broadcast stream that emits a comprehensive [NetworkDetails] object
  /// whenever the network status changes.
  Stream<NetworkDetails> get networkStream => _networkController.stream;

  /// Starts listening to network changes and pushing updates to [networkStream].
  void startMonitoring() {
    _connectivitySubscription = _networkInfo.onConnectivityChanged.listen((
      isConnected,
    ) async {
      // Use EnhancedNetworkInfo's full details if available
      if (_networkInfo is EnhancedNetworkInfo) {
        final details = await _networkInfo.getNetworkDetails();
        _networkController.add(details);
      } else {
        // Fallback for basic NetworkInfo implementation
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

  /// Stops monitoring network changes and cancels the subscription.
  void stopMonitoring() {
    _connectivitySubscription?.cancel();
    _connectivitySubscription = null;
  }

  /// Disposes of the network stream controller and stops monitoring.
  void dispose() {
    stopMonitoring();
    _networkController.close();
  }
}
