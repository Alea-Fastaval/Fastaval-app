import 'package:flutter/material.dart';
import 'package:fastaval_app/core/theme/app_colors.dart';
import 'package:fastaval_app/core/theme/app_text_styles.dart';

/// Central theme configuration for the Fastaval app.
///
/// This class provides the main ThemeData configuration used throughout
/// the application. It defines the overall look and feel including colors,
/// text styles, and component themes.
///
/// The theme is applied in the main.dart file:
/// ```dart
/// MaterialApp(
///   theme: AppTheme.lightTheme,
///   // ...
/// )
/// ```
class AppTheme {
  // Private constructor to prevent instantiation
  AppTheme._();

  /// Main app theme data
  static ThemeData get lightTheme {
    return ThemeData(
      primarySwatch: Colors.orange,
      primaryColor: AppColors.primary,
      scaffoldBackgroundColor: AppColors.background,
      fontFamily: 'Roboto',
      
      // AppBar theme
      appBarTheme: AppBarTheme(
        backgroundColor: AppColors.primary,
        elevation: 0,
        centerTitle: true,
        iconTheme: IconThemeData(color: AppColors.onPrimary),
        titleTextStyle: AppTextStyles.appBarTitle,
      ),
      
      // Card theme
      cardTheme: CardTheme(
        elevation: AppSpacing.cardElevation,
        margin: AppSpacing.cardMargin,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppSpacing.borderRadius),
        ),
      ),
      
      // Text theme
      textTheme: TextTheme(
        displayLarge: AppTextStyles.cardHeader,
        displayMedium: AppTextStyles.normalBold,
        bodyLarge: AppTextStyles.normal,
        bodyMedium: AppTextStyles.normal,
        labelLarge: AppTextStyles.label,
      ),
      
      // Input decoration theme
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: AppColors.primary,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppSpacing.borderRadius),
          borderSide: BorderSide(color: Colors.black12, width: 2),
        ),
        hintStyle: AppTextStyles.hint,
      ),
      
      // Elevated button theme
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primary,
          foregroundColor: AppColors.onPrimary,
          elevation: 2,
          padding: AppSpacing.buttonPadding,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppSpacing.borderRadius),
          ),
        ),
      ),
    );
  }
}

/// Spacing and sizing constants for consistent layout.
///
/// This class provides standardized spacing values to maintain
/// visual consistency throughout the application.
///
/// Example usage:
/// ```dart
/// Padding(
///   padding: AppSpacing.cardPadding,
///   child: Text('Content'),
/// )
/// ```
class AppSpacing {
  // Private constructor
  AppSpacing._();
  
  // Padding
  static const EdgeInsets cardMargin = EdgeInsets.fromLTRB(16, 8, 16, 0);
  static const EdgeInsets menuCardMargin = EdgeInsets.fromLTRB(16, 8, 16, 0);
  static const EdgeInsets cardPadding = EdgeInsets.all(16.0);
  static const EdgeInsets cardContentPadding = EdgeInsets.fromLTRB(16, 0, 16, 16);
  static const EdgeInsets buttonPadding = EdgeInsets.symmetric(horizontal: 24, vertical: 12);
  
  // Spacing values
  static const double spacingXSmall = 4.0;
  static const double spacingSmall = 8.0;
  static const double spacingMedium = 16.0;
  static const double spacingLarge = 24.0;
  static const double spacingXLarge = 32.0;
  
  // Border radius
  static const double borderRadius = 10.0;
  
  // Elevation
  static const double cardElevation = 5.0;
}
