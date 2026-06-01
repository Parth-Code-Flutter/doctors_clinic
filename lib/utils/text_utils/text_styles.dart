import 'package:doctors_clinic/constants/color_constants.dart';
import 'package:flutter/material.dart';

class TextStyles {
  TextStyles._();

  static const double k12FontSize = 12;
  static const double k14FontSize = 14;
  static const double k16FontSize = 16;
  static const double k18FontSize = 18;
  static const double k20FontSize = 20;
  static const double k24FontSize = 24;
  static const double k28FontSize = 28;

  static TextStyle kRegular({
    double fontSize = k16FontSize,
    Color colors = kColorText,
    FontWeight fontWeight = FontWeight.w400,
  }) {
    return TextStyle(
      fontSize: fontSize,
      color: colors,
      fontWeight: fontWeight,
    );
  }

  static TextStyle kMedium({
    double fontSize = k16FontSize,
    Color colors = kColorText,
    FontWeight fontWeight = FontWeight.w500,
  }) {
    return TextStyle(
      fontSize: fontSize,
      color: colors,
      fontWeight: fontWeight,
    );
  }

  static TextStyle kSemiBold({
    double fontSize = k16FontSize,
    Color colors = kColorText,
    FontWeight fontWeight = FontWeight.w600,
  }) {
    return TextStyle(
      fontSize: fontSize,
      color: colors,
      fontWeight: fontWeight,
    );
  }

  static TextStyle kBold({
    double fontSize = k16FontSize,
    Color colors = kColorText,
    FontWeight fontWeight = FontWeight.w700,
  }) {
    return TextStyle(
      fontSize: fontSize,
      color: colors,
      fontWeight: fontWeight,
    );
  }
}
