import 'package:babyhub/utils/constant/colors.dart';
import 'package:babyhub/utils/helper/helper_function.dart';
import 'package:babyhub/utils/popups/animation_loader_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BFullScreenLoader {
  static void openLoadingDialog(String text, String animation) {
    showDialog(
      context: Get.overlayContext!,
      barrierDismissible: false,
      builder: (_) => PopScope(
        canPop: false,
        child: Container(
          color: BHelperFunctions.isDarkMode(Get.context!)
              ? BabyHubColors.dark
              : BabyHubColors.white,
          width: double.infinity,
          height: double.infinity,
          child: Column(
            children: [
              const SizedBox(
                height: 250,
              ),
              BAnimationLoaderWidget(
                text: text,
                animation: animation,
              )
            ],
          ),
        ),
      ),
    );
  }

  static stopLoading() {
    Navigator.of(Get.overlayContext!).pop();
  }
}
