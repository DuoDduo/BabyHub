import 'package:babyhub/data/repositories/repositories_authentication/authentication_repository.dart';
import 'package:babyhub/data/repositories/user/user_repository.dart';
import 'package:babyhub/data/services/network_manager.dart';
import 'package:babyhub/features/authentication/screens/onboarding/signup/verify_email.dart';
import 'package:babyhub/features/personalization/models/user_model.dart';
import 'package:babyhub/utils/constant/image_strings.dart';
import 'package:babyhub/utils/popups/full_screen_loader.dart';
import 'package:babyhub/utils/popups/loaders.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignupController extends GetxController {
  static SignupController get instance => Get.find();
  SignupController();

  final hidePassword = true.obs;
  final privacyPolicy = true.obs;
  final email = TextEditingController();
  final lastName = TextEditingController();
  final username = TextEditingController();
  final password = TextEditingController();
  final firstName = TextEditingController();
  final phoneNumber = TextEditingController();

  GlobalKey<FormState> signupFormKey = GlobalKey<FormState>();

  void signup() async {
    try {
      BFullScreenLoader.openLoadingDialog(
          " We are processing your information...",
          BabyHubImages.decorAnimation);

      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        BFullScreenLoader.stopLoading();
        return;
      }

      if (!signupFormKey.currentState!.validate()) {
        BFullScreenLoader.stopLoading();
        return;
      }

      if (!privacyPolicy.value) {
        BLoaders.warningSnackBar(
            title: " Accept Privacy Policy",
            message:
                " In order to create account, you must have to read and accept the Privacy Policy & Terms of use");
        return;
      }
      final userCredential = await AuthenticationRepository.instance
          .registerWithEmailAndPassword(
              email.text.trim(), password.text.trim());

      final newUser = UserModel(
          id: userCredential.user!.uid,
          firstName: firstName.text.trim(),
          lastName: lastName.text.trim(),
          username: username.text.trim(),
          email: email.text.trim(),
          phoneNumber: phoneNumber.text.trim(),
          profilePicture: " ");

      final userRepository = Get.put(UserRepository());
      userRepository.saveUserRecord(newUser);

      BFullScreenLoader.stopLoading();

      BLoaders.successSnackBar(
          title: " Congratulations",
          message: "Account Successfully Created, verify email to continue");

      Get.to(() => VerifyEmailScreen(
            email: email.text.trim(),
          ));
    } catch (e) {
      BFullScreenLoader.stopLoading();
      BLoaders.errorSnackBar(title: " on Snap!", message: e.toString());
    }
  }
}
