import 'package:flutter/material.dart';

Widget horizontalSpacing(double px) {
  return SizedBox(
    width: px,
  );
}

Widget verticalSpacing(double px) {
  return SizedBox(
    height: px,
  );
}

Widget squareSpacing(double px) {
  return SizedBox.square(
    dimension: px,
  );
}

extension DynamicFontSizeOnInt on int {
  double spMobile(BuildContext context) {
    return MediaQuery.of(context).size.width / 4.3 * this / 100;
  }

  double spWeb(BuildContext context) {
    return MediaQuery.of(context).size.width / 1.3 * this / 100;
  }

  double spTab(BuildContext context) {
    return MediaQuery.of(context).size.width / 7.3 * this / 100;
  }
}

extension DynamicFontSizeOnDouble on double {
  double spMobile(BuildContext context) {
    return MediaQuery.of(context).size.width / 4.3 * this / 100;
  }

  double spWeb(BuildContext context) {
    return MediaQuery.of(context).size.width / 11.3 * this / 100;
  }

  double spTab(BuildContext context) {
    return MediaQuery.of(context).size.width / 8 * this / 100;
  }
}
