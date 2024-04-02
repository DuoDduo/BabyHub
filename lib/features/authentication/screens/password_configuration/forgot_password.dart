import 'package:babyhub/features/authentication/controllers/forget_password/forget_password_controller.dart';
import 'package:babyhub/utils/constant/sizes.dart';
import 'package:babyhub/utils/constant/text_string.dart';
import 'package:babyhub/utils/validations/validator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ForgotPassword extends StatelessWidget {
  const ForgotPassword({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ForgetPasswordController());
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(BabyHubSizes.defaultSpace),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              BabyHubTexts.forgotPasswordTitle,
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const SizedBox(height: BabyHubSizes.spaceBtwItems),
            Text(BabyHubTexts.forgotPasswordSubtitle,
                style: Theme.of(context).textTheme.labelMedium),
            const SizedBox(height: BabyHubSizes.spaceBtwItems * 2),
            Form(
              key: controller.forgetPasswordFormKey,
              child: TextFormField(
                controller: controller.email,
                validator: BValidator.validateEmail,
                decoration: const InputDecoration(
                    labelText: BabyHubTexts.email,
                    prefixIcon: Icon(Icons.email_rounded)),
              ),
            ),
            const SizedBox(height: BabyHubSizes.spaceBtwSections),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                  onPressed: () {
                    controller.sendPasswordResetEmail();
                  },
                  child: const Text(BabyHubTexts.submit)),
            )
          ],
        ),
      ),
    );
  }
}
