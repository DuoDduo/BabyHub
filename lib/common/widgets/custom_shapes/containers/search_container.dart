import 'package:babyhub/utils/constant/colors.dart';
import 'package:babyhub/utils/constant/sizes.dart';
import 'package:babyhub/utils/device/device_utility.dart';
import 'package:babyhub/utils/helper/helper_function.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class BSearchContainer extends StatelessWidget {
  const BSearchContainer({
    super.key,
    required this.text,
    this.icon = Iconsax.search_normal,
    this.showBackground = true,
    this.showBorder = true,
    this.onTap,
    this.padding =
        const EdgeInsets.symmetric(horizontal: BabyHubSizes.defaultSpace),
  });
  final String text;
  final IconData? icon;
  final bool showBackground, showBorder;
  final VoidCallback? onTap;
  final EdgeInsetsGeometry padding;

  @override
  Widget build(BuildContext context) {
    final dark = BHelperFunctions.isDarkMode(context);
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: padding,
        child: Container(
          width: BabyHubDevice.getScreenWidth(context),
          padding: const EdgeInsets.all(BabyHubSizes.md),
          decoration: BoxDecoration(
              color: showBackground
                  ? dark
                      ? BabyHubColors.dark
                      : BabyHubColors.light
                  : Colors.transparent,
              borderRadius: BorderRadius.circular(BabyHubSizes.cardRadiusLg),
              border:
                  showBorder ? Border.all(color: BabyHubColors.grey) : null),
          child: Row(
            children: [
              Icon(
                icon,
                color: dark ? BabyHubColors.darkerGrey : Colors.grey,
              ),
              const SizedBox(
                width: BabyHubSizes.spaceBtwItems,
              ),
              Text(
                text,
                style: Theme.of(context).textTheme.bodySmall,
              )
            ],
          ),
        ),
      ),
    );
  }
}
