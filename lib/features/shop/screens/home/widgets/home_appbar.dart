import 'package:babyhub/common/widgets/appbar/appbar.dart';
import 'package:babyhub/common/widgets/products/cart/cart_menu_icon.dart';
import 'package:babyhub/features/personalization/controllers/user_controller.dart';
import 'package:babyhub/utils/constant/colors.dart';
import 'package:babyhub/utils/constant/text_string.dart';
import 'package:babyhub/utils/popups/shimmer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BHomeAppBar extends StatelessWidget {
  const BHomeAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(UserController());
    return BAppBar(
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            BabyHubTexts.homeAppBarTitle,
            style: Theme.of(context)
                .textTheme
                .labelMedium!
                .apply(color: BabyHubColors.grey),
          ),
          Obx(() {
            if (controller.profileLoading.value) {
              return const BShimmerEffect(width: 80, height: 15);
            } else {
              return Text(
                controller.user.value.fullName,
                style: Theme.of(context)
                    .textTheme
                    .headlineSmall!
                    .apply(color: BabyHubColors.white),
              );
            }
          })
        ],
      ),
      actions: [
        BCartCounterIcon(
          onPressed: () {},
          iconColor: BabyHubColors.white,
        )
      ],
    );
  }
}
