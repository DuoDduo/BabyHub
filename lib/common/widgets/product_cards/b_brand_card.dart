import 'package:babyhub/common/styles/rounded_container.dart';
import 'package:babyhub/common/widgets/images/b_circular_image.dart';
import 'package:babyhub/common/widgets/texts/b_brand_title_text_with_verified.dart';
import 'package:babyhub/features/shop/models/brand_model.dart';
import 'package:babyhub/utils/constant/enums.dart';
import 'package:babyhub/utils/constant/sizes.dart';
import 'package:babyhub/utils/helper/helper_function.dart';
import 'package:flutter/material.dart';

class BBrandCard extends StatelessWidget {
  const BBrandCard({
    super.key,
    required this.showBorder,
    this.onTap,
    required this.brand,
  });

  final bool showBorder;
  final void Function()? onTap;
  final BrandModel brand;
  @override
  Widget build(BuildContext context) {
    final isDark = BHelperFunctions.isDarkMode(context);
    return GestureDetector(
      onTap: onTap,
      child: BRoundedContainer(
        padding: const EdgeInsets.all(BabyHubSizes.sm),
        showBorder: showBorder,
        backgroundColor: Colors.transparent,
        child: Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
          Flexible(
            child: BCircularImage(
              image: brand.image,
              isNetworkImage: true,
              backgroundColor: Colors.transparent,
              // overlayColor:  isDark
              //     ? BabyHubColors.white
              //     : BabyHubColors.black,
            ),
          ),
          const SizedBox(width: BabyHubSizes.spaceBtwItems / 2),
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                BBrandTitleWithVerifiedIcon(
                  title: brand.name,
                  brandTextSize: TextSizes.large,
                ),
                Text(
                  ' $brand.productsCount ??  0 }products',
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.labelMedium,
                )
              ],
            ),
          )
        ]),
      ),
    );
  }
}
