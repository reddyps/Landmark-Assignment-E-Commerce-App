import 'package:flutter/material.dart';
import 'package:landmark_assignment/core/util/theme/constants.dart';
import 'package:landmark_assignment/core/util/value/constants.dart';


class UnitPrice extends StatelessWidget {
  const UnitPrice({
    super.key,
    required this.price,
  });

  final double price;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Unit price",
          style: Theme.of(context).textTheme.titleSmall,
        ),
        const SizedBox(height: defaultPadding / 1),
        Text.rich(
          TextSpan(
            text: "${Constants.indianRupee}${price.toStringAsFixed(2)}",
            style: Theme.of(context).textTheme.titleLarge,
          ),
        )
      ],
    );
  }
}
