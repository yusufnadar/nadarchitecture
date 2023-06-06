import 'package:flutter/material.dart';
import '../../services/network/network_service.dart';

abstract class BaseViewModel {
  late BuildContext viewModelContext;
  NetworkService? networkService = NetworkService.instance!;
}
