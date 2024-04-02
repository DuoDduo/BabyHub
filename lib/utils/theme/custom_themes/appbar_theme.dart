import 'package:babyhub/utils/constant/colors.dart';
import 'package:babyhub/utils/constant/sizes.dart';
import 'package:flutter/material.dart';

class BabyHubAppBarTheme {
  BabyHubAppBarTheme._();

  static const lightAppBarTheme = AppBarTheme(
    elevation: 0,
    centerTitle: false,
    scrolledUnderElevation: 0,
    backgroundColor: Colors.transparent,
    surfaceTintColor: Colors.transparent,
    iconTheme:
        IconThemeData(color: BabyHubColors.black, size: BabyHubSizes.iconMd),
    actionsIconTheme:
        IconThemeData(color: BabyHubColors.black, size: BabyHubSizes.iconMd),
    titleTextStyle: TextStyle(
        fontSize: 18.0,
        fontWeight: FontWeight.w600,
        color: BabyHubColors.black),
  );

  static const darkAppBarTheme = AppBarTheme(
    elevation: 0,
    centerTitle: false,
    scrolledUnderElevation: 0,
    backgroundColor: Colors.transparent,
    surfaceTintColor: Colors.transparent,
    iconTheme:
        IconThemeData(color: BabyHubColors.black, size: BabyHubSizes.iconMd),
    actionsIconTheme:
        IconThemeData(color: BabyHubColors.white, size: BabyHubSizes.iconMd),
    titleTextStyle: TextStyle(
        fontSize: 18.0,
        fontWeight: FontWeight.w600,
        color: BabyHubColors.white),
  );
}
