import 'package:babyhub/common/widgets/texts/section_heading.dart';
import 'package:babyhub/utils/constant/sizes.dart';
import 'package:flutter/material.dart';

class BBillingAddressSection extends StatelessWidget {
  const BBillingAddressSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        BSectionHeading(
          title: " Shipping Address",
          buttonTitle: " Change",
          onPressed: () {},
        ),
        Text(
          " 03 Anderson Street, USA",
          style: Theme.of(context).textTheme.bodyLarge,
        ),
        const SizedBox(
          height: BabyHubSizes.spaceBtwItems / 2,
        ),
        Row(
          children: [
            const Icon(
              Icons.phone,
              color: Colors.grey,
              size: 16,
            ),
            const SizedBox(
              width: BabyHubSizes.spaceBtwItems,
            ),
            Text(
              " +234 7865 6098",
              style: Theme.of(context).textTheme.bodyMedium,
            )
          ],
        ),
        const SizedBox(
          height: BabyHubSizes.spaceBtwItems / 2,
        ),
        Row(
          children: [
            const Icon(
              Icons.location_history,
              color: Colors.grey,
              size: 16,
            ),
            const SizedBox(
              width: BabyHubSizes.spaceBtwItems,
            ),
            Expanded(
              child: Text(
                " 03, Anderson Street, USA",
                style: Theme.of(context).textTheme.bodyMedium,
                softWrap: true,
              ),
            )
          ],
        ),
        const SizedBox(
          height: BabyHubSizes.spaceBtwItems,
        )
      ],
    );
  }
}
