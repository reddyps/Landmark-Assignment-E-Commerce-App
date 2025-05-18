import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:landmark_assignment/features/product/models/model/product/product_model.dart';

class InfoDialog {
  void showInfoDialog({
    required BuildContext context,
    required ProductData product,
    required int quantity,
  }) {
    final totalPrice = product.price != null
        ? (product.price! * quantity).toStringAsFixed(2)
        : '0.00';

    final orderDate = DateFormat('dd MMM yyyy').format(DateTime.now());

    AlertDialog alert = AlertDialog(
      title: Text("Order Detail", style: Theme.of(context).textTheme.titleLarge),
      content: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _dataRow("Product Title", product.title ?? "N/A"),
            _dataRow("Category", product.category ?? "N/A"),
            _dataRow("Description", product.description ?? "N/A"),
            _dataRow("Price (per unit)", "₹${product.price?.toStringAsFixed(2) ?? '0.00'}"),
            _dataRow("Quantity", quantity.toString()),
            _dataRow("Total", "₹$totalPrice"),
            _dataRow("Order Date", orderDate),
          ],
        ),
      ),
      actions: [
        ElevatedButton(
          onPressed: () => Navigator.of(context).pop(),
          child: const Text("Close"),
        )
      ],
    );

    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (_) => alert,
    );
  }

  Widget _dataRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(flex: 3, child: Text("$label: ", style: const TextStyle(fontWeight: FontWeight.bold))),
          Expanded(flex: 5, child: Text(value)),
        ],
      ),
    );
  }
}
