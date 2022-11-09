const internetConnectionCheckerService = """
import 'dart:io';
import 'package:get/get.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import '../../../constants/enums/network_result_enums.dart';
import '../controller/network_cache_controller.dart';

class InternetConnectionCheckerService {
  InternetConnectionChecker checker = InternetConnectionChecker();
  NetworkCacheController networkCacheController =
      Get.find<NetworkCacheController>();

  listenConnection() {
    checker.onStatusChange.listen((event) {
      // internet çektiği halde yoksa diğer taraf bunu algılamıyor
      // ama bu taraf bunu algılayıp disconnected hatası veriyor
      if (event.name == 'disconnected') {
        networkCacheController.networkResult = NetworkResult.off;
      } else if (event.name == 'connected') {
        networkCacheController.networkResult = NetworkResult.on;
      }
    });
  }

  Future<void> checkInternet(shouldConnect) async {
    try {
      if (shouldConnect == true) {
        var result = await checker.connectionStatus;
        if (result == InternetConnectionStatus.connected) {
          networkCacheController.networkResult = NetworkResult.on;
        } else {
          networkCacheController.networkResult = NetworkResult.off;
        }
      } else {
        networkCacheController.networkResult = NetworkResult.off;
      }
    } on SocketException catch (_) {
      networkCacheController.networkResult = NetworkResult.off;
    }
  }
}
    """;
