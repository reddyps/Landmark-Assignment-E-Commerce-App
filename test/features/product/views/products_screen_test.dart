
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:landmark_assignment/features/product/views/products_screen.dart';
import 'package:landmark_assignment/features/product/viewmodels/products_view_model.dart';

class MockProductsViewModel extends Mock implements ProductsViewModel {}

void main() {
  testWidgets('renders ProductsScreen with loading and UI components', (tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: ProductsScreen(),
      ),
    );

    expect(find.byType(ProductsScreen), findsOneWidget);
    expect(find.byType(CustomScrollView), findsOneWidget);
    expect(find.byType(SliverToBoxAdapter), findsWidgets);
  });
}
