import 'package:flutter/material.dart';
import '../../core/extensions/context_extension.dart';
import 'package:provider/provider.dart';
import '../../core/base/view/base_view.dart';
import '../../core/exports/constants_exports.dart';
import '../../core/services/connection/connection_service.dart';
import '../viewModels/connection_view_model.dart';

class NoNetworkWidget extends StatelessWidget {
  const NoNetworkWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseView<ConnectionViewModel>(
      viewModel: ConnectionViewModel(),
      onModelReady: (model) {
        ConnectionService.instance.handleNetworkChange(context);
      },
      onDispose: () {
        ConnectionService.instance.dispose();
      },
      onPageBuilder: (widget, model, child) {
        if (context.watch<ConnectionViewModel>().networkResult ==
            NetworkResult.off) {
          return GestureDetector(
            onTap: () => model.changeNetworkResult(NetworkResult.on),
            child: Container(
              height: context.height * 0.05,
              width: context.width,
              color: ColorConstants.red,
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.symmetric(
                horizontal: context.width * 0.08,
              ),
              child: DefaultTextStyle(
                style: TextStyleConstants.mediumStyle(
                  color: ColorConstants.white,
                ),
                child: const Text(
                  'No Internet Connection',
                ),
              ),
            ),
          );
        } else {
          return const SizedBox.shrink();
        }
      },
    );
  }
}
