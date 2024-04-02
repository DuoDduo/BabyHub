import 'package:flutter/material.dart';

class BabyHubChip {
  BabyHubChip._();
  static ChipThemeData lightChipTheme = ChipThemeData(
    disabledColor: Colors.grey.withOpacity(0.4),
    labelStyle: const TextStyle(color: Colors.black),
    selectedColor: const Color(0xFF3669C9),
    padding: const EdgeInsets.symmetric(
      horizontal: 12.0,
      vertical: 12,
    ),
    checkmarkColor: Colors.white,
  );
  static ChipThemeData darkChipTheme = const ChipThemeData(
    disabledColor: Colors.grey,
    labelStyle: TextStyle(color: Colors.white),
    selectedColor: Color(0xFF3669C9),
    padding: EdgeInsets.symmetric(
      horizontal: 12.0,
      vertical: 12,
    ),
    checkmarkColor: Colors.white,
  );
}
