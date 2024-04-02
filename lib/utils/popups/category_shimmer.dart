import 'package:babyhub/utils/constant/sizes.dart';
import 'package:babyhub/utils/popups/shimmer.dart';
import 'package:flutter/material.dart';

class BCategoryShimmer extends StatelessWidget {
  const BCategoryShimmer({
    super.key,
    this.itemCount = 6,
  });

  final int itemCount;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 80,
        child: ListView.separated(
          shrinkWrap: true,
          itemCount: itemCount,
          scrollDirection: Axis.horizontal,
          separatorBuilder: (_, __) => const SizedBox(
            width: BabyHubSizes.spaceBtwItems,
          ),
          itemBuilder: (_, __) {
            return const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                BShimmerEffect(
                  width: 55,
                  height: 55,
                  radius: 55,
                ),
                SizedBox(
                  height: BabyHubSizes.spaceBtwItems / 2,
                ),
                BShimmerEffect(width: 55, height: 8),
              ],
            );
          },
        ));
  }
}
