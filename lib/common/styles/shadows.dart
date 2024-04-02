import 'package:babyhub/utils/constant/colors.dart';
import 'package:flutter/material.dart';

class BShadowStyle {
  static final verticalProductShadow = BoxShadow(
      color: BabyHubColors.darkerGrey.withOpacity(0.1),
      blurRadius: 50,
      spreadRadius: 7,
      offset: const Offset(0, 2));

  static final horizontalProductShadow = BoxShadow(
      color: BabyHubColors.darkerGrey.withOpacity(0.1),
      blurRadius: 50,
      spreadRadius: 7,
      offset: const Offset(0, 2));
}
