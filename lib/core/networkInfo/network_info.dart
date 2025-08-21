import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:injectable/injectable.dart';

abstract class NetworkInfo {
  Future<bool> get isConnected;
}

@LazySingleton(as: NetworkInfo)
class InternetInfo implements NetworkInfo {
  final Connectivity connectionChecker;
  InternetInfo(this.connectionChecker);

  @override
  Future<bool> get isConnected async {
    final connResult = await connectionChecker.checkConnectivity();
    if (connResult.contains(ConnectivityResult.mobile) ||
        connResult.contains(ConnectivityResult.wifi) ||
        connResult.contains(ConnectivityResult.ethernet)) {
      return true;
    } else {
      return false;
    }
  }
}
