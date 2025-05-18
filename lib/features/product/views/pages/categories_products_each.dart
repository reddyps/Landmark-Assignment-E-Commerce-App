import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:landmark_assignment/core/util/extension/method_extension.dart';
import 'package:landmark_assignment/core/util/value/size_config.dart';
import 'package:landmark_assignment/features/product/viewmodels/products_view_model.dart';
import 'package:landmark_assignment/features/product/views/pages/categories.dart';
import 'package:landmark_assignment/features/product/views/pages/product_details_screen.dart';
import 'package:landmark_assignment/shared/widgets/product_card.dart';

class CategoriesProductsEach extends StatefulWidget {
  final ProductsViewModel viewModel;
  final String category;
  const CategoriesProductsEach({super.key, required this.viewModel, required this.category});

  @override
  State<CategoriesProductsEach> createState() => _CategoriesProductsState();
}

class _CategoriesProductsState extends State<CategoriesProductsEach> {
  late ScrollController _scrollController;

  @override
  void initState() {
    super.initState();

    _scrollController = ScrollController();
    _scrollController.addListener(_onScroll);

    // Scroll to top when category changes
    widget.viewModel.selectedCategories.listen((_) {
      if (_scrollController.hasClients) {
        _scrollController.jumpTo(0); // or animateTo if you want smooth scroll
      }
    });
  }


  void _onScroll() {
    // Trigger pagination when scrolled near the end
    if (_scrollController.position.pixels >=
        _scrollController.position.maxScrollExtent - 200 &&
        !widget.viewModel.isLoadingMore.value) {
      widget.viewModel.loadMoreProducts();
    }
  }

  @override
  void dispose() {
    _scrollController.removeListener(_onScroll);
    _scrollController.dispose();
    super.dispose();
  }

  @override
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final categoryProducts = widget.viewModel.allProducts.value
          .where((p) => p.category.toLowerCase() == widget.category.toLowerCase())
          .toList();

      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Text(
              widget.category.capitalizeFirst!,
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ),
          SizedBox(
            height: 280,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: categoryProducts.length,
              itemBuilder: (context, index) {
                final product = categoryProducts[index];
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: ProductCard(
                    description: product.description,
                    image: product.image,
                    brandName: context.locale.brand,
                    title: product.title,
                    price: product.price,
                    press: () {
                      widget.viewModel.onSelectedItem(product);
                    },
                  ),
                );
              },
            ),
          ),
        ],
      );
    });
  }
  int _calculateItemCount() {
    final totalProducts = widget.viewModel.filteredProducts.length;
    if (!widget.viewModel.isLoadingMore.value) {
      return totalProducts;
    }
    // For every 5 products, add 1 loading indicator
    int loadingCount = (totalProducts / 5).ceil();
    return totalProducts + loadingCount;
  }

  bool _isLoadingIndex(int index) {
    if (!widget.viewModel.isLoadingMore.value) return false;
    return (index + 1) % 6 == 0;
  }
}




