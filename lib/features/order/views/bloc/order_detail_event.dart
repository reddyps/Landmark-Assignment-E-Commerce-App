import 'package:landmark_assignment/features/order/models/model/orders/orders_model.dart';
import 'package:landmark_assignment/features/order/viewmodels/orders_view_model.dart';

abstract class OrderDetailEvent{
}

class LoadOrderDetail extends OrderDetailEvent {
  final int orderId;
  LoadOrderDetail(this.orderId);
}

class CancelOrder extends OrderDetailEvent {
  final OrdersViewModel viewModel;
  Products product;
  CancelOrder(this.viewModel,this.product);
}

class LoadOrders extends OrderDetailEvent {
  final OrdersViewModel viewModel;
  LoadOrders(this.viewModel);
}
