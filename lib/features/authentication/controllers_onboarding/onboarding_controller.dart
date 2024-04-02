import "package:babyhub/features/authentication/screens/onboarding/login/login.dart";
import "package:flutter/cupertino.dart";
import "package:flutter/foundation.dart";
import "package:get/get.dart";
import "package:get_storage/get_storage.dart";

class OnBoardingController extends GetxController {
  static OnBoardingController get instance => Get.find();

  ///variables
  final pageController = PageController();
  Rx<int> currentPageIndex = 0.obs;

  ///update current index when page start
  void updatePageIndicator(index) => currentPageIndex.value = index;

  ///Jump to the specific dot selected page
  void dotNavigationCLick(index) {
    currentPageIndex.value = index;
    pageController.jumpTo(index);
  }

  /// update current index & jump to next page
  void nextPage() {
    if (currentPageIndex.value == 2) {
      final storage = GetStorage();

      if (kDebugMode) {
        print(" ============ GET Next Button=============");
        print(storage.read("IsFirstTime"));
      }
      storage.write("IsFirstTime", false);
      if (kDebugMode) {
        print(" ============ GET Next Button=============");
        print(storage.read("IsFirstTime"));
      }

      Get.offAll(const LoginScreen());
    } else {
      int page = currentPageIndex.value + 1;
      pageController.jumpToPage(page);
    }
  }

  /// update current index & jump to the last page
  void skipPage() {
    currentPageIndex.value = 2;
    pageController.jumpToPage(2);
  }
}
