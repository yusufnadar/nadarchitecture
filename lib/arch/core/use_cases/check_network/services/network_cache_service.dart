const networkCacheService =
    """
import 'dart:async';
import '../../../constants/enums/network_result_enums.dart';
import 'connectivity_service.dart';
import 'internet_connection_checker_service.dart';

class NetworkCacheService
    with InternetConnectionCheckerService, ConnectivityService {
  Future<void> handleNetworkChange() async {
    // eğer internet ilk başta yoksa diye
    // connected kısmını beklemeden false yapıyoruz
    var isConnect = await checkConnectivity();
    if (isConnect.name == 'none') {
      networkCacheController.networkResult = NetworkResult.off;
    }
    listenConnectivity();
    listenConnection();
  }

  void dispose() {
    cancel();
  }
}
    """;