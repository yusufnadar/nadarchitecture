import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../utils/helpers/text_styles.dart';
import '../../../constants/colors.dart';
import '../../../constants/enums/network_result_enums.dart';
import '../controller/network_cache_controller.dart';
import '../services/network_cache_service.dart';

class NoNetworkWidget extends StatelessWidget {
  NoNetworkWidget({super.key});

  final networkCacheService = NetworkCacheService();

  @override
  Widget build(BuildContext context) {
    return GetX<NetworkCacheController>(
      init: NetworkCacheController(),
      initState: (func) {
        networkCacheService.handleNetworkChange();
      },
      dispose: (func) {
        networkCacheService.dispose();
      },
      builder: (controller) {
        if (controller.networkResult == NetworkResult.off) {
          return Container(
            height: Get.height * 0.05,
            width: Get.width,
            color: AppColors.green,
            alignment: Alignment.centerLeft,
            padding: EdgeInsets.symmetric(horizontal: Get.width * 0.08),
            child: DefaultTextStyle(
              style: Styles.mediumFontStyle(color: AppColors.white),
              child: const Text(
                'No Internet Connection',
              ),
            ),
          );
        } else {
          return const SizedBox();
        }
      },
    );
  }
}
    