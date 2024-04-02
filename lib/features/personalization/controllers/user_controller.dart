import 'package:babyhub/data/repositories/repositories_authentication/authentication_repository.dart';
import 'package:babyhub/data/repositories/user/user_repository.dart';
import 'package:babyhub/data/services/network_manager.dart';
import 'package:babyhub/features/authentication/screens/onboarding/login/login.dart';
import 'package:babyhub/features/personalization/models/user_model.dart';
import 'package:babyhub/features/personalization/screens/profile/widgets/re_authenticate_user_login_form.dart';
import 'package:babyhub/utils/constant/image_strings.dart';
import 'package:babyhub/utils/constant/sizes.dart';
import 'package:babyhub/utils/popups/full_screen_loader.dart';
import 'package:babyhub/utils/popups/loaders.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class UserController extends GetxController {
  static UserController get instance => Get.find();

  final profileLoading = false.obs;
  Rx<UserModel> user = UserModel.empty().obs;

  final hidePassword = false.obs;
  final imageUploading = false.obs;
  final verifyEmail = TextEditingController();
  final verifyPassword = TextEditingController();
  final userRepository = Get.put(UserRepository());
  GlobalKey<FormState> reAuthFormKey = GlobalKey<FormState>();

  @override
  void onInit() {
    super.onInit();
    fetchUserRecord();
  }

  Future<void> fetchUserRecord() async {
    try {
      profileLoading.value = true;
      final user = await userRepository.fetchUserDetails();
      this.user(user);
    } catch (e) {
      user(UserModel.empty());
    } finally {
      profileLoading.value = false;
    }
  }

  Future<void> saveUserRecord(UserCredential? userCredentials) async {
    try {
      await fetchUserRecord();
      if (user.value.id.isEmpty) {
        if (userCredentials != null) {
          final nameParts =
              UserModel.nameParts(userCredentials.user!.displayName ?? "");
          final username = UserModel.generateUsername(
              userCredentials.user!.displayName ?? "");

          final user = UserModel(
            id: userCredentials.user!.uid,
            firstName: nameParts[0],
            lastName:
                nameParts.length > 1 ? nameParts.sublist(1).join(" ") : "",
            username: username,
            email: userCredentials.user!.email ?? "",
            phoneNumber: userCredentials.user!.phoneNumber ?? "",
            profilePicture: userCredentials.user!.photoURL ?? "",
          );
          await userRepository.saveUserRecord(user);
        }
      }
    } catch (e) {
      BLoaders.warningSnackBar(
        title: "Data not Saved",
        message:
            "Something went wrong while saving your information. You can re-save your data in your Profile.",
      );
    }
  }

  void deleteUserAccount() async {
    try {
      BFullScreenLoader.openLoadingDialog(
          "Processing", BabyHubImages.decorAnimation);
      final auth = AuthenticationRepository.instance;
      final provider =
          auth.authUser!.providerData.map((e) => e.providerId).first;
      if (provider.isNotEmpty) {
        if (provider == "google.com") {
          await auth.signInWithGoogle();
          await auth.deleteAccount();
          BFullScreenLoader.stopLoading();
          Get.offAll(() => const LoginScreen());
        } else if (provider == "password") {
          BFullScreenLoader.stopLoading();
          Get.to(() => const ReAuthLoginForm());
        }
      }
    } catch (e) {
      BFullScreenLoader.stopLoading();
      BLoaders.warningSnackBar(title: "Oh snap!", message: e.toString());
    }
  }

  void deleteAccountWarningPopup() {
    Get.defaultDialog(
      contentPadding: const EdgeInsets.all(BabyHubSizes.md),
      title: 'Delete Account',
      middleText:
          "Are you sure you want to delete your account permanently? This action is not reversible and all of your data will be removed permanently",
      confirm: ElevatedButton(
        onPressed: () async => deleteUserAccount(),
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.red,
          side: const BorderSide(color: Colors.red),
        ),
        child: const Padding(
          padding: EdgeInsets.symmetric(horizontal: BabyHubSizes.lg),
          child: Text("Delete"),
        ),
      ),
      cancel: OutlinedButton(
        onPressed: () => Navigator.of(Get.overlayContext!).pop(),
        child: const Text('Cancel'),
      ),
    );
  }

  Future<void> reAuthenticateEmailAndPasswordUser() async {
    try {
      BFullScreenLoader.openLoadingDialog(
          "Processing", BabyHubImages.decorAnimation);
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        BFullScreenLoader.stopLoading();
        return;
      }
      if (!reAuthFormKey.currentState!.validate()) {
        BFullScreenLoader.stopLoading();
        return;
      }

      await AuthenticationRepository.instance
          .reAuthenticateWithEmailAndPassword(
              verifyEmail.text.trim(), verifyPassword.text.trim());
      await AuthenticationRepository.instance.deleteAccount();
      BFullScreenLoader.stopLoading();
      Get.offAll(() => const LoginScreen());
    } catch (e) {
      BFullScreenLoader.stopLoading();
      BLoaders.warningSnackBar(title: "Oh Snap", message: e.toString());
    }
  }

  uploadUserProfilePicture() async {
    try {
      final image = await ImagePicker().pickImage(
          source: ImageSource.gallery,
          imageQuality: 70,
          maxHeight: 512,
          maxWidth: 512);
      if (image != null) {
        imageUploading.value = true;
        final imageUrl =
            await userRepository.uploadImage("Users/Images/Profile/", image);
        Map<String, dynamic> json = {"ProfilePicture": imageUrl};
        await userRepository.updateSingleField(json);

        user.value.profilePicture = imageUrl;
        user.refresh();
        BLoaders.successSnackBar(
            title: " Congratulations",
            message: " Your profile Image has been updated");
      }
    } catch (e) {
      BLoaders.errorSnackBar(
          title: "oh snap!", message: ' Something went wrong');
    } finally {
      imageUploading.value = false;
    }
  }
}
