import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:landmark_assignment/core/base/base_view.dart';
import 'package:landmark_assignment/core/util/value/constants.dart';
import 'package:landmark_assignment/features/payment/viewmodels/payment_view_model.dart';
import 'package:landmark_assignment/features/payment/views/componets/payment_items_details_Card_widget.dart';
import 'package:landmark_assignment/features/product/models/model/cart/cart_model.dart';

import '../../../cart/models/model/orders/cart_model.dart';
import '../../../cart/views/componets/buy_now_button.dart';
import '../bloc/payment_bloc.dart';
import 'order_success_screen.dart';

class PaymentScreen extends BaseView<PaymentViewModel> {
  final List<Products> selectedItems;

  PaymentScreen({super.key, required this.selectedItems});

  PaymentBloc? paymentBloc;

  @override
  void initState(PaymentViewModel viewModel) {
    viewModel.selectedItems = selectedItems;
    super.initState(viewModel);
  }

  @override
  Widget build(BuildContext context, PaymentViewModel viewModel) {
    paymentBloc = BlocProvider.of<PaymentBloc>(context);
    final double total = selectedItems.fold(
      0,
          (sum, item) => sum + ((item.price ?? 0) * (item.quantity ?? 1)),
    );

    return Scaffold(
      appBar: AppBar(title: const Text("Payment Summary")),
      body: BlocListener<PaymentBloc, PaymentState>(
        listener: (context, state) {
          if (state is PaymentSuccess) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => const OrderSuccessScreen(),
              ),
            );
          } else if (state is PaymentFailure) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text("Payment Failed: ${state.error}")),
            );
          }
        },
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Items in your order:",
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
              ),
            ),
            Expanded(
              child: ListView.separated(
                itemCount: selectedItems.length,
                itemBuilder: (context, index) {
                  final item = selectedItems[index];
                  return PaymentItemsDetailsCardWidget(
                    productId: item.productId ?? 0,
                    quantity: item.quantity ?? 1,
                    price: item.price ?? 0,
                  );
                },
                separatorBuilder: (_, __) => const Divider(),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    "Order Summary",
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  BlocBuilder<PaymentBloc, PaymentState>(
                    builder: (context, state) {
                      if (state is PaymentLoading) {
                        return const Center(child: CircularProgressIndicator());
                      }
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Text(
                            "Total: ${Constants.indianRupee}${total.toStringAsFixed(2)}",
                            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black),
                          ),
                          const SizedBox(height: 16),
                          Text(
                            "Shipping Address",
                            style: Theme.of(context).textTheme.titleSmall?.copyWith(
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const SizedBox(height: 4),
                          const Text(
                            "123, Main Street, Indiranagar, Bangalore, Karnataka - 560038",
                            style: TextStyle(color: Colors.black87),
                          ),
                          const SizedBox(height: 12),
                          Text(
                            "Billing Address",
                            style: Theme.of(context).textTheme.titleSmall?.copyWith(
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const SizedBox(height: 4),
                          const Text(
                            "456, Residency Road, MG Road, Bangalore, Karnataka - 560001",
                            style: TextStyle(color: Colors.black87),
                          ),
                          const SizedBox(height: 16),
                          BuyNowButton(
                            price: total,
                            title: "Pay Now",
                            subTitle: "Total Price",
                            press: () {
                              paymentBloc!.add(
                                StartPaymentEvent(
                                  amount: 100,
                                  paymentViewModel: viewModel,
                                ),
                              );
                            },
                          ),
                        ],
                      );
                    },
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  @override
  PaymentViewModel createViewModel() => PaymentViewModel();
}

