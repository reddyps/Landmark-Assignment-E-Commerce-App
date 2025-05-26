
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:landmark_assignment/features/product/views/components/offer_carousel_and_categories.dart';
import 'package:landmark_assignment/features/product/views/screens/categories_products_all.dart';
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

    expect(find.byType(CategoriesProducts), findsOneWidget);
    expect(find.byType(OffersCarouselAndCategories), findsOneWidget);
    expect(find.byType(SliverToBoxAdapter), findsWidgets);
  });
}
