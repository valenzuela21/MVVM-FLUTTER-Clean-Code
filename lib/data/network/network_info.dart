import 'dart:async';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';

abstract class NetworkInfo {
  Future<bool> get isConnected;
  Future<bool> connect();
}

class NetworkInfoImpl implements NetworkInfo {
  final InternetConnection _connectivity;
  late StreamSubscription<InternetStatus> _statusSubscription;
  bool _isConnected = false;

  NetworkInfoImpl(this._connectivity);

  @override
  Future<bool> connect() async => _isConnected;

  @override
  Future<bool> get isConnected async => await _connectivity.hasInternetAccess;

  @override
  Stream<InternetStatus> get statusStream => _connectivity.onStatusChange;

  void startListening() {
    _statusSubscription = _connectivity.onStatusChange.listen((InternetStatus status) {
      switch (status) {
        case InternetStatus.connected:
          _isConnected = true;
          break;
        case InternetStatus.disconnected:
          _isConnected = false;
          break;
      }
    });
  }

  void stopListening() {
    _statusSubscription.cancel();
  }
}