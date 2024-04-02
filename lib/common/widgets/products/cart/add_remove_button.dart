import 'package:babyhub/common/widgets/icons/b_circular_icon.dart';
import 'package:babyhub/utils/constant/colors.dart';
import 'package:babyhub/utils/constant/sizes.dart';
import 'package:babyhub/utils/helper/helper_function.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class BProductQuantityWithAddRemoveButton extends StatelessWidget {
  const BProductQuantityWithAddRemoveButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        BCircularIcon(
          icon: Iconsax.minus,
          width: 32,
          height: 32,
          size: BabyHubSizes.md,
          color: BHelperFunctions.isDarkMode(context)
              ? BabyHubColors.white
              : BabyHubColors.black,
          backgroundColor: BHelperFunctions.isDarkMode(context)
              ? BabyHubColors.darkerGrey
              : BabyHubColors.light,
        ),
        const SizedBox(width: BabyHubSizes.spaceBtwItems),
        Text(
          "2",
          style: Theme.of(context).textTheme.titleSmall,
        ),
        const SizedBox(
          width: BabyHubSizes.spaceBtwItems,
        ),
        const BCircularIcon(
            icon: Iconsax.add,
            width: 32,
            height: 32,
            size: BabyHubSizes.md,
            color: BabyHubColors.white,
            backgroundColor: BabyHubColors.primary),
      ],
    );
  }
}
