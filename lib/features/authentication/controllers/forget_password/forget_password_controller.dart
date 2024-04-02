import 'package:babyhub/data/repositories/repositories_authentication/authentication_repository.dart';
import 'package:babyhub/data/services/network_manager.dart';
import 'package:babyhub/features/authentication/screens/password_configuration/reset_password.dart';
import 'package:babyhub/utils/constant/image_strings.dart';
import 'package:babyhub/utils/popups/full_screen_loader.dart';
import 'package:babyhub/utils/popups/loaders.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class ForgetPasswordController extends GetxController {
  static ForgetPasswordController get instance => Get.find();

  final email = TextEditingController();
  GlobalKey<FormState> forgetPasswordFormKey = GlobalKey<FormState>();

  sendPasswordResetEmail() async {
    try {
      BFullScreenLoader.openLoadingDialog(
          " Processing your request...", BabyHubImages.decorAnimation);
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        BFullScreenLoader.stopLoading();
        return;
      }
      if (!forgetPasswordFormKey.currentState!.validate()) {
        BFullScreenLoader.stopLoading();
        return;
      }
      await AuthenticationRepository.instance
          .sendPasswordResetEmail(email.text.trim());
      BFullScreenLoader.stopLoading();
      BLoaders.successSnackBar(
          title: " Email Sent",
          message: " Email link sent to reset your Password".tr);
      Get.to(() => ResetPassword(email: email.text.trim()));
    } catch (e) {
      BFullScreenLoader.stopLoading();
      BLoaders.errorSnackBar(title: " Oh Snap", message: e.toString());
    }
  }

  resendPasswordResetEmail(String email) async {
    try {
      BFullScreenLoader.openLoadingDialog(
          " Processing your request...", BabyHubImages.decorAnimation);
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        BFullScreenLoader.stopLoading();
        return;
      }

      await AuthenticationRepository.instance.sendPasswordResetEmail(email);
      BFullScreenLoader.stopLoading();
      BLoaders.successSnackBar(
          title: " Email Sent",
          message: " Email link sent to reset your Password".tr);
    } catch (e) {
      BFullScreenLoader.stopLoading();
      BLoaders.errorSnackBar(title: " Oh Snap", message: e.toString());
    }
  }
}
