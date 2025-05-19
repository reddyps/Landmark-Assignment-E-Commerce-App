import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:landmark_assignment/features/cart/views/bloc/cart_detail_event.dart';
import 'package:landmark_assignment/features/cart/views/bloc/cart_detail_state.dart';

class CartDetailBloc extends Bloc<CartDetailEvent, CartDetailState> {

  CartDetailBloc() : super(CartDetailInitial()) {
    on<LoadCartDetail>((event, emit) async {
      try {
        await event.viewModel.fetchAllCart().whenComplete((){
          if(event.viewModel.userCart.isNotEmpty){
            emit(CartDetailLoaded());
          }
          else{
            emit(CartDetailLoadError(event.viewModel.errorMsg));
          }
        });
      } catch (e) {
        emit(CartDetailLoadError(e.toString()));
      }
    });

    on<OrderCartDetail>((event, emit) async {
      try {
        await event.viewModel.orderCart().whenComplete((){
          emit(CartDetailOrdered());
        });
      } catch (e) {
        emit(CartDetailLoadError(e.toString()));
      }
    });

    on<RemoveItem>((event, emit) async {
      try {
        await event.viewModel.removeItemFromCart(event.product).whenComplete((){
          emit(CartDetailLoaded());
        });
      } catch (e) {
        emit(CartDetailLoadError(e.toString()));
      }
    });

    on<UpdateQuantityItem>((event, emit) async {
      try {
        await event.viewModel.updateQuantity(event.product).whenComplete((){
          emit(CartDetailLoaded());
        });
      } catch (e) {
        emit(CartDetailLoadError(e.toString()));
      }
    });

    on<UpdateSelectionItem>((event, emit) async {
      try {
        await event.viewModel.updateSelection(event.product).whenComplete((){
          emit(CartDetailLoaded());
        });
      } catch (e) {
        emit(CartDetailLoadError(e.toString()));
      }
    });


  }
}
