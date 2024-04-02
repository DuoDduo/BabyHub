import 'package:babyhub/common/styles/rounded_container.dart';
import 'package:babyhub/common/widgets/choices/choice_chip.dart';
import 'package:babyhub/common/widgets/texts/product_price_text.dart';
import 'package:babyhub/common/widgets/texts/products_title_text.dart';
import 'package:babyhub/common/widgets/texts/section_heading.dart';
import 'package:babyhub/utils/constant/colors.dart';
import 'package:babyhub/utils/constant/sizes.dart';
import 'package:babyhub/utils/helper/helper_function.dart';
import 'package:flutter/material.dart';

class BProductAttributes extends StatelessWidget {
  const BProductAttributes({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = BHelperFunctions.isDarkMode(context);
    return Column(
      children: [
        BRoundedContainer(
          padding: const EdgeInsets.all(BabyHubSizes.md),
          backgroundColor: dark ? BabyHubColors.darkerGrey : BabyHubColors.grey,
          child: Column(
            children: [
              Row(
                children: [
                  const BSectionHeading(
                    title: " Variation",
                    showActionButton: false,
                  ),
                  const SizedBox(
                    width: BabyHubSizes.spaceBtwItems,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          const BProductTitleText(
                            title: " Price: ",
                            smallSize: true,
                          ),
                          Text(
                            "₦2,500",
                            style: Theme.of(context)
                                .textTheme
                                .titleSmall!
                                .apply(decoration: TextDecoration.lineThrough),
                          ),
                          const SizedBox(
                            width: BabyHubSizes.spaceBtwItems,
                          ),
                          const BProductPriceText(price: ' 2,000')
                        ],
                      ),
                      Row(
                        children: [
                          const BProductTitleText(
                            title: " Stock: ",
                            smallSize: true,
                          ),
                          Text(
                            " In Stock",
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                        ],
                      )
                    ],
                  ),
                ],
              ),
              const BProductTitleText(
                title: "This is the description of Cussons Baby Oil",
                smallSize: true,
                maxLines: 4,
              )
            ],
          ),
        ),
        const SizedBox(
          height: BabyHubSizes.spaceBtwItems,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const BSectionHeading(
              title: " Colors",
              showActionButton: false,
            ),
            const SizedBox(
              height: BabyHubSizes.spaceBtwItems / 2,
            ),
            Wrap(
              spacing: 8,
              children: [
                BChoiceChip(
                  text: 'Green',
                  selected: false,
                  onSelected: (value) {},
                ),
                BChoiceChip(
                  text: 'Blue',
                  selected: true,
                  onSelected: (value) {},
                ),
                BChoiceChip(
                  text: 'Yellow',
                  selected: false,
                  onSelected: (value) {},
                ),
              ],
            )
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const BSectionHeading(
              title: " Sizes",
              showActionButton: false,
            ),
            const SizedBox(
              height: BabyHubSizes.spaceBtwItems / 2,
            ),
            Wrap(
              spacing: 8,
              children: [
                BChoiceChip(
                  text: "S",
                  selected: true,
                  onSelected: (value) {},
                ),
                BChoiceChip(
                  text: 'M',
                  selected: false,
                  onSelected: (value) {},
                ),
                BChoiceChip(
                  text: 'L',
                  selected: false,
                  onSelected: (value) {},
                ),
                BChoiceChip(
                  text: 'XL',
                  selected: false,
                  onSelected: (value) {},
                ),
                BChoiceChip(
                  text: 'XXL',
                  selected: false,
                  onSelected: (value) {},
                ),
              ],
            )
          ],
        )
      ],
    );
  }
}
