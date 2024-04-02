import 'package:babyhub/common/widgets/icons/b_circular_icon.dart';
import 'package:babyhub/utils/constant/colors.dart';
import 'package:babyhub/utils/constant/sizes.dart';
import 'package:babyhub/utils/helper/helper_function.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class BBottomAddToCart extends StatelessWidget {
  const BBottomAddToCart({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = BHelperFunctions.isDarkMode(context);
    return Container(
      padding: const EdgeInsets.symmetric(
          horizontal: BabyHubSizes.defaultSpace,
          vertical: BabyHubSizes.defaultSpace / 2),
      decoration: BoxDecoration(
          color: dark ? BabyHubColors.darkerGrey : BabyHubColors.light,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(BabyHubSizes.cardRadiusLg),
            topRight: Radius.circular(BabyHubSizes.cardRadiusLg),
          )),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              const BCircularIcon(
                icon: Iconsax.minus,
                backgroundColor: BabyHubColors.darkGrey,
                width: 40,
                height: 40,
                color: BabyHubColors.white,
              ),
              const SizedBox(
                width: BabyHubSizes.spaceBtwItems,
              ),
              Text(
                " 2",
                style: Theme.of(context).textTheme.titleSmall,
              ),
              const SizedBox(
                width: BabyHubSizes.spaceBtwItems,
              ),
              const BCircularIcon(
                icon: Iconsax.add,
                backgroundColor: BabyHubColors.black,
                width: 40,
                height: 40,
                color: BabyHubColors.white,
              ),
            ],
          ),
          ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.all(BabyHubSizes.md),
                  backgroundColor: BabyHubColors.black,
                  side: const BorderSide(color: BabyHubColors.black)),
              child: const Text(" Add to Cart"))
        ],
      ),
    );
  }
}
