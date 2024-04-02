import 'package:babyhub/utils/constant/sizes.dart';
import 'package:flutter/material.dart';

class BBillingAmountSection extends StatelessWidget {
  const BBillingAmountSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              " Subtotal",
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            Text(
              " ₦ 3,000",
              style: Theme.of(context).textTheme.bodyMedium,
            )
          ],
        ),
        const SizedBox(
          height: BabyHubSizes.spaceBtwItems / 2,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              " Shipping Fee",
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            Text(
              " ₦300",
              style: Theme.of(context).textTheme.labelLarge,
            )
          ],
        ),
        const SizedBox(
          height: BabyHubSizes.spaceBtwItems / 2,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              " Tax Fee",
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            Text(
              " ₦ 200",
              style: Theme.of(context).textTheme.labelLarge,
            )
          ],
        ),
        const SizedBox(
          height: BabyHubSizes.spaceBtwItems / 2,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              " Order Total",
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            Text(
              " ₦ 3700",
              style: Theme.of(context).textTheme.titleMedium,
            )
          ],
        ),
      ],
    );
  }
}
