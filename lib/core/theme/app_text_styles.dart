import 'package:flutter/material.dart';
import 'package:fastaval_app/core/theme/app_colors.dart';

/// Text styles used throughout the Fastaval app
class AppTextStyles {
  // Private constructor to prevent instantiation
  AppTextStyles._();

  // Heading styles
  static const TextStyle cardHeader = TextStyle(
    color: AppColors.textPrimary,
    fontSize: 20.0,
    fontWeight: FontWeight.bold,
  );

  static const TextStyle menuCardHeader = TextStyle(
    color: AppColors.textPrimary,
    fontWeight: FontWeight.bold,
  );

  // Body text styles
  static const TextStyle normal = TextStyle(
    color: AppColors.textPrimary,
    fontSize: 16.0,
  );

  static const TextStyle normalBold = TextStyle(
    color: AppColors.textPrimary,
    fontSize: 16.0,
    fontWeight: FontWeight.bold,
  );

  static const TextStyle normalDisabled = TextStyle(
    color: AppColors.textDisabled,
    fontSize: 16.0,
  );

  static const TextStyle normalClickable = TextStyle(
    color: AppColors.textPrimary,
    fontSize: 16.0,
    decoration: TextDecoration.underline,
    decorationColor: Colors.black45,
  );

  // Small text styles
  static const TextStyle normalSubdued = TextStyle(
    color: AppColors.textPrimary,
    fontSize: 10.0,
    fontWeight: FontWeight.normal,
  );

  static const TextStyle normalSubduedExpired = TextStyle(
    color: AppColors.textDisabled,
    fontSize: 10.0,
    fontWeight: FontWeight.normal,
  );

  // Special styles
  static const TextStyle hint = TextStyle(
    color: AppColors.textHint,
  );

  static const TextStyle label = TextStyle(
    color: AppColors.textPrimary,
    fontWeight: FontWeight.bold,
  );

  static const TextStyle appBarTitle = TextStyle(
    color: AppColors.onPrimary,
    fontSize: 16,
    fontWeight: FontWeight.bold,
  );

  static const TextStyle tabBar = TextStyle(
    color: AppColors.onPrimary,
    fontSize: 16,
  );
}
