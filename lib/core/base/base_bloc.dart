import 'package:flutter_bloc/flutter_bloc.dart';

class BaseBloc<T, V> extends Bloc<T, V> {
  BaseBloc(V initialState) : super(initialState);
}