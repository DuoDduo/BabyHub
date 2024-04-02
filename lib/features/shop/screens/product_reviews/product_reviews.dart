import 'package:babyhub/common/widgets/appbar/appbar.dart';
import 'package:babyhub/common/widgets/product_cart/ratings/rating_indicator.dart';
import 'package:babyhub/features/shop/screens/product_reviews/widgets/rating_progress_indicator.dart';
import 'package:babyhub/features/shop/screens/product_reviews/widgets/user_review_card.dart';
import 'package:babyhub/utils/constant/sizes.dart';
import 'package:flutter/material.dart';

class ProductReviewScreen extends StatelessWidget {
  const ProductReviewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const BAppBar(
        title: Text(" Reviews and Ratings"),
        showBackArrow: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(BabyHubSizes.defaultSpace),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            const Text(
                " Ratings and Reviews are verified and are from people who use the same type of products as you"),
            const SizedBox(
              height: BabyHubSizes.spaceBtwItems,
            ),
            const BOverallProductRating(),
            const BRatingBarIndicator(
              rating: 3.5,
            ),
            Text("100", style: Theme.of(context).textTheme.bodySmall),
            const SizedBox(
              height: BabyHubSizes.spaceBtwSections,
            ),
            const UserReviewCard(),
            const UserReviewCard(),
            const UserReviewCard(),
          ]),
        ),
      ),
    );
  }
}
