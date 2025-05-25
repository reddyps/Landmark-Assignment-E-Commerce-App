
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mockito/mockito.dart';
import 'package:landmark_assignment/features/order/views/orders.dart';
import 'package:landmark_assignment/features/order/views/bloc/order_detail_bloc.dart';
import 'package:landmark_assignment/features/order/views/bloc/order_detail_state.dart';
import 'package:landmark_assignment/features/order/viewmodels/orders_view_model.dart';

class MockOrderDetailBloc extends Mock implements OrderDetailBloc {}

void main() {
  late MockOrderDetailBloc orderBloc;

  setUp(() {
    orderBloc = MockOrderDetailBloc();
  });

  Widget buildTestableWidget() {
    return MaterialApp(
      home: BlocProvider<OrderDetailBloc>.value(
        value: orderBloc,
        child: OrdersScreen(),
      ),
    );
  }

  testWidgets('renders OrdersScreen with loading state', (tester) async {
    when(orderBloc.state).thenReturn(OrderDetailLoading());

    await tester.pumpWidget(buildTestableWidget());
    expect(find.byType(CircularProgressIndicator), findsOneWidget);
  });

  testWidgets('renders OrdersScreen with no orders', (tester) async {
    when(orderBloc.state).thenReturn(OrdersListLoaded());

    await tester.pumpWidget(buildTestableWidget());
    expect(find.text('No orders available.'), findsOneWidget);
  });
}
