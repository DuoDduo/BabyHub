import 'package:babyhub/features/authentication/controllers_onboarding/onboarding_controller.dart';
import 'package:babyhub/features/authentication/screens/onboarding/widgets/onboarding_dot_navigation.dart';
import 'package:babyhub/features/authentication/screens/onboarding/widgets/onboarding_page.dart';
import 'package:babyhub/features/authentication/screens/onboarding/widgets/onboarding_skip.dart';
import 'package:babyhub/utils/constant/colors.dart';
import 'package:babyhub/utils/constant/image_strings.dart';
import 'package:babyhub/utils/constant/sizes.dart';
import 'package:babyhub/utils/constant/text_string.dart';
import 'package:babyhub/utils/device/device_utility.dart';
import 'package:babyhub/utils/helper/helper_function.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(OnBoardingController());

    return Scaffold(
        body: Stack(children: [
      PageView(
        controller: controller.pageController,
        onPageChanged: controller.updatePageIndicator,
        children: const [
          OnBoardingPage(
              image: BabyHubImages.welcomeImage,
              title: BabyHubTexts.onBoardingTitle1,
              subTitle: BabyHubTexts.onBoardingSubTitle1),
          OnBoardingPage(
              image: BabyHubImages.onBoardingImage2,
              title: BabyHubTexts.onBoardingTitle2,
              subTitle: BabyHubTexts.onBoardingSubTitle2),
          OnBoardingPage(
              image: BabyHubImages.onBoardingImage3,
              title: BabyHubTexts.onBoardingTitle3,
              subTitle: BabyHubTexts.onBoardingSubTitle3)
        ],
      ),
      const OnBoardingSkip(),
      const OnBoardingNavigation(),
      const OnBoardingNextButton()
    ]));
  }
}

class OnBoardingNextButton extends StatelessWidget {
  const OnBoardingNextButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = OnBoardingController.instance;
    final dark = BHelperFunctions.isDarkMode(context);
    return Positioned(
      right: BabyHubSizes.defaultSpace,
      bottom: BabyHubDevice.getBottomNavigationBarHeight(),
      child: ElevatedButton(
        onPressed: () => OnBoardingController.instance.nextPage(),
        style: ElevatedButton.styleFrom(
            shape: const CircleBorder(),
            backgroundColor:
                dark ? BabyHubColors.primary : BabyHubColors.primary),
        child: const Icon(Icons.arrow_forward),
      ),
    );
  }
}
