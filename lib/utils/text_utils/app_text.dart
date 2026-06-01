import 'package:doctors_clinic/constants/color_constants.dart';
import 'package:doctors_clinic/utils/text_utils/text_styles.dart';
import 'package:flutter/material.dart';

class AppText extends StatelessWidget {
  const AppText({
    required this.text,
    super.key,
    this.style,
    this.align,
    this.overflow,
    this.maxLines,
    this.fontSize,
    this.color,
  });

  final String text;
  final TextStyle? style;
  final TextAlign? align;
  final TextOverflow? overflow;
  final int? maxLines;
  final Color? color;
  final double? fontSize;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: style ??
          TextStyles.kRegular(
            fontSize: fontSize ?? TextStyles.k14FontSize,
            colors: color ?? kColorText,
          ),
      textAlign: align,
      overflow: overflow,
      maxLines: maxLines,
    );
  }
}

class SemiBoldText extends StatelessWidget {
  const SemiBoldText({
    required this.text,
    super.key,
    this.align,
    this.fontSize,
    this.color,
    this.maxLines,
    this.overflow,
  });

  final String text;
  final TextAlign? align;
  final double? fontSize;
  final Color? color;
  final int? maxLines;
  final TextOverflow? overflow;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyles.kSemiBold(
        fontSize: fontSize ?? TextStyles.k14FontSize,
        colors: color ?? kColorText,
      ),
      textAlign: align,
      maxLines: maxLines,
      overflow: overflow,
    );
  }
}

class BoldText extends StatelessWidget {
  const BoldText({
    required this.text,
    super.key,
    this.align,
    this.fontSize,
    this.color,
    this.maxLines,
    this.overflow,
  });

  final String text;
  final TextAlign? align;
  final double? fontSize;
  final Color? color;
  final int? maxLines;
  final TextOverflow? overflow;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyles.kBold(
        fontSize: fontSize ?? TextStyles.k20FontSize,
        colors: color ?? kColorText,
      ),
      textAlign: align,
      maxLines: maxLines,
      overflow: overflow,
    );
  }
}
