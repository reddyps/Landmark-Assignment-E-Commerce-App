import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:landmark_assignment/core/util/value/global_variables.dart';
import 'package:landmark_assignment/features/cart/views/screens/cart_screen.dart';
import 'package:landmark_assignment/features/home/views/bloc/home_screen/homescreen_bloc.dart';
import 'package:landmark_assignment/features/home/views/bloc/home_screen/homescreen_event.dart';
import 'package:landmark_assignment/features/home/views/home.dart';
import 'package:landmark_assignment/features/order/views/componets/orders_screen.dart';
import 'package:lottie/lottie.dart';

import '../../../../core/util/theme/constants.dart';

class AddedToCartMessageScreen extends StatelessWidget {
  const AddedToCartMessageScreen({super.key});

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
                'assets/animations/cart_success.json',
                height: MediaQuery.of(context).size.height * 0.3,
                repeat: false,
              ),
              const Spacer(flex: 2),
              Text(
                "Added to cart",
                style: Theme.of(context)
                    .textTheme
                    .headlineSmall!
                    .copyWith(fontWeight: FontWeight.w500),
              ),
              const SizedBox(height: defaultPadding / 2),
              const Text(
                "Click the checkout button to complete the purchase process.",
                textAlign: TextAlign.center,
              ),
              const Spacer(flex: 2),
              OutlinedButton(
                onPressed: () {
                  Navigator.pop(context);
                  Navigator.pop(context);
                  Navigator.pop(context);
                  GlobalVariables.homeScreenTab.value = 0;
                  GlobalVariables.homeScreenBloc!.add(ShowProductsEvent());
                },
                child: const Text("Continue shopping"),
              ),
              const SizedBox(height: defaultPadding),
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                  Navigator.pop(context);
                  Navigator.pop(context);
                  GlobalVariables.homeScreenTab.value = 1;
                  GlobalVariables.homeScreenBloc!.add(ShowCartEvent());
                },
                child: const Text("Checkout"),
              ),
              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
