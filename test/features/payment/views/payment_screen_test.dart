
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mockito/mockito.dart';
import 'package:landmark_assignment/features/payment/bloc/payment_bloc.dart';
import 'package:landmark_assignment/features/payment/viewmodels/payment_view_model.dart';
import 'package:landmark_assignment/features/payment/views/payment.dart';
import 'package:landmark_assignment/features/product/models/model/cart/cart_model.dart';

class MockPaymentBloc extends Mock implements PaymentBloc {}

void main() {
  late MockPaymentBloc paymentBloc;
  late List<Products> mockItems;

  setUp(() {
    paymentBloc = MockPaymentBloc();
    mockItems = [
      const Products(productId: 1, price: 100, quantity: 2),
      const Products(productId: 2, price: 200, quantity: 1),
    ];
  });

  Widget buildTestableWidget() {
    return MaterialApp(
      home: BlocProvider<PaymentBloc>.value(
        value: paymentBloc,
        child: PaymentScreen(selectedItems: mockItems),
      ),
    );
  }

  testWidgets('renders PaymentScreen with item list and total', (tester) async {
    when(paymentBloc.state).thenReturn(PaymentInitial());

    await tester.pumpWidget(buildTestableWidget());

    expect(find.text('Items in your order:'), findsOneWidget);
    expect(find.text('Order Summary'), findsOneWidget);
    expect(find.textContaining('Total:'), findsOneWidget);
    expect(find.byType(ElevatedButton), findsWidgets);
  });

  testWidgets('shows loading indicator when PaymentLoading state', (tester) async {
    when(paymentBloc.state).thenReturn(PaymentLoading());

    await tester.pumpWidget(buildTestableWidget());
    await tester.pump();

    expect(find.byType(CircularProgressIndicator), findsOneWidget);
  });
}
