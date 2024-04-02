import 'package:babyhub/common/widgets/custom_shapes/containers/primary_header_container.dart';
import 'package:babyhub/common/widgets/custom_shapes/containers/search_container.dart';
import 'package:babyhub/common/widgets/layouts/grid_layout.dart';
import 'package:babyhub/common/widgets/product_cards/product_card_vertical.dart';
import 'package:babyhub/common/widgets/texts/section_heading.dart';
import 'package:babyhub/features/shop/screens/all_products/all_products.dart';
import 'package:babyhub/features/shop/screens/home/widgets/home_appbar.dart';
import 'package:babyhub/features/shop/screens/home/widgets/home_categories.dart';
import 'package:babyhub/features/shop/screens/home/widgets/promo_slider.dart';
import 'package:babyhub/utils/constant/image_strings.dart';
import 'package:babyhub/utils/constant/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // final controller = Get.put(ProductController());

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const BPrimaryHeaderContainer(
              child: Column(children: [
                BHomeAppBar(),
                SizedBox(
                  height: BabyHubSizes.spaceBtwSections,
                ),
                BSearchContainer(
                  text: " Search in Store",
                ),
                SizedBox(height: BabyHubSizes.spaceBtwSections),
                Padding(
                  padding: EdgeInsets.only(left: BabyHubSizes.defaultSpace),
                  child: Column(
                    children: [
                      BSectionHeading(
                        title: " Popular Categories",
                        showActionButton: false,
                        textColor: Colors.white,
                      ),
                      SizedBox(
                        height: BabyHubSizes.spaceBtwItems,
                      ),
                      BHomeCategories(),
                    ],
                  ),
                ),
                SizedBox(
                  height: BabyHubSizes.spaceBtwSections,
                )
              ]),
            ),
            Padding(
                padding: const EdgeInsets.all(BabyHubSizes.defaultSpace),
                child: Column(
                  children: [
                    const BPromoSlider(
                      banners: [
                        BabyHubImages.promoBanner1,
                        BabyHubImages.promoBanner2,
                        BabyHubImages.promoBanner3,
                      ],
                    ),
                    BSectionHeading(
                      title: " Popular Products",
                      onPressed: () => Get.to(() => const AllProducts()),
                    ),
                    const SizedBox(
                      height: BabyHubSizes.spaceBtwSections,
                    ),
                    BGridLayout(
                      itemCount: 4,
                      itemBuilder: (_, index) => const BProductCardVertical(),
                    ),
                  ],
                ))
          ],
        ),
      ),
    );
  }
}
