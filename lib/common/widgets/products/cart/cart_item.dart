import 'package:babyhub/common/widgets/images/b_rounded_image.dart';
import 'package:babyhub/common/widgets/texts/b_brand_title_text_with_verified.dart';
import 'package:babyhub/common/widgets/texts/products_title_text.dart';
import 'package:babyhub/utils/constant/colors.dart';
import 'package:babyhub/utils/constant/image_strings.dart';
import 'package:babyhub/utils/constant/sizes.dart';
import 'package:babyhub/utils/helper/helper_function.dart';
import 'package:flutter/material.dart';

class BCartItem extends StatelessWidget {
  const BCartItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        BRoundedImage(
          imageUrl: BabyHubImages.product2,
          width: 60,
          height: 60,
          padding: const EdgeInsets.all(BabyHubSizes.sm),
          backgroundColor: BHelperFunctions.isDarkMode(context)
              ? BabyHubColors.darkerGrey
              : BabyHubColors.light,
        ),
        const SizedBox(width: BabyHubSizes.spaceBtwItems),
        Expanded(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const BBrandTitleWithVerifiedIcon(title: " Cussons"),
              const Flexible(
                child:
                    BProductTitleText(title: " Cussons Baby Oil", maxLines: 1),
              ),
              Padding(
                padding: const EdgeInsets.all(4.0),
                child: Text.rich(TextSpan(
                  children: [
                    TextSpan(
                        text: "Color",
                        style: Theme.of(context).textTheme.bodySmall),
                    TextSpan(
                        text: "Green",
                        style: Theme.of(context).textTheme.bodyLarge),
                    TextSpan(
                        text: "Size",
                        style: Theme.of(context).textTheme.bodySmall),
                    TextSpan(
                        text: "M",
                        style: Theme.of(context).textTheme.bodyLarge),
                  ],
                )),
              )
            ],
          ),
        )
      ],
    );
  }
}
