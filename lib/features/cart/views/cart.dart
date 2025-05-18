import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:landmark_assignment/features/cart/views/bloc/cart_detail_bloc.dart';
import 'package:landmark_assignment/features/cart/views/screens/cart_screen.dart';

class Cart extends StatelessWidget {
  Cart({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CartDetailBloc(),
      child: CartScreen(),
    );
  }
}