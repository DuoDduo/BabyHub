import 'package:babyhub/features/authentication/controllers/login/login_controller.dart';
import 'package:babyhub/utils/constant/colors.dart';
import 'package:babyhub/utils/constant/image_strings.dart';
import 'package:babyhub/utils/constant/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BSocialButtons extends StatelessWidget {
  const BSocialButtons({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LoginController());
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          decoration: BoxDecoration(
              border: Border.all(color: BabyHubColors.primary),
              borderRadius: BorderRadius.circular(100)),
          child: IconButton(
            onPressed: () => controller.googleSignIn(),
            icon: const Image(
              width: BabyHubSizes.iconMd,
              height: BabyHubSizes.iconMd,
              image: AssetImage(BabyHubImages.google),
            ),
          ),
        ),
        const SizedBox(
          width: BabyHubSizes.spaceBtwItems,
        ),
        Container(
          decoration: BoxDecoration(
              border: Border.all(color: BabyHubColors.primary),
              borderRadius: BorderRadius.circular(100)),
          child: IconButton(
            onPressed: () {},
            icon: const Image(
              width: BabyHubSizes.iconMd,
              height: BabyHubSizes.iconMd,
              image: AssetImage(BabyHubImages.facebook),
            ),
          ),
        ),
      ],
    );
  }
}
