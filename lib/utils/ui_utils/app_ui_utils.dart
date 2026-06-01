import 'package:doctors_clinic/constants/color_constants.dart';
import 'package:doctors_clinic/utils/text_utils/text_styles.dart';
import 'package:flutter/material.dart';

class AppUIUtils {
  AppUIUtils._();

  static const double primaryRadius = 12;
  static const double buttonHeight = 52;

  static BorderRadius get primaryBorderRadius =>
      BorderRadius.circular(primaryRadius);

  static BorderRadius get textFieldBorderRadius =>
      BorderRadius.circular(primaryRadius);

  static const EdgeInsets horizontalPadding =
      EdgeInsets.symmetric(horizontal: 20);

  static TextStyle get globalTextStyle => TextStyles.kMedium(
        fontSize: TextStyles.k14FontSize,
        colors: kColorText,
      );

  static TextStyle get labelTextFieldTextStyle => TextStyles.kSemiBold(
        fontSize: TextStyles.k12FontSize,
        colors: kColorText,
      );

  static TextStyle get hintTextFieldTextStyle => TextStyles.kRegular(
        fontSize: TextStyles.k14FontSize,
        colors: kColorTextSecondary,
      );
}
