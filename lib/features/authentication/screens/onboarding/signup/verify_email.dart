import 'package:babyhub/data/repositories/repositories_authentication/authentication_repository.dart';
import 'package:babyhub/features/authentication/controllers/signup/verify_email_controller.dart';
import 'package:babyhub/utils/constant/image_strings.dart';
import 'package:babyhub/utils/constant/sizes.dart';
import 'package:babyhub/utils/constant/text_string.dart';
import 'package:babyhub/utils/helper/helper_function.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class VerifyEmailScreen extends StatelessWidget {
  const VerifyEmailScreen({super.key, this.email});
  final String? email;
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(VerifyEmailController());
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
              onPressed: () => AuthenticationRepository.instance.logout(),
              icon: const Icon(CupertinoIcons.clear))
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
            padding: const EdgeInsets.all(BabyHubSizes.defaultSpace),
            child: Column(
              children: [
                Image(
                    image: const AssetImage(BabyHubImages.verifyIllustration),
                    width: BHelperFunctions.screenWidth() * 0.6),
                const SizedBox(height: BabyHubSizes.spaceBtwItems),
                Text(BabyHubTexts.confirmEmail,
                    style: Theme.of(context).textTheme.headlineMedium,
                    textAlign: TextAlign.center),
                const SizedBox(height: BabyHubSizes.spaceBtwItems),
                Text(email ?? "",
                    style: Theme.of(context).textTheme.labelLarge,
                    textAlign: TextAlign.center),
                const SizedBox(height: BabyHubSizes.spaceBtwItems),
                Text(BabyHubTexts.confirmEmailSubTitle,
                    style: Theme.of(context).textTheme.labelLarge,
                    textAlign: TextAlign.center),
                const SizedBox(height: BabyHubSizes.spaceBtwSections),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () => controller.checkEmailVerificationStatus(),
                    child: const Text(BabyHubTexts.tContinue),
                  ),
                ),
                const SizedBox(height: BabyHubSizes.spaceBtwItems),
                SizedBox(
                  width: double.infinity,
                  child: TextButton(
                    onPressed: () => controller.sendEmailVerification(),
                    child: const Text(
                      BabyHubTexts.resendEmail,
                      style: TextStyle(
                        color: Color(
                            0xFF3669C9), // Replace 0xFF00FF00 with your desired hex color code
                        fontSize: 16, // Replace 16 with your desired font size
                        fontWeight: FontWeight
                            .bold, // Replace FontWeight.bold with your desired font weight
                      ),
                    ),
                  ),
                )
              ],
            )),
      ),
    );
  }
}
