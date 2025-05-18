import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:landmark_assignment/features/home/views/bloc/home_screen/homescreen_bloc.dart';
import 'package:landmark_assignment/features/home/views/screens/home_screen.dart';
import 'package:landmark_assignment/features/order/views/bloc/order_detail_bloc.dart';
import 'package:landmark_assignment/features/order/views/componets/orders_screen.dart';

class Orders extends StatelessWidget {
  Orders({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => OrderDetailBloc(),
      child: OrdersScreen(),
    );
  }
}