import 'package:flutter/material.dart';

extension HeightPercentOnInt on int {
  double h(BuildContext context) {
    return MediaQuery.of(context).size.height * this / 100;
  }
}

extension HeightPercentOnDouble on double {
  double h(BuildContext context) {
    return MediaQuery.of(context).size.height * this / 100;
  }
}

extension WidthercentOnInt on int {
  double w(BuildContext context) {
    return MediaQuery.of(context).size.width * this / 100;
  }
}

extension WidthercentOnDouble on double {
  double w(BuildContext context) {
    return MediaQuery.of(context).size.width * this / 100;
  }
}

extension HorizontalSizedBox on int {
  Widget percentHorizontalSpace(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * this / 100,
    );
  }
}

extension VerticalSizedBox on int {
  Widget percentVerticalSpace(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * this / 100,
    );
  }
}

extension HorizontalSizedBoxOnDouble on double {
  Widget percentHorizontalSpace(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * this / 100,
    );
  }
}

extension VerticalSizedBoxOnDouble on double {
  Widget percentVerticalSpace(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * this / 100,
    );
  }
}

extension AmazonEmberFontTextStyle on TextStyle {
  TextStyle setEmberHeight() {
    return copyWith(height: 1.35);
  }
}
