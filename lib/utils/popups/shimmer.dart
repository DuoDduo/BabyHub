import 'package:babyhub/utils/constant/colors.dart';
import 'package:babyhub/utils/helper/helper_function.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class BShimmerEffect extends StatelessWidget {
  const BShimmerEffect({
    super.key,
    required this.width,
    required this.height,
    this.radius = 15,
    this.color,
  });

  final double width, height, radius;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    final dark = BHelperFunctions.isDarkMode(context);
    return Shimmer.fromColors(
      baseColor: dark ? Colors.grey[850]! : Colors.grey[300]!,
      highlightColor: dark ? Colors.grey[700]! : Colors.grey[100]!,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
            color: color ??
                (dark ? BabyHubColors.darkerGrey : BabyHubColors.white),
            borderRadius: BorderRadius.circular(radius)),
      ),
    );
  }
}
