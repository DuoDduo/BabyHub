import 'package:babyhub/common/styles/rounded_container.dart';
import 'package:babyhub/common/widgets/icons/b_circular_icon.dart';
import 'package:babyhub/common/widgets/images/b_rounded_image.dart';
import 'package:babyhub/common/widgets/texts/b_brand_title_text_with_verified.dart';
import 'package:babyhub/common/widgets/texts/product_price_text.dart';
import 'package:babyhub/common/widgets/texts/products_title_text.dart';
import 'package:babyhub/utils/constant/colors.dart';
import 'package:babyhub/utils/constant/image_strings.dart';
import 'package:babyhub/utils/constant/sizes.dart';
import 'package:babyhub/utils/helper/helper_function.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class BProductCardHorizontal extends StatelessWidget {
  const BProductCardHorizontal({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = BHelperFunctions.isDarkMode(context);
    return Container(
      width: 310,
      padding: const EdgeInsets.all(1),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(BabyHubSizes.productImageRadius),
        color: dark ? BabyHubColors.darkerGrey : BabyHubColors.softGrey,
      ),
      child: Row(
        children: [
          BRoundedContainer(
            height: 120,
            padding: const EdgeInsets.all(BabyHubSizes.sm),
            backgroundColor: dark ? BabyHubColors.dark : BabyHubColors.light,
            child: Stack(
              children: [
                const SizedBox(
                  height: 120,
                  width: 120,
                  child: BRoundedImage(
                    imageUrl: BabyHubImages.product2,
                    applyImageRadius: true,
                  ),
                ),
                Positioned(
                  top: 12,
                  child: BRoundedContainer(
                    radius: BabyHubSizes.sm,
                    backgroundColor: BabyHubColors.secondary.withOpacity(0.8),
                    padding: const EdgeInsets.symmetric(
                        horizontal: BabyHubSizes.sm, vertical: BabyHubSizes.xs),
                    child: Text(
                      " 25%",
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
                    )),
              ],
            ),
          ),
          SizedBox(
            width: 172,
            child: Padding(
              padding: const EdgeInsets.only(
                  top: BabyHubSizes.sm, left: BabyHubSizes.sm),
              child: Column(
                children: [
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      BProductTitleText(
                        title: "Cussons baby oil",
                        smallSize: true,
                      ),
                      SizedBox(
                        height: BabyHubSizes.spaceBtwItems / 2,
                      ),
                      BBrandTitleWithVerifiedIcon(title: " Cussons")
                    ],
                  ),
                  const Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Flexible(child: BProductPriceText(price: "2000")),
                      Container(
                        decoration: const BoxDecoration(
                          color: BabyHubColors.dark,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(BabyHubSizes.cardRadiusMd),
                            bottomRight: Radius.circular(
                                BabyHubSizes.productImageRadius),
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
          )
        ],
      ),
    );
  }
}
