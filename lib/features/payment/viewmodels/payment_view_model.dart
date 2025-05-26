import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:injectable/injectable.dart';
import 'package:landmark_assignment/core/base/base_viewmodel.dart';

import '../../../core/util/logger/logger_helper.dart';
import '../../cart/models/model/orders/cart_model.dart';
import '../models/model/clientSecret/client_secret_model.dart';
import '../models/model/orders/payment_model.dart';
import '../models/repository/payment_repository.dart';


@singleton
class PaymentViewModel extends BaseViewModel { // Changed to ChangeNotifier
  final className = "PaymentViewModel";

  late List<Products> selectedItems;
   createPaymentIntent(double amount) async {
    try {
      showCircularIndicator(message: "Please Initiating payment...!");
      ClientSecretModel clientSecret = await PaymentRepository().createPaymentIntent(PaymentModel(amount: calculateAmount(amount.toString()),currency: "INR"));
      dismissDialogIndicator();
      if(clientSecret.clientSecret == null || clientSecret.clientSecret!.isEmpty) {
        showDialogAuto(method: () => pop(), message: clientSecret.errorDesc ?? "Client Secret is null or empty");
        loge(tag: className, message: "createPaymentIntent failed: clientSecret is null or empty");
        return Future.error('Failed to create payment intent');
      }
      return clientSecret.clientSecret;
    } catch (e) {
      loge(tag: className, message: "createPaymentIntent error: $e");
    }
  }


  Future<void> makePayment(double amount) async {
    try {
      final clientSecret = await createPaymentIntent(amount); // ₹10.00
      await Stripe.instance.initPaymentSheet(
        paymentSheetParameters: SetupPaymentSheetParameters(
          paymentIntentClientSecret: clientSecret,
          merchantDisplayName: 'Landmark Store',
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

  calculateAmount(String amount) {
    final calculatedAmout = (int.parse(amount)) * 100;
    return calculatedAmout.toString();
  }

  @override
  void dispose() {
    super.dispose();
  }
}

