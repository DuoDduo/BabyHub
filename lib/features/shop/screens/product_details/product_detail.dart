import 'package:babyhub/common/widgets/texts/section_heading.dart';
import 'package:babyhub/features/shop/screens/product_details/bottom_add_to_cart_widget.dart';
import 'package:babyhub/features/shop/screens/product_details/product_attributes.dart';
import 'package:babyhub/features/shop/screens/product_details/product_detail_image_slider.dart';
import 'package:babyhub/features/shop/screens/product_details/product_meta_data.dart';
import 'package:babyhub/features/shop/screens/product_details/rating_share_widget.dart';
import 'package:babyhub/features/shop/screens/product_reviews/product_reviews.dart';
import 'package:babyhub/utils/constant/sizes.dart';
import 'package:babyhub/utils/helper/helper_function.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:readmore/readmore.dart';

class ProductDetailScreen extends StatelessWidget {
  const ProductDetailScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final dark = BHelperFunctions.isDarkMode(context);
    return Scaffold(
      bottomNavigationBar: const BBottomAddToCart(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const BProductImageSlider(),
            Padding(
              padding: const EdgeInsets.only(
                  right: BabyHubSizes.defaultSpace,
                  left: BabyHubSizes.defaultSpace,
                  bottom: BabyHubSizes.defaultSpace),
              child: Column(
                children: [
                  const BRatingAndShare(),
                  const BProductMetaData(),
                  const BProductAttributes(),
                  const SizedBox(
                    height: BabyHubSizes.spaceBtwSections,
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                        onPressed: () {}, child: const Text(" Checkout")),
                  ),
                  const SizedBox(
                    height: BabyHubSizes.spaceBtwSections,
                  ),
                  const BSectionHeading(
                    title: " Description",
                    showActionButton: false,
                  ),
                  const SizedBox(
                    height: BabyHubSizes.spaceBtwItems,
                  ),
                  const ReadMoreText(
                    " This is a brief description of baby cussons oil and it's preferences. It's specific use and"
                    " other related essential products. Cussons has several types of products, keep "
                    "shopping to see more and also read reviews from customers",
                    trimLines: 2,
                    trimMode: TrimMode.Line,
                    trimCollapsedText: " Show more",
                    trimExpandedText: " Less",
                    moreStyle:
                        TextStyle(fontSize: 14, fontWeight: FontWeight.w800),
                    lessStyle:
                        TextStyle(fontSize: 14, fontWeight: FontWeight.w800),
                  ),
                  const Divider(),
                  const SizedBox(
                    height: BabyHubSizes.spaceBtwItems,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      BSectionHeading(
                        title: " Reviews(199)",
                        showActionButton: false,
                        onPressed: () {},
                      ),
                      IconButton(
                        icon: const Icon(Iconsax.arrow_right_3, size: 18),
                        onPressed: () =>
                            Get.to(() => const ProductReviewScreen()),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: BabyHubSizes.spaceBtwSections,
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
