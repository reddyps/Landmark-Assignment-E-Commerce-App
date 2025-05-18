import 'package:flutter/material.dart';
import 'package:landmark_assignment/core/util/theme/constants.dart';
import 'package:landmark_assignment/core/util/value/constants.dart';
import 'package:landmark_assignment/shared/widgets/network_image_with_loader.dart';


class ProductCard extends StatelessWidget {
  const ProductCard({
    super.key,
    required this.description,
    required this.image,
    required this.brandName,
    required this.title,
    required this.price,
    required this.press,
  });
  final String image, brandName, title,description;
  final double price;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return Material(
      child: OutlinedButton(
        onPressed: press,
        style: OutlinedButton.styleFrom(
            minimumSize: const Size(140, 220),
            maximumSize: const Size(140, 220),
            padding: const EdgeInsets.all(8)),
        child: Column(
          children: [
            AspectRatio(
              aspectRatio: 1.15,
              child: Stack(
                children: [
                  NetworkImageWithLoader(image, radius: defaultBorderRadious),
                ],
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: defaultPadding / 2, vertical: defaultPadding / 2),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      brandName.toUpperCase(),
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium!
                          .copyWith(fontSize: 10),
                    ),
                    const SizedBox(height: defaultPadding / 2),
                    Text(
                      title,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context)
                          .textTheme
                          .titleSmall!
                          .copyWith(fontSize: 12),
                    ),
                    Flexible(
                      child: Text(
                        description,
                        maxLines: 4,
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context)
                            .textTheme
                            .displaySmall!
                            .copyWith(fontSize: 10),
                      ),
                    ),

                    Text("${Constants.indianRupee}$price",
                            style: const TextStyle(
                              color: Color(0xFF31B0D8),
                              fontWeight: FontWeight.w500,
                              fontSize: 12,
                            ),
                          ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
