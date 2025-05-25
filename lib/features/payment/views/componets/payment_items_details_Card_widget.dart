import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:dio/dio.dart';
import 'package:landmark_assignment/features/product/models/model/product/product_model.dart';

class PaymentItemsDetailsCardWidget extends StatefulWidget {
  final int productId;
  final int quantity;
  final double price;

  const PaymentItemsDetailsCardWidget({
    super.key,
    required this.productId,
    required this.quantity,
    required this.price,
  });

  @override
  State<PaymentItemsDetailsCardWidget> createState() => _PaymentItemsDetailsCardWidgetState();
}

class _PaymentItemsDetailsCardWidgetState extends State<PaymentItemsDetailsCardWidget> {
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
            : Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
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
                    'Price: ₹${product!.price!.toStringAsFixed(2)} x ${widget.quantity} = ₹${(product!.price! * widget.quantity).toStringAsFixed(2)}',
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                  Text(
                    "Added on: ${DateFormat('dd MMM yyyy').format(date)}",
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
