import 'package:babyhub/common/widgets/layouts/grid_layout.dart';
import 'package:babyhub/utils/constant/sizes.dart';
import 'package:babyhub/utils/popups/shimmer.dart';
import 'package:flutter/material.dart';

class BVerticalProductShimmer extends StatelessWidget {
  const BVerticalProductShimmer({
    super.key,
    this.itemCount = 4,
  });

  final int itemCount;

  @override
  Widget build(BuildContext context) {
    return BGridLayout(
      itemCount: itemCount,
      itemBuilder: (_, __) => const SizedBox(
        width: 180,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Image
            BShimmerEffect(
              width: 180,
              height: 180,
            ),
            SizedBox(
              height: BabyHubSizes.spaceBtwItems,
            ), // Adjust as needed
            // Text
            BShimmerEffect(
              width: 160,
              height: 15,
            ),
            SizedBox(
              height: BabyHubSizes.spaceBtwItems / 2,
            ), // Adjust as needed
            BShimmerEffect(
              width: 110,
              height: 15,
            ),
          ],
        ),
      ),
    );
  }
}
