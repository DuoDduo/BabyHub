import 'package:babyhub/common/widgets/layouts/grid_layout.dart';
import 'package:babyhub/common/widgets/product_cards/brand_showcase.dart';
import 'package:babyhub/common/widgets/product_cards/product_card_vertical.dart';
import 'package:babyhub/common/widgets/texts/section_heading.dart';
import 'package:babyhub/features/shop/models/category_model.dart';
import 'package:babyhub/utils/constant/image_strings.dart';
import 'package:babyhub/utils/constant/sizes.dart';
import 'package:flutter/material.dart';

class BCategoryTab extends StatelessWidget {
  const BCategoryTab({super.key, required this.category});
  final CategoryModel category;

  @override
  Widget build(BuildContext context) {
    return ListView(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        children: [
          Padding(
            padding: const EdgeInsets.all(BabyHubSizes.defaultSpace),
            child: Column(
              children: [
                const BBrandShowCase(
                  images: [
                    BabyHubImages.product2,
                    BabyHubImages.product1,
                    BabyHubImages.product1
                  ],
                ),
                const BBrandShowCase(
                  images: [
                    BabyHubImages.product2,
                    BabyHubImages.product1,
                    BabyHubImages.product1
                  ],
                ),
                const SizedBox(
                  height: BabyHubSizes.spaceBtwItems,
                ),
                BSectionHeading(
                  title: " You might like",
                  onPressed: () {},
                ),
                const SizedBox(
                  height: BabyHubSizes.spaceBtwItems,
                ),
                BGridLayout(
                    itemCount: 4,
                    itemBuilder: (_, index) => const BProductCardVertical()),
                const SizedBox(
                  height: BabyHubSizes.spaceBtwSections,
                )
              ],
            ),
          ),
        ]);
  }
}
