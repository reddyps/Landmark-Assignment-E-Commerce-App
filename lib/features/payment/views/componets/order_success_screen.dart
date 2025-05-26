import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:landmark_assignment/core/util/theme/constants.dart';
import 'package:landmark_assignment/core/util/value/global_variables.dart';
import 'package:landmark_assignment/features/home/views/bloc/home_screen/homescreen_event.dart';

class OrderSuccessScreen extends StatelessWidget {
  const OrderSuccessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
          child: Column(
            children: [
              const Spacer(),
              Lottie.asset(
                'assets/animations/order_success.json',
                height: MediaQuery.of(context).size.height * 0.3,
                repeat: false,
              ),
              const Spacer(flex: 2),
              Text(
                "Order placed successfully!",
                style: Theme.of(context)
                    .textTheme
                    .headlineSmall!
                    .copyWith(fontWeight: FontWeight.w500),
              ),
              const SizedBox(height: defaultPadding / 2),
              const Text(
                "You can check your order details or continue shopping.",
                textAlign: TextAlign.center,
              ),
              const Spacer(flex: 2),
              OutlinedButton(
                onPressed: () {
                  Navigator.pop(context);
                  GlobalVariables.homeScreenTab.value = 0;
                  GlobalVariables.homeScreenBloc!.add(ShowProductsEvent());
                },
                child: const Text("Continue Shopping"),
              ),
              const SizedBox(height: defaultPadding),
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                  GlobalVariables.homeScreenTab.value = 2;
                  GlobalVariables.homeScreenBloc!.add(ShowOrdersEvent());
                },
                child: const Text("Order Details"),
              ),
              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
