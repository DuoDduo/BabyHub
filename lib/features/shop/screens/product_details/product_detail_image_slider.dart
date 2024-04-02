import 'package:babyhub/common/widgets/appbar/appbar.dart';
import 'package:babyhub/common/widgets/custom_shapes/curved_edges/curved_edges_widget.dart';
import 'package:babyhub/common/widgets/icons/b_circular_icon.dart';
import 'package:babyhub/common/widgets/images/b_rounded_image.dart';
import 'package:babyhub/utils/constant/colors.dart';
import 'package:babyhub/utils/constant/image_strings.dart';
import 'package:babyhub/utils/constant/sizes.dart';
import 'package:babyhub/utils/helper/helper_function.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class BProductImageSlider extends StatelessWidget {
  const BProductImageSlider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final dark = BHelperFunctions.isDarkMode(context);
    return BCurvedEdgeWidget(
      child: Container(
        color: dark ? BabyHubColors.darkerGrey : BabyHubColors.light,
        child: Stack(
          children: [
            const SizedBox(
                height: 400,
                child: Padding(
                  padding: EdgeInsets.all(BabyHubSizes.productImageRadius * 2),
                  child: Center(
                      child: Image(image: AssetImage(BabyHubImages.product2))),
                )),
            Positioned(
              right: 0,
              bottom: 30,
              left: BabyHubSizes.defaultSpace,
              child: SizedBox(
                height: 80,
                child: ListView.separated(
                  itemBuilder: (_, index) => BRoundedImage(
                    imageUrl: BabyHubImages.product2,
                    width: 80,
                    backgroundColor:
                        dark ? BabyHubColors.dark : BabyHubColors.white,
                    border: Border.all(color: BabyHubColors.primary),
                    padding: const EdgeInsets.all(BabyHubSizes.sm),
                  ),
                  separatorBuilder: (_, __) => const SizedBox(
                    width: BabyHubSizes.spaceBtwItems,
                  ),
                  itemCount: 6,
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  physics: const AlwaysScrollableScrollPhysics(),
                ),
              ),
            ),
            const BAppBar(
              showBackArrow: true,
              actions: [
                BCircularIcon(
                  icon: Iconsax.heart5,
                  color: Colors.red,
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
