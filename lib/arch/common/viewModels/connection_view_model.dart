const connectionViewModel = """
import 'package:flutter/material.dart';
import '../../core/base/viewModel/base_view_model.dart';
import '../../core/exports/constants_exports.dart';

class ConnectionViewModel extends ChangeNotifier with BaseViewModel {
  NetworkResult? networkResult;

  void changeNetworkResult(networkResult) {
    this.networkResult = networkResult;
    notifyListeners();
  }
}
 """;
