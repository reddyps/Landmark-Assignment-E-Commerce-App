import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:injectable/injectable.dart';
import 'package:landmark_assignment/core/base/base_viewmodel.dart';

import '../../../core/util/logger/logger_helper.dart';
import '../../cart/models/model/orders/cart_model.dart';
import '../models/model/orders/payment_model.dart';
import '../models/repository/payment_repository.dart';


@singleton
class PaymentViewModel extends BaseViewModel { // Changed to ChangeNotifier
  final className = "PaymentViewModel";

  late List<Products> selectedItems;

   createPaymentIntent(double amount) async {
    try {
      var model = await PaymentRepository().createPaymentIntent(PaymentModel(amount: amount.toString(),currency: "inr"));
      // if (model.statusCode == 200) {
      //   _originalOrders = model.userOrders!;
      //   userOrders = model.userOrders!
      //       .map((order) => order.copyWith(products: List<Products>.from(order.products ?? [])))
      //       .toList();
      // }

      return model;
    } catch (e) {
      loge(tag: className, message: "createPaymentIntent error: $e");
    }
  }

  Future<void> makePayment(double amount) async {
    try {
      final paymentIntent = await createPaymentIntent(amount);
      if (paymentIntent == null || !paymentIntent.containsKey('client_secret')) {
        throw Exception('Payment intent creation failed');
      }

      await Stripe.instance.initPaymentSheet(
        paymentSheetParameters: SetupPaymentSheetParameters(
          paymentIntentClientSecret: paymentIntent['client_secret'],
          style: ThemeMode.dark,
          merchantDisplayName: 'LandMark',
        ),
      );

      await Stripe.instance.presentPaymentSheet();
    } catch (err) {
      loge(tag: className, message: "makePayment error: $err");
      throw Exception('Payment failed: $err');
    }
  }


  @override
  void dispose() {
    super.dispose();
  }
}

