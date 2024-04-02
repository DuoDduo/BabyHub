import 'package:babyhub/common/widgets_login_signup/b_social_buttons.dart';
import 'package:babyhub/common/widgets_login_signup/form_divider.dart';
import 'package:babyhub/features/authentication/screens/onboarding/sign_up_widgets/sign_up_form.dart';
import 'package:babyhub/utils/constant/colors.dart';
import 'package:babyhub/utils/constant/sizes.dart';
import 'package:babyhub/utils/constant/text_string.dart';
import 'package:babyhub/utils/helper/helper_function.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = BHelperFunctions.isDarkMode(context);
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(BabyHubSizes.defaultSpace),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(BabyHubTexts.signUpTitle,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.headlineMedium!.apply(
                        color: dark
                            ? BabyHubColors.primary
                            : BabyHubColors.primary,
                        decorationColor:
                            dark ? BabyHubColors.white : BabyHubColors.primary,
                      )),
              const SizedBox(height: BabyHubSizes.sm),
              Text(
                BabyHubTexts.signUpSubTitle,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              const SizedBox(height: BabyHubSizes.spaceBtwSections),
              const BSignupForm(),
              const SizedBox(height: BabyHubSizes.spaceBtwSections),

              ///Divider
              BFormDivider(dividerText: BabyHubTexts.orSignUpWith.capitalize!),
              const SizedBox(height: BabyHubSizes.spaceBtwSections),
              const BSocialButtons(),
            ],
          ),
        ),
      ),
    );
  }
}
