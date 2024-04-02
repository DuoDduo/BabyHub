import 'package:babyhub/common/widgets/appbar/appbar.dart';
import 'package:babyhub/common/widgets/images/b_rounded_image.dart';
import 'package:babyhub/common/widgets/product_cards/product_card_horizontal.dart';
import 'package:babyhub/common/widgets/texts/section_heading.dart';
import 'package:babyhub/utils/constant/image_strings.dart';
import 'package:babyhub/utils/constant/sizes.dart';
import 'package:flutter/material.dart';

class SubCategoriesScreen extends StatelessWidget {
  const SubCategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const BAppBar(title: Text(" Diapers"), showBackArrow: true),
      body: SingleChildScrollView(
        child: Padding(
            padding: const EdgeInsets.all(BabyHubSizes.defaultSpace),
            child: Column(
              children: [
                const BRoundedImage(
                  imageUrl: BabyHubImages.promoBanner1,
                  height: null,
                  width: double.infinity,
                  applyImageRadius: true,
                ),
                const SizedBox(
                  height: BabyHubSizes.spaceBtwSections,
                ),
                Column(
                  children: [
                    BSectionHeading(
                      title: " Featured Diapers",
                      onPressed: () {},
                    ),
                    const SizedBox(
                      height: BabyHubSizes.spaceBtwItems / 2,
                    ),
                    SizedBox(
                      height: 120,
                      child: ListView.separated(
                        itemCount: 4,
                        scrollDirection: Axis.horizontal,
                        separatorBuilder: (context, index) => const SizedBox(
                          width: BabyHubSizes.spaceBtwItems,
                        ),
                        itemBuilder: (context, index) =>
                            const BProductCardHorizontal(),
                      ),
                    ),
                  ],
                )
              ],
            )),
      ),
    );
  }
}
