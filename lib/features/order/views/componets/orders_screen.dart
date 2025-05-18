import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:landmark_assignment/core/base/base_view.dart';
import 'package:landmark_assignment/core/util/logger/logger_helper.dart';
import 'package:landmark_assignment/core/util/value/size_config.dart';
import 'package:landmark_assignment/features/home/views/bloc/home_screen/homescreen_state.dart';
import 'package:landmark_assignment/features/order/viewmodels/orders_view_model.dart';
import 'package:landmark_assignment/features/order/views/bloc/order_detail_bloc.dart';
import 'package:landmark_assignment/features/order/views/bloc/order_detail_event.dart';
import 'package:landmark_assignment/features/order/views/bloc/order_detail_state.dart';
import 'package:landmark_assignment/features/order/views/componets/oder_deatils_Card_widget.dart';
import 'package:landmark_assignment/features/product/views/components/offer_carousel_and_categories.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:lottie/lottie.dart';

class OrdersScreen extends BaseView<OrdersViewModel> {
  OrdersScreen({super.key});

  OrderDetailBloc? orderDetailBloc;

  @override
  void initState(OrdersViewModel viewModel) {
    super.initState(viewModel);
  }

  @override
  Widget build(BuildContext context, OrdersViewModel viewModel) {
    orderDetailBloc = BlocProvider.of<OrderDetailBloc>(context);
    orderDetailBloc!.add(LoadOrders(viewModel));
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12),
            child: Text(
              "Order Details",
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
          ),
          Expanded(
            child: BlocBuilder<OrderDetailBloc, OrderDetailState>(
              builder: (BuildContext context, state) {
                if (state is OrdersListLoaded) {
                  if (viewModel.userOrders[viewModel.userIndex]?.products?.isNotEmpty ?? false) {
                    return ListView.builder(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      itemCount: viewModel.userOrders[viewModel.userIndex]!.products!.length,
                      itemBuilder: (context, index) {
                        final order = viewModel.userOrders[viewModel.userIndex]!.products![index];
                        return OderDeatilsCardWidget(
                          key: ValueKey(order.productId),
                          productId: order.productId ?? 0,
                          quantity: order.quantity ?? 0,
                          isOrderCancellable: true,
                          onCancelOrder: () {
                            orderDetailBloc?.add(CancelOrder(viewModel, order));
                          },
                        );
                      },
                    );
                  } else {
                    return Center(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Lottie.asset(
                            'assets/animations/no_data.json',
                            width: 200,
                            height: 200,
                            repeat: true,
                          ),
                          const SizedBox(height: 16),
                          const Text(
                            "No orders available.",
                            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                    );
                  }
                } else {
                  return Center(
                    child: Lottie.asset(
                      'assets/animations/order_loading.json',
                      width: 150,
                      height: 150,
                      fit: BoxFit.contain,
                    ),
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }


  @override
  OrdersViewModel createViewModel() {
    return OrdersViewModel();
  }
}
