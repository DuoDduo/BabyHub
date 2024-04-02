import 'package:babyhub/utils/constant/colors.dart';
import 'package:babyhub/utils/constant/sizes.dart';
import 'package:flutter/material.dart';

class BRoundedContainer extends StatelessWidget {
  const BRoundedContainer(
      {super.key,
      this.child,
      this.width,
      this.height,
      this.margin,
      this.padding,
      this.showBorder = false,
      this.backgroundColor = BabyHubColors.white,
      this.radius = BabyHubSizes.cardRadiusLg,
      this.borderColor = BabyHubColors.borderPrimary});

  final double? height;
  final double? width;
  final Widget? child;
  final bool showBorder;
  final Color backgroundColor;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final double radius;
  final Color borderColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      padding: padding,
      margin: margin,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(radius),
        border: showBorder ? Border.all(color: borderColor) : null,
      ),
      child: child,
    );
  }
}
