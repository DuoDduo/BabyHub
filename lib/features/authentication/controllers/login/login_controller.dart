import 'package:babyhub/data/repositories/repositories_authentication/authentication_repository.dart';
import 'package:babyhub/data/services/network_manager.dart';
import 'package:babyhub/features/personalization/controllers/user_controller.dart';
import 'package:babyhub/utils/constant/image_strings.dart';
import 'package:babyhub/utils/popups/full_screen_loader.dart';
import 'package:babyhub/utils/popups/loaders.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class LoginController extends GetxController {
  final email = TextEditingController();
  final password = TextEditingController();
  final localStorage = GetStorage();
  final rememberMe = false.obs;
  final hidePassword = true.obs;

  GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();
  final userController = Get.put(UserController());
  @override
  void onInit() {
    final rememberMeEmail = localStorage.read("REMEMBER_ME_EMAIL");
    final rememberMePassword = localStorage.read("REMEMBER_ME_PASSWORD");

    if (rememberMeEmail != null) {
      email.text = rememberMeEmail;
    }

    if (rememberMePassword != null) {
      password.text = rememberMePassword;
    }

    super.onInit();
  }

  Future<void> emailAndPasswordSignIn() async {
    try {
      BFullScreenLoader.openLoadingDialog(
          " Logging you in...", BabyHubImages.decorAnimation);

      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        BFullScreenLoader.stopLoading();
        return;
      }
      if (!loginFormKey.currentState!.validate()) {
        BFullScreenLoader.stopLoading();
        return;
      }
      if (rememberMe.value) {
        localStorage.write((" REMEMBER_ME_EMAIL"), email.text.trim());
        localStorage.write((" REMEMBER_ME_PASSWORD"), email.text.trim());
      }
      final userCredentials = await AuthenticationRepository.instance
          .loginWithEmailAndPassword(email.text.trim(), password.text.trim());

      BFullScreenLoader.stopLoading();

      AuthenticationRepository.instance.screenRedirect();
    } catch (e) {
      BFullScreenLoader.stopLoading();
      BLoaders.errorSnackBar(title: ' Oh Snap', message: e.toString());
    }
  }

  Future<void> googleSignIn() async {
    try {
      BFullScreenLoader.openLoadingDialog(
          " Logging you in", BabyHubImages.decorAnimation);
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        BFullScreenLoader.stopLoading();
        return;
      }
      final userCredentials =
          await AuthenticationRepository.instance.signInWithGoogle();

      await userController.saveUserRecord(userCredentials);
      BFullScreenLoader.stopLoading();
      AuthenticationRepository.instance.screenRedirect();
    } catch (e) {
      BFullScreenLoader.stopLoading();
      BLoaders.errorSnackBar(title: " Oh Snap", message: e.toString());
    }
  }
}
