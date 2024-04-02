import 'package:babyhub/features/authentication/controllers_onboarding/onboarding_controller.dart';
import 'package:babyhub/utils/constant/colors.dart';
import 'package:babyhub/utils/constant/sizes.dart';
import 'package:babyhub/utils/device/device_utility.dart';
import 'package:babyhub/utils/helper/helper_function.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoardingNavigation extends StatelessWidget {
  const OnBoardingNavigation({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final dark = BHelperFunctions.isDarkMode(context);
    final controller = OnBoardingController.instance;

    ;
    return Positioned(
        bottom: BabyHubDevice.getBottomNavigationBarHeight() + 25,
        left: BabyHubSizes.defaultSpace,
        child: SmoothPageIndicator(
          count: 3,
          controller: controller.pageController,
          onDotClicked: controller.dotNavigationCLick,
          effect: ExpandingDotsEffect(
              activeDotColor:
                  dark ? BabyHubColors.primary : BabyHubColors.primary,
              dotHeight: 6),
        ));
  }
}
