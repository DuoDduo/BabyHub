import 'package:babyhub/common/styles/rounded_container.dart';
import 'package:babyhub/common/widgets/product_cart/ratings/rating_indicator.dart';
import 'package:babyhub/utils/constant/colors.dart';
import 'package:babyhub/utils/constant/image_strings.dart';
import 'package:babyhub/utils/constant/sizes.dart';
import 'package:babyhub/utils/helper/helper_function.dart';
import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';

class UserReviewCard extends StatelessWidget {
  const UserReviewCard({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = BHelperFunctions.isDarkMode(context);
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                const CircleAvatar(
                  backgroundImage: AssetImage(BabyHubImages.user),
                ),
                const SizedBox(
                  width: BabyHubSizes.spaceBtwItems,
                ),
                Text(
                  " John Doe",
                  style: Theme.of(context).textTheme.titleLarge,
                ),
              ],
            ),
            IconButton(onPressed: () {}, icon: const Icon(Icons.more_vert))
          ],
        ),
        const SizedBox(
          height: BabyHubSizes.spaceBtwItems,
        ),
        Row(
          children: [
            const BRatingBarIndicator(rating: 4),
            const SizedBox(
              width: BabyHubSizes.spaceBtwItems,
            ),
            Text(
              " 22 Mar, 2024",
              style: Theme.of(context).textTheme.bodyMedium,
            )
          ],
        ),
        const SizedBox(
          height: BabyHubSizes.spaceBtwItems,
        ),
        const ReadMoreText(
          " Ratings and Reviews are verified and are from people who use the same type of products as you"
          ". I bought the products and it was delivered safely",
          trimLines: 1,
          trimMode: TrimMode.Line,
          trimExpandedText: " Show less",
          trimCollapsedText: " Show more",
          moreStyle: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: BabyHubColors.primary),
          lessStyle: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: BabyHubColors.primary),
        ),
        const SizedBox(
          height: BabyHubSizes.spaceBtwItems,
        ),
        BRoundedContainer(
          backgroundColor: dark ? BabyHubColors.darkerGrey : BabyHubColors.grey,
          child: Padding(
            padding: const EdgeInsets.all(BabyHubSizes.md),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      " B's Store",
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    Text(
                      " 29 Mar, 2024",
                      style: Theme.of(context).textTheme.bodyMedium,
                    )
                  ],
                ),
                const SizedBox(
                  height: BabyHubSizes.spaceBtwItems,
                ),
                const ReadMoreText(
                  " Ratings and Reviews are verified and are from people who use the same type of products as you"
                  ". I bought the products and it was delivered safely",
                  trimLines: 1,
                  trimMode: TrimMode.Line,
                  trimExpandedText: " Show less",
                  trimCollapsedText: " Show more",
                  moreStyle: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: BabyHubColors.primary),
                  lessStyle: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: BabyHubColors.primary),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(
          height: BabyHubSizes.spaceBtwSections,
        )
      ],
    );
  }
}
