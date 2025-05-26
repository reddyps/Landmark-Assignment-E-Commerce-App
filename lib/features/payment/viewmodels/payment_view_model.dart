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
class PaymentViewModel extends BaseViewModel {
  final className = "PaymentViewModel";

  late List<Products> selectedItems;

  Future<String?> createPaymentIntent(double amount) async {
    try {
      showCircularIndicator(message: "Please Initiating payment...!");
      // Correctly pass the double 'amount' to calculateAmount
      ClientSecretModel clientSecret = await PaymentRepository().createPaymentIntent(
          PaymentModel(amount: calculateAmount(amount), currency: "INR"));
      dismissDialogIndicator();

      if (clientSecret.clientSecret == null || clientSecret.clientSecret!.isEmpty) {
        showDialogAuto(method: () => pop(), message: clientSecret.errorDesc ?? "Client Secret is null or empty");
        loge(tag: className, message: "createPaymentIntent failed: clientSecret is null or empty");
        return Future.error('Failed to create payment intent');
      }
      return clientSecret.clientSecret;
    } catch (e) {
      dismissDialogIndicator(); // Ensure dialog is dismissed on error
      loge(tag: className, message: "createPaymentIntent error: $e");
      // Re-throw or return null to indicate failure, so makePayment can handle it
      return null;
    }
  }


  Future<void> makePayment(double amount) async {
    try {
      // FIX: Use the 'amount' parameter passed to makePayment
      final clientSecret = await createPaymentIntent(amount);

      if (clientSecret == null) {
        // If createPaymentIntent failed and returned null, stop here.
        loge(message: "makePayment: Client secret is null, payment cannot proceed.");
        return;
      }

      await Stripe.instance.initPaymentSheet(
        paymentSheetParameters: SetupPaymentSheetParameters(
          paymentIntentClientSecret: clientSecret,
          merchantDisplayName: 'Landmark Store',
          googlePay: const PaymentSheetGooglePay(
            merchantCountryCode: "IN",
            currencyCode: "INR",
            testEnv: true, // Set to false for production
          ),
        ),
      );
      await Stripe.instance.presentPaymentSheet();
      // TODO: Add success handling here (e.g., navigate to a success screen, update order status)

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

  // FIX: calculateAmount now takes a double and returns a clean integer string
  String calculateAmount(double amount) {
    // Multiply by 100 and then convert to int to ensure no decimal places,
    // then convert to string.
    final calculatedAmountInSmallestUnit = (amount * 100).toInt();
    return calculatedAmountInSmallestUnit.toString();
  }

  @override
  void dispose() {
    super.dispose();
  }
}