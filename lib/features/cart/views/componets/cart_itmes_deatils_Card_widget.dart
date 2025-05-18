import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:dio/dio.dart';
import 'package:landmark_assignment/features/cart/models/model/orders/cart_model.dart';
import 'package:landmark_assignment/features/cart/viewmodels/cart_view_model.dart';
import 'package:landmark_assignment/features/cart/views/bloc/cart_detail_bloc.dart';
import 'package:landmark_assignment/features/cart/views/bloc/cart_detail_event.dart';
import 'package:landmark_assignment/features/product/models/model/product/product_model.dart';
import 'package:landmark_assignment/features/order/views/componets/InfoDialog.dart';
import 'package:landmark_assignment/features/product/views/components/product_quantity.dart';

class CartItemsDeatilsCardWidget extends StatefulWidget {
  final int productId;
  final int initialQuantity;
  final bool isSelected;
  final CartViewModel viewModel;
  final CartDetailBloc cartDetailBloc;

  const CartItemsDeatilsCardWidget({
    super.key,
    required this.productId,
    required this.initialQuantity,
    required this.viewModel,
    required this.cartDetailBloc,
    required this.isSelected
  });

  @override
  State<CartItemsDeatilsCardWidget> createState() => _CartItemsDeatilsCardWidgetState();
}

class _CartItemsDeatilsCardWidgetState extends State<CartItemsDeatilsCardWidget> {
  ProductData? product;
  bool isLoading = true;
  bool isError = false;
  int numOfItems = 1;

  @override
  void initState() {
    super.initState();
    numOfItems = widget.initialQuantity;
    _fetchProductDetail();
  }

  Future<void> _fetchProductDetail() async {
    try {
      final response = await Dio().get('https://fakestoreapi.com/products/${widget.productId}');
      setState(() {
        product = ProductData.fromJson(response.data);
        isLoading = false;
      });
    } catch (e) {
      setState(() {
        isError = true;
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final date = DateTime.now();
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      elevation: 1,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: isLoading
            ? SizedBox(
          height: 120,
          child: Center(
            child: CircularProgressIndicator(
              color: Theme.of(context).primaryColor,
              strokeWidth: 3,
            ),
          ),
        )
            : isError || product == null
            ? const Text("Failed to load product details.")
            : Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Checkbox(
                  value: widget.isSelected,
                  onChanged: (value) {
                    widget.cartDetailBloc.add(
                        UpdateSelectionItem(Products(productId: widget.productId,isSelected: value ?? false,price: product!.price), widget.viewModel));
                  },
                ),
                CircleAvatar(
                  radius: 40,
                  backgroundImage: product!.image != null ? NetworkImage(product!.image!) : null,
                  backgroundColor: Colors.white,
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        product!.title ?? 'No Title',
                        style: Theme.of(context).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(height: 4),
                      Text(
                        product!.description ?? '',
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                      const SizedBox(height: 6),
                      Text("Category: ${product!.category}", style: Theme.of(context).textTheme.bodySmall),
                      Text(
                        'Price: ₹${product!.price!.toStringAsFixed(2)} x $numOfItems = ₹${(product!.price! * numOfItems).toStringAsFixed(2)}',
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                      Text(
                        "Added on: ${DateFormat('dd MMM yyyy').format(date)}",
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                      const SizedBox(height: 6),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          // Quantity control
                          ProductQuantity(
                            titleRequired: false,
                            numOfItem: numOfItems,
                            onIncrement: () {
                              widget.cartDetailBloc.add(
                                UpdateQuantityItem(Products(productId: widget.productId,quantity: ++numOfItems,price: product!.price), widget.viewModel),
                              );
                            },
                            onDecrement: () {
                              if (numOfItems > 1) {
                                widget.cartDetailBloc.add(
                                    UpdateQuantityItem(Products(productId: widget.productId,quantity: --numOfItems,price: product!.price), widget.viewModel)
                                );
                              }
                            },
                          ),
                          const Spacer(),
                          Row(
                            children: [
                              IconButton(
                                icon: const Icon(Icons.delete, color: Colors.red),
                                tooltip: 'Remove item',
                                onPressed: () {
                                  widget.cartDetailBloc.add(
                                    RemoveItem(Products(productId: widget.productId), widget.viewModel),
                                  );
                                },
                              ),
                              IconButton(
                                icon: const Icon(Icons.info_outline, color: Colors.green),
                                tooltip: 'Item info',
                                onPressed: () {
                                  InfoDialog().showInfoDialog(
                                    context: context,
                                    product: product!,
                                    quantity: numOfItems,
                                  );
                                },
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
