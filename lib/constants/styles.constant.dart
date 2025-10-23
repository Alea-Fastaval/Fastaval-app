// DEPRECATED: This file is deprecated and should not be used in new code.
// Use the new theme system instead:
// - For colors: import 'package:fastaval_app/core/theme/app_colors.dart';
// - For text styles: import 'package:fastaval_app/core/theme/app_text_styles.dart';
// - For decorations: import 'package:fastaval_app/core/theme/app_decorations.dart';
// - For spacing: import 'package:fastaval_app/core/theme/app_theme.dart';
//
// See MODERNIZATION.md for migration guide.

import 'package:flutter/material.dart';

@Deprecated('Use AppDecorations.textBox instead')
BoxDecoration kTextBoxDecorationStyle = BoxDecoration(
  color: colorOrangeDark,
  border: Border.all(color: Colors.black12, width: 2),
  borderRadius: BorderRadius.circular(10.0),
  boxShadow: [
    BoxShadow(color: Colors.black12, blurRadius: 6.0, offset: Offset(0, 2))
  ],
);
@Deprecated('Use AppDecorations.backgroundImage instead')
BoxDecoration backgroundBoxDecorationStyle = BoxDecoration(
  image: DecorationImage(
      image: AssetImage('assets/images/background.jpg'), fit: BoxFit.cover),
);

@Deprecated('Use AppSpacing.cardElevation instead')
double kCardElevation = 5;

@Deprecated('Use AppSpacing.cardMargin instead')
EdgeInsets kCardMargin = EdgeInsets.fromLTRB(16, 8, 16, 0);
@Deprecated('Use AppSpacing.menuCardMargin instead')
EdgeInsets kMenuCardMargin = EdgeInsets.fromLTRB(16, 8, 16, 0);
@Deprecated('Use AppSpacing.cardPadding instead')
EdgeInsets kCardPadding = EdgeInsets.all(16.0);
@Deprecated('Use AppSpacing.cardContentPadding instead')
EdgeInsets kCardContentPadding = EdgeInsets.fromLTRB(16, 0, 16, 16);

@Deprecated('Use AppTextStyles.hint instead')
TextStyle kHintTextStyle = TextStyle(color: colorWhite);
@Deprecated('Use AppTextStyles.tabBar instead')
TextStyle kTabBarTextStyle = TextStyle(color: colorWhite, fontSize: 16);
@Deprecated('Use AppTextStyles.normal instead')
TextStyle kNormalTextStyle = TextStyle(color: Colors.black, fontSize: 16.0);
@Deprecated('Use AppTextStyles.normalDisabled instead')
TextStyle kNormalTextDisabled = TextStyle(color: Colors.black26, fontSize: 16);
@Deprecated('Use AppTextStyles.label instead')
TextStyle kLabelStyle =
    TextStyle(color: colorBlack, fontWeight: FontWeight.bold);
@Deprecated('Use AppTextStyles.appBarTitle instead')
TextStyle kAppBarTextStyle =
    TextStyle(color: colorWhite, fontSize: 16, fontWeight: FontWeight.bold);
@Deprecated('Use AppTextStyles.normalBold instead')
TextStyle kNormalTextBoldStyle =
    TextStyle(color: Colors.black, fontSize: 16.0, fontWeight: FontWeight.bold);
@Deprecated('Use AppTextStyles.cardHeader instead')
TextStyle kCardHeaderStyle =
    TextStyle(color: Colors.black, fontSize: 20.0, fontWeight: FontWeight.bold);
@Deprecated('Use AppTextStyles.menuCardHeader instead')
TextStyle kMenuCardHeaderStyle =
    TextStyle(color: colorBlack, fontWeight: FontWeight.bold);
@Deprecated('Use AppTextStyles.normalSubdued instead')
TextStyle kNormalTextSubdued =
    TextStyle(color: colorBlack, fontSize: 10, fontWeight: FontWeight.normal);
@Deprecated('Use AppTextStyles.normalSubduedExpired instead')
TextStyle kNormalTextSubduedExpired = TextStyle(
    color: Colors.black26, fontSize: 10, fontWeight: FontWeight.normal);
@Deprecated('Use AppTextStyles.normalClickable instead')
TextStyle kNormalTextClickableStyle = TextStyle(
  color: colorBlack,
  fontSize: 16.0,
  decoration: TextDecoration.underline,
  decorationColor: Colors.black45,
);

@Deprecated('Use AppColors.textPrimary instead')
Color colorBlack = Color(0xFF000000);
@Deprecated('Use AppColors.background instead')
Color colorWhite = Color(0xFFFFFFFF);
@Deprecated('Use AppColors.primaryLight instead')
Color colorOrangeLight = Color(0xFFFFD391);
@Deprecated('Use AppColors.secondary instead')
Color colorOrange = Color(0xFFF9AD1B);
@Deprecated('Use AppColors.primary instead')
Color colorOrangeDark = Color(0xFFFF9700);
@Deprecated('Use AppColors.lightBlue instead')
Color colorLightBlue = Color(0xFFC9ECFF);
@Deprecated('Use AppColors.grey instead')
Color colorGrey = Color(0xFFDFE0DF);
