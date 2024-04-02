import 'package:babyhub/features/authentication/controllers_onboarding/onboarding_controller.dart';
import 'package:babyhub/utils/constant/colors.dart';
import 'package:babyhub/utils/constant/image_strings.dart';
import 'package:babyhub/utils/constant/sizes.dart';
import 'package:babyhub/utils/constant/text_string.dart';
import 'package:babyhub/utils/device/device_utility.dart';
import 'package:babyhub/utils/helper/helper_function.dart';
import 'package:flutter/material.dart';

Widget build(BuildContext context) {
  return Scaffold(
    body: Stack(children: [
      PageView(
        children: const [
          WelcomePage(
            image: BabyHubImages.welcomeImage,
            title: BabyHubTexts.welcomeTitle,
            subTitle: BabyHubTexts.welcomeSubtitle,
          ),
        ],
      ),
      const WelcomeButton(),
    ]),
  );
}

class WelcomePage extends StatelessWidget {
  const WelcomePage({
    super.key,
    required this.image,
    required this.title,
    required this.subTitle,
  });

  final String image, title, subTitle;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(BabyHubSizes.defaultSpace),
      child: Column(
        children: [
          Image(
            width: BHelperFunctions.screenWidth() * 0.8,
            height: BHelperFunctions.screenHeight() * 0.6,
            image: AssetImage(image),
          ),
          Column(
            children: [
              Text(
                title,
                style: Theme.of(context).textTheme.headlineMedium,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: BabyHubSizes.spaceBtwItems),
              Text(
                subTitle,
                style: Theme.of(context).textTheme.bodyMedium,
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class WelcomeButton extends StatelessWidget {
  const WelcomeButton({super.key});

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
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          backgroundColor: dark ? BabyHubColors.primary : BabyHubColors.primary,
        ),
        child: Container(
          width: 150.0,
          height: 50.0,
          alignment: Alignment.center,
          child: const Text(
            'Get Started Now',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
