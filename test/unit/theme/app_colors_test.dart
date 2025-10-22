import 'package:fastaval_app/core/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('AppColors Tests', () {
    test('Primary color should be orange', () {
      expect(AppColors.primary, equals(const Color(0xFFFF9700)));
    });

    test('Primary light should be correct', () {
      expect(AppColors.primaryLight, equals(const Color(0xFFFFD391)));
    });

    test('Background should be white', () {
      expect(AppColors.background, equals(const Color(0xFFFFFFFF)));
    });

    test('Text primary should be black', () {
      expect(AppColors.textPrimary, equals(const Color(0xFF000000)));
    });

    test('On primary should be white', () {
      expect(AppColors.onPrimary, equals(const Color(0xFFFFFFFF)));
    });

    test('Light blue accent color should be correct', () {
      expect(AppColors.lightBlue, equals(const Color(0xFFC9ECFF)));
    });

    test('Grey color should be correct', () {
      expect(AppColors.grey, equals(const Color(0xFFDFE0DF)));
    });
  });
}
