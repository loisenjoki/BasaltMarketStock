import 'package:connectivity/connectivity.dart';
import 'package:flutter/cupertino.dart';

class NetworkProvider extends ChangeNotifier {

  bool _isConnected = true;

  bool get isConnected => _isConnected;

  void checkConnectivity() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    _isConnected = (connectivityResult != ConnectivityResult.none);
    notifyListeners();
  }
}