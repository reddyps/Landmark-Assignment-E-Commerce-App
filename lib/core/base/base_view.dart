import 'package:flutter/widgets.dart';
import 'package:landmark_assignment/core/base/base_viewmodel.dart';

abstract class BaseView<T extends BaseViewModel> extends StatefulWidget {
  const BaseView({Key? key}) : super(key: key);

  @override
  State<BaseView<T>> createState() => _BaseViewState<T>();

  T createViewModel();

  Widget build(BuildContext context, T viewModel);

  void initState(T viewModel) {}

  void dispose(T viewModel) {}
}

class _BaseViewState<T extends BaseViewModel> extends State<BaseView<T>>
    with WidgetsBindingObserver {
  late T viewModel;

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
    viewModel.handleAppLifecycleState(state);
  }

  @override
  void dispose() {
    viewModel.dispose();
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    viewModel = widget.createViewModel();
    widget.initState(viewModel);
  }

  @override
  Widget build(BuildContext context) {
    viewModel.context = context;
    return widget.build(context, viewModel);
  }
}
