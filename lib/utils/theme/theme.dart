import 'package:babyhub/utils/theme/custom_themes/appbar_theme.dart';
import 'package:babyhub/utils/theme/custom_themes/bottom_sheet_theme.dart';
import 'package:babyhub/utils/theme/custom_themes/checkbox_theme.dart';
import 'package:babyhub/utils/theme/custom_themes/chip_theme.dart';
import 'package:babyhub/utils/theme/custom_themes/elevated_button_theme.dart';
import 'package:babyhub/utils/theme/custom_themes/outlined_button_theme.dart';
import 'package:babyhub/utils/theme/custom_themes/text_field_theme.dart';
import 'package:babyhub/utils/theme/custom_themes/text_theme.dart';
import 'package:flutter/material.dart';

class BabyHubTheme {
  BabyHubTheme._();
  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    fontFamily: "Lexend",
    brightness: Brightness.light,
    primaryColor: const Color(0xFF3669C9),
    textTheme: BabyHubTextTheme.lightTextTheme,
    chipTheme: BabyHubChip.lightChipTheme,
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: BabyHubAppBarTheme.lightAppBarTheme,
    checkboxTheme: BabyHubCheckBox.lightCheckboxTheme,
    bottomSheetTheme: BabyHubBottomSheet.lightBottomSheetTheme,
    elevatedButtonTheme: BabyHubElevatedButtonTheme.lightElevatedButtonTheme,
    outlinedButtonTheme: BabyHubOutlinedButtonTheme.lightOutlinedButtonTheme,
    inputDecorationTheme: BabyHubTextFormField.lightInputDecorationTheme,
  );
  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    fontFamily: "Lexend",
    brightness: Brightness.dark,
    primaryColor: const Color(0xFF3669C9),
    textTheme: BabyHubTextTheme.darkTextTheme,
    chipTheme: BabyHubChip.darkChipTheme,
    scaffoldBackgroundColor: const Color(0xFF1C1C1C),
    appBarTheme: BabyHubAppBarTheme.darkAppBarTheme,
    checkboxTheme: BabyHubCheckBox.darkCheckboxTheme,
    bottomSheetTheme: BabyHubBottomSheet.darkBottomSheetTheme,
    elevatedButtonTheme: BabyHubElevatedButtonTheme.darkElevatedButtonTheme,
    outlinedButtonTheme: BabyHubOutlinedButtonTheme.darkOutlinedButtonTheme,
    inputDecorationTheme: BabyHubTextFormField.darkInputDecorationTheme,
  );
}
