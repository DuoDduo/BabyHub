import 'package:flutter/material.dart';

class BabyHubElevatedButtonTheme {
  BabyHubElevatedButtonTheme._();

  static final lightElevatedButtonTheme = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      elevation: 0,
      foregroundColor: Colors.white,
      backgroundColor: const Color(0xFF3669C9),
      disabledForegroundColor: Colors.grey,
      disabledBackgroundColor: Colors.grey,
      side: const BorderSide(color: Color(0xFF3669C9)),
      padding: const EdgeInsets.symmetric(vertical: 18),
      textStyle: const TextStyle(
          fontSize: 16, color: Colors.white, fontWeight: FontWeight.w600),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
    ),
  );

  static final darkElevatedButtonTheme = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      elevation: 0,
      foregroundColor: Colors.white,
      backgroundColor: const Color(0xFF3669C9),
      disabledForegroundColor: Colors.grey,
      disabledBackgroundColor: Colors.grey,
      side: const BorderSide(color: Color(0xFF3669C9)),
      padding: const EdgeInsets.symmetric(vertical: 18),
      textStyle: const TextStyle(
          fontSize: 16, color: Colors.white, fontWeight: FontWeight.w600),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
    ),
  );
}
