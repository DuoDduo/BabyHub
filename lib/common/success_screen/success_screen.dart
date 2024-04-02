import 'package:babyhub/common/styles/spacing_styles.dart';
import 'package:babyhub/navigation_menu.dart';
import 'package:babyhub/utils/constant/sizes.dart';
import 'package:babyhub/utils/constant/text_string.dart';
import 'package:babyhub/utils/helper/helper_function.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SuccessScreen extends StatelessWidget {
  const SuccessScreen(
      {super.key,
      required this.image,
      required this.title,
      required this.subTitle,
      this.onPressed});
  final String image, title, subTitle;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: BSpacingStyle.paddingWithAppBarHeight * 2,
          child: Column(
            children: [
              Image(
                  image: AssetImage(image),
                  width: BHelperFunctions.screenWidth() * 0.6),
              const SizedBox(height: BabyHubSizes.spaceBtwItems),
              Text(title,
                  style: Theme.of(context).textTheme.headlineMedium,
                  textAlign: TextAlign.center),
              const SizedBox(height: BabyHubSizes.spaceBtwItems),
              Text(subTitle,
                  style: Theme.of(context).textTheme.labelLarge,
                  textAlign: TextAlign.center),
              const SizedBox(height: BabyHubSizes.spaceBtwSections),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () => Get.to(() => const NavigationMenu()),
                  child: const Text(BabyHubTexts.tContinue),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
