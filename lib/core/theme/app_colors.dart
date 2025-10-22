import 'package:flutter/material.dart';

/// Color palette for the Fastaval app
class AppColors {
  // Private constructor to prevent instantiation
  AppColors._();

  // Primary colors
  static const Color primary = Color(0xFFFF9700);
  static const Color primaryLight = Color(0xFFFFD391);
  static const Color primaryDark = Color(0xFFFF9700);
  static const Color onPrimary = Color(0xFFFFFFFF);

  // Secondary colors
  static const Color secondary = Color(0xFFF9AD1B);
  static const Color onSecondary = Color(0xFF000000);

  // Background colors
  static const Color background = Color(0xFFFFFFFF);
  static const Color surface = Color(0xFFFFFFFF);
  static const Color surfaceVariant = Color(0xFFC9ECFF);

  // Text colors
  static const Color textPrimary = Color(0xFF000000);
  static const Color textSecondary = Color(0xFF666666);
  static const Color textDisabled = Color(0x42000000); // Black26
  static const Color textHint = Color(0xFFFFFFFF);

  // Accent colors
  static const Color lightBlue = Color(0xFFC9ECFF);
  static const Color grey = Color(0xFFDFE0DF);

  // Semantic colors
  static const Color error = Colors.red;
  static const Color success = Colors.green;
  static const Color warning = Colors.orange;
  static const Color info = Colors.blue;
}
