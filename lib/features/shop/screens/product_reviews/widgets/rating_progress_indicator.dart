import 'package:babyhub/features/shop/screens/product_reviews/widgets/progress_indicator_and_rating.dart';
import 'package:flutter/material.dart';

class BOverallProductRating extends StatelessWidget {
  const BOverallProductRating({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 3,
          child: Text(
            " 4.8",
            style: Theme.of(context).textTheme.displayLarge,
          ),
        ),
        const Expanded(
          flex: 7,
          child: Column(children: [
            BRatingProgressIndicator(
              text: '5',
              value: 1.0,
            ),
            BRatingProgressIndicator(
              text: '4',
              value: 0.8,
            ),
            BRatingProgressIndicator(
              text: '3',
              value: 0.6,
            ),
            BRatingProgressIndicator(
              text: '2',
              value: 0.4,
            ),
            BRatingProgressIndicator(
              text: '1',
              value: 0.2,
            ),
          ]),
        )
      ],
    );
  }
}
