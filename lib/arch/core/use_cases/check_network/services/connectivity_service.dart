const connectivityService =
    """
import 'dart:async';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:get/get.dart';
import '../controller/network_cache_controller.dart';
import 'internet_connection_checker_service.dart';

class ConnectivityService {
  final Connectivity _connectivity = Connectivity();
  StreamSubscription<ConnectivityResult>? _subscription;
  final networkCacheController = Get.find<NetworkCacheController>();
  final checkerService = InternetConnectionCheckerService();

  Future<ConnectivityResult> checkConnectivity() async {
    return await _connectivity.checkConnectivity();
  }

  listenConnectivity() {
    _subscription = _connectivity.onConnectivityChanged.listen((event) {
      switch (event) {
        case ConnectivityResult.bluetooth:
        case ConnectivityResult.wifi:
        case ConnectivityResult.ethernet:
        case ConnectivityResult.mobile:
        case ConnectivityResult.vpn:
          // eğer kaynak değişiminde internet varsa direkt bağlansın diye
          // connected kısmını beklemeden true yapıyoruz
          checkerService.checkInternet(true);
          break;
        case ConnectivityResult.none:
          checkerService.checkInternet(false);
          break;
      }
    });
  }

  cancel() {
    _subscription?.cancel();
  }
}
    """;