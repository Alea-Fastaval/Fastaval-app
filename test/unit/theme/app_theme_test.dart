import 'package:fastaval_app/core/theme/app_colors.dart';
import 'package:fastaval_app/core/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('AppTheme Tests', () {
    test('lightTheme should have correct primary color', () {
      final theme = AppTheme.lightTheme;

      expect(theme.primaryColor, equals(AppColors.primary));
    });

    test('lightTheme should have correct scaffold background color', () {
      final theme = AppTheme.lightTheme;

      expect(theme.scaffoldBackgroundColor, equals(AppColors.background));
    });

    test('lightTheme should have correct font family', () {
      final theme = AppTheme.lightTheme;

      expect(theme.fontFamily, equals('Roboto'));
    });

    test('AppBarTheme should have correct background color', () {
      final theme = AppTheme.lightTheme;

      expect(theme.appBarTheme.backgroundColor, equals(AppColors.primary));
      expect(theme.appBarTheme.elevation, equals(0));
    });

    test('CardTheme should have correct elevation', () {
      final theme = AppTheme.lightTheme;

      expect(theme.cardTheme.elevation, equals(AppSpacing.cardElevation));
    });
  });

  group('AppSpacing Tests', () {
    test('cardMargin should have correct values', () {
      expect(AppSpacing.cardMargin, equals(const EdgeInsets.fromLTRB(16, 8, 16, 0)));
    });

    test('cardPadding should have correct values', () {
      expect(AppSpacing.cardPadding, equals(const EdgeInsets.all(16.0)));
    });

    test('borderRadius should be 10.0', () {
      expect(AppSpacing.borderRadius, equals(10.0));
    });

    test('cardElevation should be 5.0', () {
      expect(AppSpacing.cardElevation, equals(5.0));
    });
  });
}
