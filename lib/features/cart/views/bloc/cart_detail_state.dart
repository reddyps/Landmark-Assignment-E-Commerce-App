import 'package:landmark_assignment/features/order/models/model/orders/orders_model.dart';
abstract class CartDetailState {
}

class CartDetailInitial extends CartDetailState {}

class CartDetailLoaded extends CartDetailState {}

class CartDetailLoadError extends CartDetailState {
  final String message;
  CartDetailLoadError(this.message);
}

class CartDetailOrdered extends CartDetailState {}


