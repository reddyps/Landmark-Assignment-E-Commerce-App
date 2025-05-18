import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:landmark_assignment/core/util/logger/logger_helper.dart';
import 'package:landmark_assignment/features/order/models/model/orders/orders_model.dart';
import 'package:landmark_assignment/features/order/models/repository/orders_repository.dart';
import 'package:landmark_assignment/features/order/viewmodels/orders_view_model.dart';
import 'order_detail_event.dart';
import 'order_detail_state.dart';

class OrderDetailBloc extends Bloc<OrderDetailEvent, OrderDetailState> {

  OrderDetailBloc() : super(OrderDetailInitial()) {
    on<LoadOrders>((event, emit) async {
      emit(OrderDetailLoading());
      try {
        await event.viewModel.fetchAllOrders().whenComplete((){
          emit(OrdersListLoaded());
        });
      } catch (e) {
        emit(OrderDetailError(e.toString()));
      }
    });
    on<CancelOrder>((event, emit) async {
      try {
        await event.viewModel.onClickOrderCancel(event.product).whenComplete((){
          emit(OrdersListLoaded());
        });
      } catch (e) {
        emit(OrderDetailError(e.toString()));
      }
    });
  }
}
