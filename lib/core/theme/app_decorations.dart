import 'package:flutter/material.dart';
import 'package:fastaval_app/core/theme/app_colors.dart';
import 'package:fastaval_app/core/theme/app_theme.dart';

/// Reusable box decorations for the Fastaval app
class AppDecorations {
  // Private constructor to prevent instantiation
  AppDecorations._();

  /// Text box decoration with orange background
  static BoxDecoration get textBox => BoxDecoration(
    color: AppColors.primary,
    border: Border.all(color: Colors.black12, width: 2),
    borderRadius: BorderRadius.circular(AppSpacing.borderRadius),
    boxShadow: const [
      BoxShadow(
        color: Colors.black12,
        blurRadius: 6.0,
        offset: Offset(0, 2),
      ),
    ],
  );

  /// Background with image decoration
  static BoxDecoration get backgroundImage => const BoxDecoration(
    image: DecorationImage(
      image: AssetImage('assets/images/background.jpg'),
      fit: BoxFit.cover,
    ),
  );
}
