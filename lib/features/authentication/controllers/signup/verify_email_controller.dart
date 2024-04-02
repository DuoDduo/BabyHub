import 'dart:async';

import 'package:babyhub/common/success_screen/success_screen.dart';
import 'package:babyhub/data/repositories/repositories_authentication/authentication_repository.dart';
import 'package:babyhub/utils/constant/image_strings.dart';
import 'package:babyhub/utils/constant/text_string.dart';
import 'package:babyhub/utils/popups/loaders.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class VerifyEmailController extends GetxController {
  static VerifyEmailController get instance => Get.find();

  @override
  void onInit() {
    sendEmailVerification();
    setTimerForAutoRedirect();
    super.onInit();
  }

  sendEmailVerification() async {
    try {
      await AuthenticationRepository.instance.sendEmailVerification();
      BLoaders.successSnackBar(
          title: "Email Sent!",
          message: " Check your Inbox and verify your email");
    } catch (e) {
      BLoaders.errorSnackBar(title: " Oh Snap!", message: e.toString());
    }
  }

  setTimerForAutoRedirect() {
    Timer.periodic(const Duration(seconds: 1), (timer) async {
      await FirebaseAuth.instance.currentUser?.reload();
      final user = FirebaseAuth.instance.currentUser;
      if (user?.emailVerified ?? false) {
        timer.cancel();
        Get.off(() => SuccessScreen(
              image: BabyHubImages.verifyIllustration,
              title: BabyHubTexts.accountCreated,
              subTitle: BabyHubTexts.accountCreatedSubTitle,
              onPressed: () =>
                  AuthenticationRepository.instance.screenRedirect(),
            ));
      }
    });
  }

  checkEmailVerificationStatus() async {
    final currentUser = FirebaseAuth.instance.currentUser;
    if (currentUser != null && currentUser.emailVerified) {
      Get.off(() => SuccessScreen(
            image: BabyHubImages.verifyIllustration,
            title: BabyHubTexts.accountCreated,
            subTitle: BabyHubTexts.accountCreatedSubTitle,
            onPressed: () => AuthenticationRepository.instance.screenRedirect(),
          ));
    }
  }
}
