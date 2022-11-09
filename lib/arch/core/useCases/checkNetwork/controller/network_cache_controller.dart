const networkCacheController = """
import 'package:get/get.dart';
import '../../../constants/enums/network_result_enums.dart';

class NetworkCacheController extends GetxController {
  final _networkResult = Rxn<NetworkResult>();

  NetworkResult? get networkResult => _networkResult.value;

  set networkResult(NetworkResult? networkResult) =>
      _networkResult.value = networkResult;
}
    """;
