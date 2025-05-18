import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:dio/dio.dart';
import 'package:landmark_assignment/core/util/logger/logger_helper.dart';
import 'package:landmark_assignment/features/product/models/model/product/product_model.dart';
import 'package:landmark_assignment/features/order/views/componets/InfoDialog.dart';

class OderDeatilsCardWidget extends StatefulWidget {
  final int productId;
  final int quantity;
  final bool isOrderCancellable;
  final VoidCallback? onCancelOrder;

  const OderDeatilsCardWidget({
    super.key,
    required this.productId,
    required this.quantity,
    this.isOrderCancellable = false,
    this.onCancelOrder,
  });

  @override
  State<OderDeatilsCardWidget> createState() => _OderDeatilsCardWidgetState();
}

class _OderDeatilsCardWidgetState extends State<OderDeatilsCardWidget> {
  ProductData? product;
  bool isLoading = true;
  bool isError = false;

  @override
  void initState() {
    super.initState();
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
                CircleAvatar(
                  radius: 40,
                  backgroundImage: product!.image != null
                      ? NetworkImage(product!.image!)
                      : null,
                  backgroundColor: Colors.white,
                ),
                const SizedBox(width: 16),
                Flexible(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        product!.title ?? 'No Title',
                        style: Theme.of(context)
                            .textTheme
                            .titleMedium
                            ?.copyWith(fontWeight: FontWeight.bold),
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
                      Text("Category: ${product!.category}",
                          style: Theme.of(context).textTheme.bodySmall),
                      Text(
                        'Price: ₹${product!.price!.toStringAsFixed(2)} x ${widget.quantity} = ₹${(product!.price! * widget.quantity).toStringAsFixed(2)}',
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                      Text(
                        "Order Date: ${DateFormat('dd MMM yyyy').format(date)}",
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                      const SizedBox(height: 6),
                      Row(
                        mainAxisAlignment:
                        MainAxisAlignment.spaceBetween,
                        children: [
                          const Text("Status: Confirmed"),
                          IconButton(
                            icon: const Icon(Icons.info_outline,
                                color: Colors.green),
                            onPressed: () {
                              InfoDialog().showInfoDialog(
                                context: context,
                                product: product!,
                                quantity: widget.quantity,
                              );
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
            if (widget.isOrderCancellable)
              Align(
                alignment: Alignment.centerRight,
                child: ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red.shade400,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16, vertical: 10),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8)),
                  ),
                  onPressed: widget.onCancelOrder,
                  icon: const Icon(Icons.cancel),
                  label: const Text("Cancel Order"),
                ),
              ),
          ],
        ),
      ),
    );
  }

}
