import 'package:babyhub/features/authentication/controllers/login/login_controller.dart';
import 'package:babyhub/features/authentication/screens/onboarding/signup/signup.dart';
import 'package:babyhub/features/authentication/screens/password_configuration/forgot_password.dart';
import 'package:babyhub/utils/constant/sizes.dart';
import 'package:babyhub/utils/constant/text_string.dart';
import 'package:babyhub/utils/validations/validator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class BLoginForm extends StatelessWidget {
  const BLoginForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LoginController());
    return Form(
      key: controller.loginFormKey,
      child: Padding(
        padding:
            const EdgeInsets.symmetric(vertical: BabyHubSizes.spaceBtwSections),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              controller: controller.email,
              validator: (value) => BValidator.validateEmail(value),
              decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.email), labelText: BabyHubTexts.email),
            ),
            const SizedBox(height: BabyHubSizes.spaceBtwInputFields),
            Obx(
              () => TextFormField(
                controller: controller.password,
                obscureText: controller.hidePassword.value,
                validator: (value) => BValidator.validatePassword(value),
                expands: false,
                decoration: InputDecoration(
                    labelText: BabyHubTexts.password,
                    prefixIcon: const Icon(Icons.lock),
                    suffixIcon: IconButton(
                      onPressed: () => controller.hidePassword.value =
                          !controller.hidePassword.value,
                      icon: Icon(controller.hidePassword.value
                          ? Iconsax.eye_slash
                          : Iconsax.eye),
                    )),
              ),
            ),
            const SizedBox(height: BabyHubSizes.spaceBtwInputFields / 2),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Obx(
                      () => Checkbox(
                          value: controller.rememberMe.value,
                          onChanged: (value) => controller.rememberMe.value =
                              !controller.rememberMe.value),
                    ),
                    const Text(BabyHubTexts.rememberMe),
                  ],
                ),
                TextButton(
                  onPressed: () => Get.to(() => const ForgotPassword()),
                  // child: const Text(BabyHubTexts.forgotPassword),
                  child: const Text(
                    BabyHubTexts.forgotPassword,
                    style: TextStyle(
                      color: Color(0xFF3669C9),
                      fontSize: 16,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                )
              ],
            ),
            const SizedBox(height: BabyHubSizes.spaceBtwSections),
            SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                    onPressed: () => controller.emailAndPasswordSignIn(),
                    child: const Text(BabyHubTexts.signIn))),
            const SizedBox(height: BabyHubSizes.spaceBtwItems),
            SizedBox(
                width: double.infinity,
                child: OutlinedButton(
                    onPressed: () => Get.to(() => const SignupScreen()),
                    child: const Text(BabyHubTexts.createAccount))),
            const SizedBox(height: BabyHubSizes.spaceBtwSections),
          ],
        ),
      ),
    );
  }
}
