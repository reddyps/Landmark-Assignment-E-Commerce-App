import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:landmark_assignment/core/util/extension/method_extension.dart';
import 'package:landmark_assignment/core/util/theme/constants.dart';
import 'package:landmark_assignment/core/util/value/images.dart';
import 'package:landmark_assignment/features/product/models/model/product/product_model.dart';
import 'package:landmark_assignment/features/product/viewmodels/products_view_model.dart';
import 'package:landmark_assignment/features/product/views/components/product_buy_now_screen.dart';
import 'package:landmark_assignment/features/product/views/components/product_images.dart';
import 'package:landmark_assignment/features/product/views/components/product_info.dart';
import 'package:landmark_assignment/features/product/views/components/product_list_tile.dart';
import 'package:landmark_assignment/shared/widgets/animated_cart_button.dart' show AnimatedCartButton;
import 'package:landmark_assignment/shared/widgets/cart_button.dart';
import 'package:landmark_assignment/shared/widgets/custom_modal_bottom_sheet.dart';
import 'package:landmark_assignment/shared/widgets/product_card.dart';
import 'package:landmark_assignment/shared/widgets/review_card.dart';

import '../../../../core/util/value/global_variables.dart';
import '../../../home/views/bloc/home_screen/homescreen_event.dart';
class ProductDetailsScreen extends StatelessWidget {
  const ProductDetailsScreen({super.key, required this.productData, required this.filteredProducts,required this.viewModel});
  final List<ProductData> filteredProducts;
  final ProductData productData;
  final ProductsViewModel viewModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar:
         CartButton(
              price: productData.price,
              press: () {
                customModalBottomSheet(
                  context,
                  height: MediaQuery.of(context).size.height * 0.92,
                  child:  ProductBuyNowScreen(productData: productData,productsViewModel : viewModel),
                );
              },
            ),
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              backgroundColor: Theme.of(context).scaffoldBackgroundColor,
              floating: true,
              actions: [
                IconButton(
                  onPressed: () {},
                  icon: SvgPicture.asset(
                    Images.bookmark,
                    color: Theme.of(context).textTheme.bodyLarge!.color,
                  ),
                ),
                Obx(() => AnimatedCartButton(
                  itemCount: GlobalVariables.cartItemCount.value,
                  onPressed: () {
                    Navigator.pop(context);
                    GlobalVariables.homeScreenBloc?.add(ShowCartEvent());
                  },
                )),
              ],
            ),
             ProductImages(
              images: [productData.image],
            ),
            ProductInfo(
              brand: context.locale.brand,
              title: productData.title,
              description:productData.description,
              rating: productData.rating.rate,
              numOfReviews: productData.rating.count,
            ),
            ProductListTile(
              svgSrc: Images.product,
              title: context.locale.product_details,
              press: () {
                customModalBottomSheet(
                  context,
                  height: MediaQuery.of(context).size.height * 0.92,
                  child: Text(productData.description),
                );
              },
            ),
            ProductListTile(
              svgSrc: Images.delivery,
              title: context.locale.shipping_information,
              press: () {

              },
            ),
            ProductListTile(
              svgSrc: "assets/icons/Return.svg",
              title: "Returns",
              isShowBottomBorder: true,
                press: () {

                }
            ),
             SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.all(defaultPadding),
                child: ReviewCard(
                  rating: productData.rating.rate,
                  numOfReviews: productData.rating.count,
                  numOfFiveStar: 80,
                  numOfFourStar: 30,
                  numOfThreeStar: 5,
                  numOfTwoStar: 4,
                  numOfOneStar: 1,
                ),
              ),
            ),
            ProductListTile(
              svgSrc: "assets/icons/Chat.svg",
              title: "Reviews",
              isShowBottomBorder: true,
              press: () {
              },
            ),
            SliverPadding(
              padding: const EdgeInsets.all(defaultPadding),
              sliver: SliverToBoxAdapter(
                child: Text(
                  "You may also like",
                  style: Theme.of(context).textTheme.titleSmall!,
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: SizedBox(
                height: 220,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: filteredProducts.length,
                  itemBuilder: (context, index) => Padding(
                    padding: EdgeInsets.only(
                        left: defaultPadding,
                        right: index == 4 ? defaultPadding : 0),
                    child: ProductCard(
                      description: filteredProducts[index].description,
                      image: filteredProducts[index].image,
                      title: filteredProducts[index].title,
                      brandName: context.locale.brand,
                      price: filteredProducts[index].price,
                      press: () {
                        viewModel.onSelectedSuggestedItem(filteredProducts[index]);
                      },
                    ),
                  ),
                ),
              ),
            ),
            const SliverToBoxAdapter(
              child: SizedBox(height: defaultPadding),
            )
          ],
        ),
      ),
    );
  }
}
