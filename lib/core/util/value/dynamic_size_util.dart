import 'package:landmark_assignment/core/util/value/size_config.dart';

class DynamicSizeUtil {
  static double getResponsiveFontSize(double fontSize) {
    if (SizeConfig.isLarge) {
      return fontSize +4;
    } else if (SizeConfig.isMedium) {
      return fontSize +2;
    }else if (SizeConfig.isSmall) {
      return fontSize;
    }else {
      return fontSize;
    }
  }
}
