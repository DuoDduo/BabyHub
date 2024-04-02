import 'package:babyhub/utils/constant/colors.dart';
import 'package:babyhub/utils/device/device_utility.dart';
import 'package:babyhub/utils/helper/helper_function.dart';
import 'package:flutter/material.dart';

class BTabBar extends StatelessWidget implements PreferredSizeWidget {
  const BTabBar({super.key, required this.tabs});
  final List<Widget> tabs;

  @override
  Widget build(BuildContext context) {
    final dark = BHelperFunctions.isDarkMode(context);

    return Material(
      color: dark ? BabyHubColors.black : BabyHubColors.white,
      child: TabBar(
        tabs: tabs,
        isScrollable: true,
        indicatorColor: BabyHubColors.primary,
        labelColor: dark ? BabyHubColors.white : BabyHubColors.primary,
        unselectedLabelColor: BabyHubColors.darkGrey,
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(BabyHubDevice.getAppBarHeight());
}
