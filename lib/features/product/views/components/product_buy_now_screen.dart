import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:landmark_assignment/core/util/theme/constants.dart';
import 'package:landmark_assignment/core/util/value/global_variables.dart';
import 'package:landmark_assignment/features/home/views/bloc/home_screen/homescreen_event.dart' show ShowCartEvent;
import 'package:landmark_assignment/features/product/models/model/product/product_model.dart';
import 'package:landmark_assignment/features/product/viewmodels/products_view_model.dart';
import 'package:landmark_assignment/features/product/views/components/added_to_cart_message_screen.dart';
import 'package:landmark_assignment/features/product/views/components/product_list_tile.dart';
import 'package:landmark_assignment/features/product/views/components/product_quantity.dart';
import 'package:landmark_assignment/features/product/views/components/selected_colors.dart';
import 'package:landmark_assignment/features/product/views/components/selected_size.dart';
import 'package:landmark_assignment/features/product/views/components/unit_price.dart';
import 'package:landmark_assignment/shared/widgets/cart_button.dart';
import 'package:landmark_assignment/shared/widgets/custom_modal_bottom_sheet.dart';
import 'package:landmark_assignment/shared/widgets/network_image_with_loader.dart';
import 'package:landmark_assignment/shared/widgets/animated_cart_button.dart';

class ProductBuyNowScreen extends StatefulWidget {
  ProductBuyNowScreen({super.key, required this.productData, required this.productsViewModel});
  ProductData productData;
  ProductsViewModel productsViewModel;

  @override
  _ProductBuyNowScreenState createState() => _ProductBuyNowScreenState();
}

class _ProductBuyNowScreenState extends State<ProductBuyNowScreen> {
  int numOfItems = 1;
  int selectedSizeIndex = 1;
  int selectedColorIndex = 2;

  @override
  Widget build(BuildContext context) {
    final totalPrice = widget.productData.price * numOfItems;

    return Scaffold(
      bottomNavigationBar: CartButton(
        price: totalPrice,
        title: "Add to cart",
        subTitle: "Total price",
        press: () {
          GlobalVariables.cartItemCount.value += numOfItems;
          widget.productsViewModel.addProductCart(widget.productData).whenComplete(() {
            customModalBottomSheet(
              context,
              isDismissible: false,
              child: const AddedToCartMessageScreen(),
            );
          });
        },
      ),
      body: Stack(
        children: [
          Column(
            children: [
              Container(
                height: kToolbarHeight,
                padding: const EdgeInsets.symmetric(horizontal: defaultPadding / 2),
                decoration: BoxDecoration(
                  border: Border(bottom: BorderSide(color: Colors.grey.shade300)),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const BackButton(),
                    Expanded(
                      child: Text(
                        widget.productData.title,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context).textTheme.titleSmall,
                      ),
                    ),
                    Obx(() => AnimatedCartButton(
                      itemCount: GlobalVariables.cartItemCount.value,
                      onPressed: () {
                        Navigator.pop(context);
                        GlobalVariables.homeScreenTab.value = 1;
                        GlobalVariables.homeScreenBloc?.add(ShowCartEvent());
                      },
                    )),
                  ],
                ),
              ),
              Expanded(
                child: CustomScrollView(
                  slivers: [
                    SliverToBoxAdapter(
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: defaultPadding),
                        child: AspectRatio(
                          aspectRatio: 1.05,
                          child: NetworkImageWithLoader(widget.productData.image),
                        ),
                      ),
                    ),
                    SliverPadding(
                      padding: const EdgeInsets.all(defaultPadding),
                      sliver: SliverToBoxAdapter(
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: UnitPrice(
                                price: widget.productData.price,
                              ),
                            ),
                            ProductQuantity(
                              numOfItem: numOfItems,
                              onIncrement: () {
                                setState(() {
                                  numOfItems++;
                                });
                              },
                              onDecrement: () {
                                if (numOfItems > 1) {
                                  setState(() {
                                    numOfItems--;
                                  });
                                }
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SliverToBoxAdapter(child: Divider()),
                    SliverToBoxAdapter(
                      child: SelectedColors(
                        colors: const [
                          Color(0xFFEA6262),
                          Color(0xFFB1CC63),
                          Color(0xFFFFBF5F),
                          Color(0xFF9FE1DD),
                          Color(0xFFC482DB),
                        ],
                        selectedColorIndex: selectedColorIndex,
                        press: (index) {
                          setState(() {
                            selectedColorIndex = index;
                          });
                        },
                      ),
                    ),
                    SliverToBoxAdapter(
                      child: SelectedSize(
                        sizes: const ["S", "M", "L", "XL", "XXL"],
                        selectedIndex: selectedSizeIndex,
                        press: (index) {
                          setState(() {
                            selectedSizeIndex = index;
                          });
                        },
                      ),
                    ),
                    SliverPadding(
                      padding: const EdgeInsets.symmetric(vertical: defaultPadding),
                      sliver: ProductListTile(
                        title: "Size guide",
                        svgSrc: "assets/icons/Sizeguid.svg",
                        isShowBottomBorder: true,
                        press: () {},
                      ),
                    ),
                    SliverPadding(
                      padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
                      sliver: SliverToBoxAdapter(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(height: defaultPadding / 2),
                            Text(
                              "Store pickup availability",
                              style: Theme.of(context).textTheme.titleSmall,
                            ),
                            const SizedBox(height: defaultPadding / 2),
                            const Text(
                                "Select a size to check store availability and In-Store pickup options."),
                          ],
                        ),
                      ),
                    ),
                    SliverPadding(
                      padding: const EdgeInsets.symmetric(vertical: defaultPadding),
                      sliver: ProductListTile(
                        title: "Check stores",
                        svgSrc: "assets/icons/Stores.svg",
                        isShowBottomBorder: true,
                        press: () {},
                      ),
                    ),
                    const SliverToBoxAdapter(
                      child: SizedBox(height: defaultPadding),
                    )
                  ],
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}