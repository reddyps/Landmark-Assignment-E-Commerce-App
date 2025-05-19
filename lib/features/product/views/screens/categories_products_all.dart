import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:landmark_assignment/core/util/extension/method_extension.dart';
import 'package:landmark_assignment/core/util/value/size_config.dart';
import 'package:landmark_assignment/features/product/viewmodels/products_view_model.dart';
import 'package:landmark_assignment/features/product/views/screens/categories.dart';
import 'package:landmark_assignment/features/product/views/screens/product_details_screen.dart';
import 'package:landmark_assignment/shared/widgets/product_card.dart';

class CategoriesProducts extends StatefulWidget {
  final ProductsViewModel viewModel;
  const CategoriesProducts({super.key, required this.viewModel});

  @override
  State<CategoriesProducts> createState() => _CategoriesProductsState();
}

class _CategoriesProductsState extends State<CategoriesProducts> {
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
  Widget build(BuildContext context) {
    return Obx(() => Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Categories(viewModel: widget.viewModel),
        const SizedBox(height: 8),
        Padding(
          padding: const EdgeInsets.all(16),
          child: Text(
            widget.viewModel.selectedCategories.value,
            style: Theme.of(context).textTheme.titleSmall,
          ),
        ),
        SizedBox(
          height: SizeConfig.blockSizeVertical! * 30,
          child: ListView.builder(
            controller: _scrollController,
            scrollDirection: Axis.horizontal,
            itemCount: _calculateItemCount(),
            itemBuilder: (context, index) {
              if (_isLoadingIndex(index)) {
                return  Padding(
                  padding: EdgeInsets.symmetric(vertical: 16),
                  child: Center(
                    child: Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        color: Colors.white, // White background
                        shape: BoxShape.circle,
                      ),
                      padding: EdgeInsets.all(8),
                      child: CircularProgressIndicator(
                        strokeWidth: 2,
                        valueColor: AlwaysStoppedAnimation<Color>(Colors.blue), // Optional: custom color
                      ),
                    ),
                  ),
                );

              } else {
                // Calculate the actual product index, accounting for loading indicators inserted
                final productIndex = index - (index ~/ 6);
                if (productIndex < widget.viewModel.filteredProducts.length) {
                  final product = widget.viewModel.filteredProducts[productIndex];
                  return Padding(
                    padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
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
                } else {
                  // In case index is out of range, return empty box
                  return const SizedBox.shrink();
                }
              }
            },
          ),
        ),
      ],
    ));
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




