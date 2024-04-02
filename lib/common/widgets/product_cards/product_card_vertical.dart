import 'package:babyhub/common/styles/rounded_container.dart';
import 'package:babyhub/common/styles/shadows.dart';
import 'package:babyhub/common/widgets/icons/b_circular_icon.dart';
import 'package:babyhub/common/widgets/images/b_rounded_image.dart';
import 'package:babyhub/common/widgets/texts/b_brand_title_text_with_verified.dart';
import 'package:babyhub/common/widgets/texts/product_price_text.dart';
import 'package:babyhub/common/widgets/texts/products_title_text.dart';
import 'package:babyhub/features/shop/screens/product_details/product_detail.dart';
import 'package:babyhub/utils/constant/colors.dart';
import 'package:babyhub/utils/constant/image_strings.dart';
import 'package:babyhub/utils/constant/sizes.dart';
import 'package:babyhub/utils/helper/helper_function.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class BProductCardVertical extends StatelessWidget {
  const BProductCardVertical({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final bool isDark = BHelperFunctions.isDarkMode(context);

    return GestureDetector(
      onTap: () => Get.to(() => const ProductDetailScreen()),
      child: Container(
        width: 180,
        padding: const EdgeInsets.all(1),
        decoration: BoxDecoration(
          boxShadow: [BShadowStyle.verticalProductShadow],
          borderRadius: BorderRadius.circular(BabyHubSizes.productImageRadius),
          color: isDark ? BabyHubColors.darkerGrey : BabyHubColors.white,
        ),
        child: Column(
          children: [
            BRoundedContainer(
              height: 180,
              padding: const EdgeInsets.all(BabyHubSizes.sm),
              backgroundColor:
                  isDark ? BabyHubColors.dark : BabyHubColors.light,
              child: Stack(
                children: [
                  const BRoundedImage(
                    imageUrl: BabyHubImages.product2,
                    applyImageRadius: true,
                  ),
                  Positioned(
                    top: 12,
                    child: BRoundedContainer(
                      radius: BabyHubSizes.sm,
                      backgroundColor: BabyHubColors.secondary.withOpacity(0.8),
                      padding: const EdgeInsets.symmetric(
                        horizontal: BabyHubSizes.sm,
                        vertical: BabyHubSizes.xs,
                      ),
                      child: Text(
                        "25%",
                        style: Theme.of(context)
                            .textTheme
                            .labelLarge!
                            .apply(color: BabyHubColors.black),
                      ),
                    ),
                  ),
                  const Positioned(
                    top: 0,
                    right: 0,
                    child: BCircularIcon(
                      icon: Iconsax.heart5,
                      color: Colors.red,
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(
              height: BabyHubSizes.spaceBtwItems / 2,
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: BabyHubSizes.sm),
              child: SizedBox(
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    BProductTitleText(
                      title: "Cussons Baby Oil",
                      smallSize: true,
                    ),
                    SizedBox(height: BabyHubSizes.spaceBtwItems / 2),
                    BBrandTitleWithVerifiedIcon(title: " Cussons"),
                  ],
                ),
              ),
            ),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: BabyHubSizes.sm),
                        child: Text(
                          " 25%",
                          style: Theme.of(context)
                              .textTheme
                              .labelMedium!
                              .apply(decoration: TextDecoration.lineThrough),
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(left: BabyHubSizes.sm),
                        child: BProductPriceText(
                          price: "1200",
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  decoration: const BoxDecoration(
                    color: BabyHubColors.dark,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(BabyHubSizes.cardRadiusMd),
                      bottomRight:
                          Radius.circular(BabyHubSizes.productImageRadius),
                    ),
                  ),
                  child: const SizedBox(
                    width: BabyHubSizes.iconLg * 1.2,
                    height: BabyHubSizes.iconLg * 1.2,
                    child: Center(
                      child: Icon(
                        Iconsax.add,
                        color: BabyHubColors.white,
                      ),
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
