import 'package:babyhub/data/repositories/user/user_repository.dart';
import 'package:babyhub/data/services/network_manager.dart';
import 'package:babyhub/features/personalization/controllers/user_controller.dart';
import 'package:babyhub/features/personalization/screens/profile/profile.dart';
import 'package:babyhub/utils/constant/image_strings.dart';
import 'package:babyhub/utils/popups/full_screen_loader.dart';
import 'package:babyhub/utils/popups/loaders.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UpdateNameController extends GetxController {
  static UpdateNameController get instance => Get.find();
  final firstName = TextEditingController();
  final lastName = TextEditingController();
  final userController = UserController.instance;
  final userRepository = Get.put(UserRepository());

  GlobalKey<FormState> updateUserNameFormKey = GlobalKey<FormState>();

  @override
  void onInit() {
    initializeNames();
    super.onInit();
  }

  Future<void> initializeNames() async {
    firstName.text = userController.user.value.firstName;
    lastName.text = userController.user.value.lastName;
  }

  Future<void> updateUserName() async {
    try {
      BFullScreenLoader.openLoadingDialog(
          "We are updating your information", BabyHubImages.decorAnimation);

      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        BFullScreenLoader.stopLoading();
        return;
      }
      if (!updateUserNameFormKey.currentState!.validate()) {
        BFullScreenLoader.stopLoading();
        return;
      }
      Map<String, dynamic> name = {
        "FirstName": firstName.text.trim(),
        "LastName": lastName.text.trim()
      };
      await userRepository.updateSingleField(name);
      userController.user.value.firstName = firstName.text.trim();
      userController.user.value.lastName = lastName.text.trim();

      BFullScreenLoader.stopLoading();
      BLoaders.successSnackBar(
          title: "Congratulations", message: "Your name has been updated");

      Get.off(() => const ProfileScreen());
    } catch (e) {
      BFullScreenLoader.stopLoading();
      BLoaders.errorSnackBar(title: "Oh Snap!", message: e.toString());
    }
  }
}
