import 'package:babyhub/features/authentication/controllers/signup/signup_controller.dart';
import 'package:babyhub/features/authentication/screens/onboarding/sign_up_widgets/terms_and_conditions.dart';
import 'package:babyhub/utils/constant/sizes.dart';
import 'package:babyhub/utils/constant/text_string.dart';
import 'package:babyhub/utils/validations/validator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class BSignupForm extends StatelessWidget {
  const BSignupForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SignupController());
    return Form(
      key: controller.signupFormKey,
      child: Column(
        children: [
          TextFormField(
            controller: controller.firstName,
            validator: (value) =>
                BValidator.validateEmptyText(" First name", value),
            expands: false,
            decoration: const InputDecoration(
                labelText: BabyHubTexts.firstname,
                prefixIcon: Icon(Icons.account_circle)),
          ),
          const SizedBox(height: BabyHubSizes.spaceBtwInputFields),
          TextFormField(
            controller: controller.lastName,
            validator: (value) =>
                BValidator.validateEmptyText(" Last name", value),
            expands: false,
            decoration: const InputDecoration(
                labelText: BabyHubTexts.lastname,
                prefixIcon: Icon(Icons.account_circle)),
          ),
          const SizedBox(height: BabyHubSizes.spaceBtwInputFields),
          TextFormField(
            controller: controller.username,
            validator: (value) =>
                BValidator.validateEmptyText(" Username", value),
            expands: false,
            decoration: const InputDecoration(
                labelText: BabyHubTexts.userName,
                prefixIcon: Icon(Icons.account_circle_outlined)),
          ),
          const SizedBox(height: BabyHubSizes.spaceBtwInputFields),
          TextFormField(
            controller: controller.email,
            validator: (value) => BValidator.validateEmail(value),
            expands: false,
            decoration: const InputDecoration(
                labelText: BabyHubTexts.email,
                prefixIcon: Icon(Icons.email_rounded)),
          ),
          const SizedBox(height: BabyHubSizes.spaceBtwInputFields),
          TextFormField(
            controller: controller.phoneNumber,
            validator: (value) => BValidator.validatePhoneNumber(value),
            expands: false,
            decoration: const InputDecoration(
                labelText: BabyHubTexts.phoneNo, prefixIcon: Icon(Icons.call)),
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
          const SizedBox(height: BabyHubSizes.spaceBtwInputFields),
          const BHubTermsAndConditions(),
          const SizedBox(height: BabyHubSizes.spaceBtwSections),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
                onPressed: () => controller.signup(),
                child: const Text(BabyHubTexts.createAccount)),
          )
        ],
      ),
    );
  }
}
