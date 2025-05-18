import 'package:flutter/widgets.dart';
class SizeConfig{

  static MediaQueryData? _mediaQueryData;
  static double? screenWidth;
  static double? screenHeight;
  static double? blockSizeHorizontal;
  static double? blockSizeVertical;
  static double? permanentBlockSize;
  static double? small;
  static double? medium;
  static double? large;
  static bool isSmall = false;
  static bool isMedium = false;
  static bool isLarge= false;


  void initialize(BuildContext context) {

    //block sizes
    _mediaQueryData = MediaQuery.of(context);
    screenWidth = _mediaQueryData!.size.width;
    screenHeight = _mediaQueryData!.size.height;
    blockSizeHorizontal = screenWidth! / 100;
    blockSizeVertical = screenHeight! / 100;

    if(blockSizeVertical!<=6.68){
      blockSizeVertical=7.67;
    }
    /*blockSizeVertical = blockSizeVertical!+1;
    print("blockSizeHorizontal : $blockSizeHorizontal");
    print("blockSizeVertical : $blockSizeVertical");*/
    /*blockSizeVertical=10;
    blockSizeHorizontal=6;
    print("blockSizeHorizontal1 : $blockSizeHorizontal");
    print("blockSizeVertical1 : $blockSizeVertical");*/

    //text sizes
    if(screenWidth! > 950){ // Desktop Size
      small = 14;
      medium = 16;
      large = 18;
      isSmall = false;
      isMedium = false;
      isLarge= true;
    }
    else if(screenWidth! > 600){ // Tablet Size
      small = 14;
      medium = 16;
      large = 18;

      isSmall = false;
      isMedium = true;
      isLarge= false;
    }
    else { //Phone Size
      small = 12;
      medium = 14;
      large = 18;
      isSmall = true;
      isMedium = false;
      isLarge= false;
    }

    //fix for ipad orientaion
    if(MediaQuery.of(context).orientation == Orientation.landscape){
      permanentBlockSize = screenWidth! / 100;
    }
    else{
      permanentBlockSize = screenHeight! / 100;
    }
  }

}