import 'dart:async';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'internet_connection_checker_service.dart';

class ConnectivityService {
  final _connectivity = Connectivity();
  StreamSubscription<ConnectivityResult>? _subscription;

  ConnectivityService._init();

  static final ConnectivityService _instance = ConnectivityService._init();

  static ConnectivityService get instance => _instance;

  //final networkCacheController = Get.find<NetworkCacheController>();
  final checkerService = InternetConnectionCheckerService.instance;

  Future<ConnectivityResult> checkConnectivity() async {
    return await _connectivity.checkConnectivity();
  }

  void listenConnectivity(context) {
    _subscription = _connectivity.onConnectivityChanged.listen((event) {
      switch (event) {
        case ConnectivityResult.bluetooth:
        case ConnectivityResult.wifi:
        case ConnectivityResult.ethernet:
        case ConnectivityResult.mobile:
        case ConnectivityResult.vpn:
          // eğer kaynak değişiminde internet varsa direkt bağlansın diye
          // connected kısmını beklemeden true yapıyoruz
          checkerService.checkInternet(true,context);
          break;
        case ConnectivityResult.none:
        case ConnectivityResult.other:
          checkerService.checkInternet(false,context);
          break;
      }
    });
  }

  void cancel() {
    _subscription?.cancel();
  }
}
