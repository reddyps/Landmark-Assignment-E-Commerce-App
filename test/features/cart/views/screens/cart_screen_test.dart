
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:landmark_assignment/features/cart/views/screens/cart_screen.dart';
import 'package:mockito/mockito.dart';
import 'package:landmark_assignment/features/cart/views/bloc/cart_detail_bloc.dart';
import 'package:landmark_assignment/features/cart/views/bloc/cart_detail_state.dart';
import 'package:landmark_assignment/features/cart/views/bloc/cart_detail_event.dart';
import 'package:landmark_assignment/features/cart/viewmodels/cart_view_model.dart';

class MockCartDetailBloc extends Mock implements CartDetailBloc {}

void main() {
  late MockCartDetailBloc cartBloc;

  setUp(() {
    cartBloc = MockCartDetailBloc();
  });

  Widget buildTestableWidget() {
    return MaterialApp(
      home: BlocProvider<CartDetailBloc>.value(
        value: cartBloc,
        child: CartScreen(),
      ),
    );
  }

  testWidgets('renders CartScreen with loading state', (tester) async {
    when(cartBloc.state).thenReturn(CartDetailInitial());

    await tester.pumpWidget(buildTestableWidget());
    expect(find.byType(CircularProgressIndicator), findsOneWidget);
  });

  testWidgets('renders CartScreen with no data', (tester) async {
    when(cartBloc.state).thenReturn(CartDetailLoaded());
    final cartViewModel = CartViewModel();
    cartViewModel.userCart = [];

    await tester.pumpWidget(buildTestableWidget());
    expect(find.text('No cart items available.'), findsOneWidget);
  });
}
