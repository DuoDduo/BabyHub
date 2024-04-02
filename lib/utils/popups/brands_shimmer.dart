import 'package:babyhub/common/widgets/layouts/grid_layout.dart';
import 'package:babyhub/utils/popups/shimmer.dart';
import 'package:flutter/material.dart';

class BBrandsShimmer extends StatelessWidget {
  const BBrandsShimmer({super.key, this.itemCount = 4});

  final int itemCount;
  @override
  Widget build(BuildContext context) {
    return BGridLayout(
      itemCount: itemCount,
      itemBuilder: (_, __) => const BShimmerEffect(width: 300, height: 80),
    );
  }
}
