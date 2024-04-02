import 'package:babyhub/common/styles/rounded_container.dart';
import 'package:babyhub/common/widgets/product_cards/b_brand_card.dart';
import 'package:babyhub/features/shop/models/brand_model.dart';
import 'package:babyhub/utils/constant/colors.dart';
import 'package:babyhub/utils/constant/sizes.dart';
import 'package:babyhub/utils/helper/helper_function.dart';
import 'package:flutter/material.dart';

class BBrandShowCase extends StatelessWidget {
  const BBrandShowCase({
    super.key,
    required this.images,
  });

  final List<String> images;

  @override
  Widget build(BuildContext context) {
    return BRoundedContainer(
      showBorder: true,
      borderColor: BabyHubColors.darkGrey,
      backgroundColor: Colors.transparent,
      padding: const EdgeInsets.all(BabyHubSizes.md),
      margin: const EdgeInsets.only(bottom: BabyHubSizes.spaceBtwItems),
      child: Column(
        children: [
          BBrandCard(
            showBorder: false,
            brand: BrandModel.empty(),
          ),
          const SizedBox(
            height: BabyHubSizes.spaceBtwItems,
          ),
          Row(
              children: images
                  .map((image) => brandTopProductImageWidget(image, context))
                  .toList())
        ],
      ),
    );
  }

  Widget brandTopProductImageWidget(String image, context) {
    return Expanded(
        child: BRoundedContainer(
            height: 100,
            padding: const EdgeInsets.all(BabyHubSizes.md),
            margin: const EdgeInsets.only(right: BabyHubSizes.sm),
            backgroundColor: BHelperFunctions.isDarkMode(context)
                ? BabyHubColors.darkerGrey
                : BabyHubColors.light,
            child: Image(fit: BoxFit.contain, image: AssetImage(image))));
  }
}
