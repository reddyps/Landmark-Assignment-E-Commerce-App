import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:landmark_assignment/core/base/base_view.dart';
import 'package:landmark_assignment/core/util/extension/method_extension.dart';
import 'package:landmark_assignment/core/util/value/images.dart';
import 'package:landmark_assignment/features/onbording/viewmodels/onboarding_view_model.dart';
import 'package:landmark_assignment/shared/widgets/dot_indicators.dart';

import 'components/onboarding_content.dart';
import 'package:landmark_assignment/core/util/value/dimens.dart';

class OnBoardingScreen extends BaseView<OnBoardingViewModel> {
   const OnBoardingScreen({super.key});

  @override
  void initState(OnBoardingViewModel viewModel) {
    super.initState(viewModel);
    viewModel.initState();
  }

  @override
  Widget build(BuildContext context, viewModel) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: Dimens.defaultPadding),
          child: Column(
            children: [
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: viewModel.onSkipPressed,
                  child: Text(
                    context.locale.skip,
                    style: TextStyle(
                        color: Theme.of(context).textTheme.bodyLarge!.color),
                  ),
                ),
              ),
              Expanded(
                child: PageView.builder(
                  controller: viewModel.pageController,
                  itemCount: viewModel.onboardData.length,
                  onPageChanged: viewModel.onPageChanged,
                  itemBuilder: (context, index) => OnboardingContent(
                    title: viewModel.onboardData[index].title,
                    description: viewModel.onboardData[index].description,
                    image: (Theme.of(context).brightness == Brightness.dark &&
                        viewModel.onboardData[index].imageDarkTheme != null)
                        ? viewModel.onboardData[index].imageDarkTheme!
                        : viewModel.onboardData[index].image,
                    isTextOnTop: index.isOdd,
                  ),
                ),
              ),
              Row(
                children: [
                  ...List.generate(
                    viewModel.onboardData.length,
                        (index) => Padding(
                      padding: const EdgeInsets.only(right: Dimens.defaultPadding / 4),
                      child: DotIndicator(isActive: index == viewModel.pageIndex),
                    ),
                  ),
                  const Spacer(),
                  SizedBox(
                    height: 60,
                    width: 60,
                    child: ElevatedButton(
                      onPressed: viewModel.onClickArrow,
                      style: ElevatedButton.styleFrom(
                        shape: const CircleBorder(),
                      ),
                      child: SvgPicture.asset(
                        Images.rightArrow,
                        colorFilter: const ColorFilter.mode(
                          Colors.white,
                          BlendMode.srcIn,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: Dimens.defaultPadding),
            ],
          ),
        ),
      ),
    );
  }

  @override
  OnBoardingViewModel createViewModel() {
    return OnBoardingViewModel();
  }

}

