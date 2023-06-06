// ignore_for_file: library_private_types_in_public_api
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../viewModel/base_view_model.dart';

class BaseView<T extends ChangeNotifier> extends StatefulWidget {
  const BaseView(
      {Key? key,
      required this.viewModel,
      required this.onPageBuilder,
      this.onModelReady,
      this.onDispose,
      this.justConsumer})
      : super(key: key);
  final Widget Function(BuildContext context, T model, Widget? child)
      onPageBuilder;
  final T viewModel;
  final void Function(T model)? onModelReady;
  final VoidCallback? onDispose;
  final bool? justConsumer;

  @override
  _BaseViewState<T> createState() => _BaseViewState<T>();
}

class _BaseViewState<T extends ChangeNotifier> extends State<BaseView<T>> {
  @override
  void initState() {
    (widget.viewModel as BaseViewModel).viewModelContext = context;
    if (widget.onModelReady != null) widget.onModelReady!(widget.viewModel);
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    if (widget.onDispose != null) widget.onDispose?.call();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.justConsumer == true) {
      return Consumer<T>(
        builder: widget.onPageBuilder,
      );
    } else {
      return ChangeNotifierProvider<T>(
        create: (context) => widget.viewModel,
        child: Consumer<T>(
          builder: widget.onPageBuilder,
        ),
      );
    }
  }
}
