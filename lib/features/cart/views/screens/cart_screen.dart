import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:landmark_assignment/core/base/base_view.dart';
import 'package:landmark_assignment/core/util/logger/logger_helper.dart';
import 'package:landmark_assignment/features/cart/viewmodels/cart_view_model.dart';
import 'package:landmark_assignment/features/cart/views/bloc/cart_detail_bloc.dart';
import 'package:landmark_assignment/features/cart/views/bloc/cart_detail_event.dart';
import 'package:landmark_assignment/features/cart/views/bloc/cart_detail_state.dart';
import 'package:landmark_assignment/features/cart/views/componets/buy_now_button.dart';
import 'package:landmark_assignment/features/cart/views/componets/cart_itmes_deatils_Card_widget.dart';
import 'package:landmark_assignment/features/cart/views/componets/order_success_screen.dart';
import 'package:lottie/lottie.dart';
class CartScreen extends BaseView<CartViewModel> {
  CartScreen({super.key});

  CartDetailBloc? cartDetailBloc;
  @override
  void initState(CartViewModel viewModel) {
    super.initState(viewModel);
  }
  @override
  Widget build(BuildContext context, CartViewModel viewModel) {
    cartDetailBloc = BlocProvider.of<CartDetailBloc>(context);
    cartDetailBloc!.add(LoadCartDetail(viewModel));
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12),
            child: Text(
              "Cart Details",
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
          ),
          Expanded(
            child: BlocBuilder<CartDetailBloc, CartDetailState>(
              builder: (BuildContext context, state) {
                if (state is CartDetailLoaded) {
                  final cartItems = viewModel.userCart[viewModel.userIndex]?.products ?? [];
                  if (cartItems.isNotEmpty) {
                    return ListView(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      children: [
                        ...cartItems.map((cart) => CartItemsDeatilsCardWidget(
                          key: ValueKey(cart.productId),
                          isSelected: cart.isSelected,
                          viewModel: viewModel,
                          cartDetailBloc : cartDetailBloc!,
                          productId: cart.productId ?? 0,
                          initialQuantity: cart.quantity ?? 0,
                        )),
                        const SizedBox(height: 16),
                        BuyNowButton(
                          price: viewModel.totalAmount,
                          title: "Proceed to Buy",
                          subTitle: "Total Price",
                          press: () {
                            cartDetailBloc!.add(OrderCartDetail(viewModel));
                          },
                        ),
                        const SizedBox(height: 12),
                      ],
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
                            "No cart items available.",
                            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                    );
                  }
                }
                else if(state is CartDetailOrdered){
                  return OrderSuccessScreen();
                }
                else {
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
  CartViewModel createViewModel() {
    return CartViewModel();
  }
}
