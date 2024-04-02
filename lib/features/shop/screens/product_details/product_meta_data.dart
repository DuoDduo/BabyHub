import 'package:babyhub/common/styles/rounded_container.dart';
import 'package:babyhub/common/widgets/images/b_circular_image.dart';
import 'package:babyhub/common/widgets/texts/b_brand_title_text_with_verified.dart';
import 'package:babyhub/common/widgets/texts/product_price_text.dart';
import 'package:babyhub/common/widgets/texts/products_title_text.dart';
import 'package:babyhub/utils/constant/colors.dart';
import 'package:babyhub/utils/constant/enums.dart';
import 'package:babyhub/utils/constant/image_strings.dart';
import 'package:babyhub/utils/constant/sizes.dart';
import 'package:babyhub/utils/helper/helper_function.dart';
import 'package:flutter/material.dart';

class BProductMetaData extends StatelessWidget {
  const BProductMetaData({super.key});

  @override
  Widget build(BuildContext context) {
    final darkMode = BHelperFunctions.isDarkMode(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            BRoundedContainer(
              radius: BabyHubSizes.sm,
              backgroundColor: BabyHubColors.secondary.withOpacity(0.8),
              padding: const EdgeInsets.symmetric(
                  horizontal: BabyHubSizes.sm, vertical: BabyHubSizes.xs),
              child: Text(
                "25%",
                style: Theme.of(context)
                    .textTheme
                    .labelLarge!
                    .apply(color: BabyHubColors.black),
              ),
            ),
            const SizedBox(
              width: BabyHubSizes.spaceBtwItems,
            ),
            Text(
              " ₦2,500",
              style: Theme.of(context)
                  .textTheme
                  .titleSmall!
                  .apply(decoration: TextDecoration.lineThrough),
            ),
            const SizedBox(
              width: BabyHubSizes.spaceBtwItems,
            ),
            const BProductPriceText(
              price: '2,000',
              isLarge: true,
            ),
          ],
        ),
        const SizedBox(
          height: BabyHubSizes.spaceBtwItems / 1.5,
        ),
        const BProductTitleText(title: " Cussons Baby Oil"),
        const SizedBox(
          height: BabyHubSizes.spaceBtwItems / 1.5,
        ),

        ///Stack Status
        Row(
          children: [
            const BProductTitleText(title: " Status: "),
            const SizedBox(
              height: BabyHubSizes.spaceBtwItems,
            ),
            Text(
              " In Stock",
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ],
        ),

        const SizedBox(
          height: BabyHubSizes.spaceBtwItems / 1.5,
        ),
        const Row(
          children: [
            BCircularImage(
              width: 40,
              height: 40,
              image: BabyHubImages.cussons,
              // overlayColor: darkMode? BabyHubColors.white : BabyHubColors.black,
            ),
            BBrandTitleWithVerifiedIcon(
              title: " Cussons",
              brandTextSize: TextSizes.medium,
            ),
          ],
        )
      ],
    );
  }
}
