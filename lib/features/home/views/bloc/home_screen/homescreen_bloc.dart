import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:landmark_assignment/features/home/viewmodels/home_view_model.dart';
import 'homescreen_event.dart';
import 'homescreen_state.dart';

class HomeScreenBloc extends Bloc<HomeScreenEvent, HomeScreenState> {
  HomeViewModel? homeViewModel;
  HomeScreenBloc() : super(ProductsState()) {
    on<ShowProductsEvent>((event, emit) => emit(ProductsState()));
    on<ShowOrdersEvent>((event, emit) => emit(OrdersState()));
    on<ShowProfileEvent>((event, emit) => emit(ProfileState()));
    on<ShowCartEvent>((event, emit) => emit(CartState()));
  }
}
