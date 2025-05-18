import 'package:flutter/material.dart';
import 'package:landmark_assignment/core/util/value/dimens.dart';


class OnboardingContent extends StatelessWidget {
  const OnboardingContent({
    super.key,
    this.isTextOnTop = false,
    required this.title,
    required this.description,
    required this.image,
  });

  final bool isTextOnTop;
  final String title, description, image;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Spacer(),

        if (isTextOnTop)
          OnbordTitleDescription(
            title: title,
            description: description,
          ),
        if (isTextOnTop) const Spacer(),

        Image.asset(
          image,
          height: 250,
        ),
        if (!isTextOnTop) const Spacer(),
        if (!isTextOnTop)
          const OnbordTitleDescription(
            title: "Find the item you’ve \nbeen looking for",
            description:
                "Here you’ll see rich varieties of goods, carefully classified for seamless browsing experience.",
          ),

        const Spacer(),
      ],
    );
  }
}

class OnbordTitleDescription extends StatelessWidget {
  const OnbordTitleDescription({
    super.key,
    required this.title,
    required this.description,
  });

  final String title, description;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          title,
          textAlign: TextAlign.center,
          style: Theme.of(context)
              .textTheme
              .headlineSmall!
              .copyWith(fontWeight: FontWeight.w500),
        ),
        const SizedBox(height: Dimens.defaultPadding),
        Text(
          description,
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
