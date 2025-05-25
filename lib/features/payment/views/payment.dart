import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:landmark_assignment/features/home/views/bloc/home_screen/homescreen_bloc.dart';
import 'package:landmark_assignment/features/home/views/screens/home_screen.dart';
import 'package:landmark_assignment/features/order/views/bloc/order_detail_bloc.dart';
import 'package:landmark_assignment/features/order/views/componets/orders_screen.dart';
import 'package:landmark_assignment/features/payment/views/bloc/payment_bloc.dart';
import 'package:landmark_assignment/features/payment/views/componets/payment_screen.dart';
import 'package:landmark_assignment/features/product/models/model/cart/cart_model.dart';

import '../../cart/models/model/orders/cart_model.dart';

class Payment extends StatelessWidget {
  final List<Products> selectedItems;

  Payment({super.key, required this.selectedItems});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PaymentBloc(),
      child: PaymentScreen(selectedItems: selectedItems),
    );
  }
}