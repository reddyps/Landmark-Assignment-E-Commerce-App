import 'package:landmark_assignment/features/cart/models/model/orders/cart_model.dart';
import 'package:landmark_assignment/features/cart/viewmodels/cart_view_model.dart';

abstract class CartDetailEvent{
}

class LoadCartDetail extends CartDetailEvent {
  final CartViewModel viewModel;
  LoadCartDetail(this.viewModel);
}

class OrderCartDetail extends CartDetailEvent {
  final CartViewModel viewModel;
  OrderCartDetail(this.viewModel);
}

class RemoveItem extends CartDetailEvent {
  final Products product;
  final CartViewModel viewModel;
  RemoveItem(this.product,this.viewModel);
}

class UpdateQuantityItem extends CartDetailEvent {
  final Products product;
  final CartViewModel viewModel;
  UpdateQuantityItem(this.product,this.viewModel);
}

class UpdateSelectionItem extends CartDetailEvent {
  final Products product;
  final CartViewModel viewModel;
  UpdateSelectionItem(this.product,this.viewModel);
}

