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

  final String testClientSecret = 'pi_3No4L9SGTdxZA1VV1YUsv9Sm_secret_tXJQ...';

   createPaymentIntent(double amount) async {
    try {
      var model = await PaymentRepository().createPaymentIntent(PaymentModel(amount: amount.toString(),currency: "INR"));
      return model;
    } catch (e) {
      loge(tag: className, message: "createPaymentIntent error: $e");
    }
  }

  Future<void> makePayment(double amount) async {
    try {
      var paymentIntent = createPaymentIntent(amount);
      await Stripe.instance.initPaymentSheet(
        paymentSheetParameters: SetupPaymentSheetParameters(
          paymentIntentClientSecret: paymentIntent['client_secret'],
          merchantDisplayName: 'Test Merchant',
          googlePay: const PaymentSheetGooglePay(
            merchantCountryCode: "IN",
            currencyCode: "INR",
            testEnv: true,
          ),
        ),
      );
      await Stripe.instance.presentPaymentSheet();
    } on StripeException catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
         SnackBar(content: Text('Stripe Exception: ${e.error.localizedMessage}')),
      );
      loge(message: 'Stripe Exception: ${e.error.localizedMessage}');
      return Future.error('Stripe Exception: ${e.error.localizedMessage}');
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
         SnackBar(content: Text("makePayment catch : ${e.toString()}")),
      );
      loge(message: "makePayment catch : ${e.toString()}");
      return Future.error('Unknown Exception: $e');
    }
  }

  Future<void> makeHardcodedPayment() async {
    try {
      // Initialize the payment sheet with the hardcoded client secret
      await Stripe.instance.initPaymentSheet(
        paymentSheetParameters: SetupPaymentSheetParameters(
          paymentIntentClientSecret: testClientSecret,
          merchantDisplayName: 'Test Merchant',
          googlePay: const PaymentSheetGooglePay(
            merchantCountryCode: "IN",
            currencyCode: "INR",
            testEnv: true,
          ),
        ),
      );

      // Present the payment sheet to the user
      await Stripe.instance.presentPaymentSheet();
    } on StripeException catch (e) {
      // Return a Future error with Stripe-specific exception details
      return Future.error('Stripe Exception: ${e.error.localizedMessage}');
    } catch (e) {
      // Return a Future error for all other exceptions
      return Future.error('Unknown Exception: $e');
    }
  }



  @override
  void dispose() {
    super.dispose();
  }
}

