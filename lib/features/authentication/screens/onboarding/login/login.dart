import 'package:babyhub/common/styles/spacing_styles.dart';
import 'package:babyhub/common/widgets_login_signup//B_login_header.dart';
import 'package:babyhub/common/widgets_login_signup/b_social_buttons.dart';
import 'package:babyhub/common/widgets_login_signup/form_divider.dart';
import 'package:babyhub/common/widgets_login_signup/login_form.dart';
import 'package:babyhub/utils/constant/sizes.dart';
import 'package:babyhub/utils/constant/text_string.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: BSpacingStyle.paddingWithAppBarHeight,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const BLoginHeader(),
              const BLoginForm(),
              BFormDivider(dividerText: BabyHubTexts.orSignInWIth.capitalize!),
              const SizedBox(
                height: BabyHubSizes.spaceBtwSections,
              ),
              const BSocialButtons(),
            ],
          ),
        ),
      ),
    );
  }
}
