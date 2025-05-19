import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:landmark_assignment/core/base/base_viewmodel.dart';
import 'package:landmark_assignment/core/firebase/firebase_auth_type.dart';
import 'package:landmark_assignment/core/firebase/firebase_call.dart';
import 'package:landmark_assignment/core/navigation/routes.dart';
import 'package:landmark_assignment/core/util/extension/method_extension.dart';
import 'package:landmark_assignment/core/util/logger/logger_helper.dart';
import 'package:landmark_assignment/core/util/value/constants.dart';
import 'package:landmark_assignment/core/util/value/dimens.dart';
import 'package:landmark_assignment/features/auth/models/user_model.dart';
import 'package:flutter/foundation.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:landmark_assignment/features/auth/views/screens/register_page.dart';
import 'package:landmark_assignment/features/onbording/model/onboard.dart';

import '../../../main.dart';

@singleton
class OnBoardingViewModel extends BaseViewModel {

  late PageController _pageController;
  get pageController => _pageController;
  int _pageIndex = 0;
  get pageIndex =>_pageIndex;
  get onboardData => _onboardData;
  final List<Onboard> _onboardData = [
    Onboard(
      image: "assets/Illustration/Illustration-0.png",
      imageDarkTheme: "assets/Illustration/Illustration_darkTheme_0.png",
      title: "Find the item you’ve \nbeen looking for",
      description:
      "Here you’ll see rich varieties of goods, carefully classified for seamless browsing experience.",
    ),
    Onboard(
      image: "assets/Illustration/Illustration-1.png",
      imageDarkTheme: "assets/Illustration/Illustration_darkTheme_1.png",
      title: "Get those shopping \nbags filled",
      description:
      "Add any item you want to your cart, or save it on your wishlist, so you don’t miss it in your future purchases.",
    ),
    Onboard(
      image: "assets/Illustration/Illustration-2.png",
      imageDarkTheme: "assets/Illustration/Illustration_darkTheme_2.png",
      title: "Fast & secure \npayment",
      description: "There are many payment options available for your ease.",
    ),
    Onboard(
      image: "assets/Illustration/Illustration-3.png",
      imageDarkTheme: "assets/Illustration/Illustration_darkTheme_3.png",
      title: "Package tracking",
      description:
      "In particular, Shoplon can pack your orders, and help you seamlessly manage your shipments.",
    ),
    Onboard(
      image: "assets/Illustration/Illustration-4.png",
      imageDarkTheme: "assets/Illustration/Illustration_darkTheme_4.png",
      title: "Nearby stores",
      description:
      "Easily track nearby shops, browse through their items and get information about their prodcuts.",
    ),
  ];

  onSkipPressed(){
    push(Routes.loginScreen);
  }

  onPageChanged(value){
    _pageIndex = value;
  }

  onClickArrow() {
    if (_pageIndex < _onboardData.length - 1) {
      _pageController.nextPage(
          curve: Curves.ease, duration: Dimens.defaultDuration);
    } else {
      push(Routes.loginScreen);
    }
  }

  @override
  void initState() {
    _pageController = PageController(initialPage: 0);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }
}

