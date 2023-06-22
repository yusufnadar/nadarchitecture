const baseViewModel = """
import 'package:flutter/material.dart';
import '../../services/network/network_service.dart';

// State management sınıfları için base bir viewModel
mixin BaseViewModel {
  late BuildContext viewModelContext;
  NetworkService? networkService = NetworkService.instance!;
}

""";
