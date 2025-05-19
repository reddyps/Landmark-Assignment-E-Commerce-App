import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:landmark_assignment/core/base/base_view.dart';
import 'package:landmark_assignment/core/util/value/constants.dart';
import 'package:landmark_assignment/features/product/viewmodels/products_view_model.dart';
import 'package:landmark_assignment/features/product/views/components/offer_carousel_and_categories.dart';
import 'package:landmark_assignment/features/product/views/screens/categories_products_all.dart';
import 'package:landmark_assignment/features/product/views/screens/categories_products_each.dart';
import 'package:lottie/lottie.dart';

class ProductsScreen extends BaseView<ProductsViewModel> {
  ProductsScreen({super.key});

  @override
  void initState(ProductsViewModel viewModel) {
    viewModel.fetchProducts();
    super.initState(viewModel);
  }
  @override
  Widget build(BuildContext context, ProductsViewModel viewModel) {
    return Obx(() {
      if (viewModel.isFetching.value) { // Show loader while fetching
        return Center(
          child: Lottie.asset(
            'assets/animations/order_loading.json',
            width: 150,
            height: 150,
            fit: BoxFit.contain,
          ),
        );
      }
      else if(viewModel.allProducts.value.isNotEmpty){
        return CustomScrollView(
          slivers: [
            const SliverToBoxAdapter(child: OffersCarouselAndCategories()),

            SliverToBoxAdapter(child: CategoriesProducts(viewModel: viewModel,)),

            ...viewModel.categories
                .where((category) => category!= Constants.allCategory)
                .map((category) => SliverToBoxAdapter(
              child: CategoriesProductsEach(
                viewModel: viewModel,
                category: category,
              ),
            )).toList(),
          ],
        );
      }
      else{
          return Center(child: Text(viewModel.errorMsg));
      }
    }

    );
  }

  @override
  ProductsViewModel createViewModel() {
    return ProductsViewModel();
  }
}
