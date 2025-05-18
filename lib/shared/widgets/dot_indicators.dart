import 'package:flutter/material.dart';
import 'package:landmark_assignment/core/util/value/colors.dart';
import 'package:landmark_assignment/core/util/value/dimens.dart';

class DotIndicator extends StatelessWidget {
  const DotIndicator({
    super.key,
    this.isActive = false,
    this.inActiveColor,
    this.activeColor = AppColors.primaryColor,
  });

  final bool isActive;

  final Color? inActiveColor, activeColor;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Dimens.defaultDuration,
      height: isActive ? 12 : 4,
      width: 4,
      decoration: BoxDecoration(
        color: isActive
            ? activeColor
            : inActiveColor ?? AppColors.primaryMaterialColor.shade100,
        borderRadius: const BorderRadius.all(Radius.circular(Dimens.defaultPadding)),
      ),
    );
  }
}
