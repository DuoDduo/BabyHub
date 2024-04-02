import 'package:babyhub/features/authentication/controllers/signup/signup_controller.dart';
import 'package:babyhub/utils/constant/colors.dart';
import 'package:babyhub/utils/constant/sizes.dart';
import 'package:babyhub/utils/constant/text_string.dart';
import 'package:babyhub/utils/helper/helper_function.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BHubTermsAndConditions extends StatelessWidget {
  const BHubTermsAndConditions({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final dark = BHelperFunctions.isDarkMode(context);
    final controller = SignupController.instance;
    return Row(
      children: [
        SizedBox(
            width: 24,
            height: 24,
            child: Obx(() => Checkbox(
                value: controller.privacyPolicy.value,
                onChanged: (value) => controller.privacyPolicy.value =
                    !controller.privacyPolicy.value))),
        const SizedBox(width: BabyHubSizes.spaceBtwItems),
        Text.rich(TextSpan(children: [
          TextSpan(
              text: '${BabyHubTexts.iAgreeto} ',
              style: Theme.of(context).textTheme.bodySmall),
          TextSpan(
              text: '${BabyHubTexts.privacyPolicy} ',
              style: Theme.of(context).textTheme.bodyMedium!.apply(
                    color: dark ? BabyHubColors.white : BabyHubColors.primary,
                    decoration: TextDecoration.underline,
                    decorationColor:
                        dark ? BabyHubColors.white : BabyHubColors.primary,
                  )),
          TextSpan(
              text: '${BabyHubTexts.and} ',
              style: Theme.of(context).textTheme.bodySmall),
          TextSpan(
              text: BabyHubTexts.termsOfUse,
              style: Theme.of(context).textTheme.bodyMedium!.apply(
                    color: dark ? BabyHubColors.white : BabyHubColors.primary,
                    decoration: TextDecoration.underline,
                    decorationColor:
                        dark ? BabyHubColors.white : BabyHubColors.primary,
                  )),
        ]))
      ],
    );
  }
}
