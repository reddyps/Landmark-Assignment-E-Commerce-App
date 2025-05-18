import 'package:landmark_assignment/features/order/models/model/orders/orders_model.dart';
abstract class OrderDetailState {
}

class OrderDetailInitial extends OrderDetailState {}

class OrderDetailLoading extends OrderDetailState {}

class OrdersInitial extends OrderDetailState {}

class OrdersListLoaded extends OrderDetailState {
}

class OrderDetailError extends OrderDetailState {
  final String message;
  OrderDetailError(this.message);
}
