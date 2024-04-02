import 'package:babyhub/features/authentication/controllers_onboarding/onboarding_controller.dart';
import 'package:babyhub/utils/constant/sizes.dart';
import 'package:babyhub/utils/device/device_utility.dart';
import 'package:flutter/material.dart';

class OnBoardingSkip extends StatelessWidget {
  const OnBoardingSkip({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: BabyHubDevice.getAppBarHeight(),
      right: BabyHubSizes.defaultSpace,
      child: TextButton(
        onPressed: () => OnBoardingController.instance.skipPage(),
        child: const Text(
          "Skip",
          style: TextStyle(
            color: Color(0xFF3669C9),
            fontSize: 16, // Change the color to whatever you desire
          ),
        ),
      ),
    );
  }
}
