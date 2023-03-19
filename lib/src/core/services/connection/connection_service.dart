import 'dart:async';
import 'package:provider/provider.dart';
import '../../../common/viewModels/connection_view_model.dart';
import '../../constants/enums/network_results_enums.dart';
import 'packages/connectivity_service.dart';
import 'packages/internet_connection_checker_service.dart';

class ConnectionService {
  ConnectionService._init();

  static final ConnectionService _instance = ConnectionService._init();

  static ConnectionService get instance => _instance;

  Future<void> handleNetworkChange(context) async {
    // eğer internet ilk başta yoksa diye
    // connected kısmını beklemeden false yapıyoruz
    var isConnect = await ConnectivityService.instance.checkConnectivity();
    if (isConnect.name == 'none') {
      Provider.of<ConnectionViewModel>(context, listen: false)
          .changeNetworkResult(NetworkResult.off);
    }
    ConnectivityService.instance.listenConnectivity(context);
    InternetConnectionCheckerService.instance.listenConnection(context);
  }

  void dispose() {
    ConnectivityService.instance.cancel();
  }
}
