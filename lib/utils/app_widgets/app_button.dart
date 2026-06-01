import 'package:doctors_clinic/constants/color_constants.dart';
import 'package:doctors_clinic/utils/text_utils/text_styles.dart';
import 'package:doctors_clinic/utils/ui_utils/app_ui_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

enum AppButtonVariant { primary, secondary }

/// Shared app button (qobo-style [appButton]).
Widget appButton({
  required VoidCallback onPressed,
  required String buttonText,
  AppButtonVariant variant = AppButtonVariant.primary,
  Color? textColor,
  Color? buttonColor,
  Color? buttonBorderColor,
  double? buttonHeight,
  Widget? buttonIcon,
  double? buttonWidth,
  TextStyle? textStyle,
  double? borderRadius,
  bool isLoading = false,
}) {
  final bool isPrimary = variant == AppButtonVariant.primary;
  final Color background = buttonColor ??
      (isPrimary ? kColorPrimary : kColorSecondaryButtonBackground);
  final Color foreground = textColor ??
      (isPrimary ? kColorOnPrimary : kColorSecondaryButtonText);
  final Color border = buttonBorderColor ??
      (isPrimary ? kColorPrimary : kColorSecondaryButtonBackground);

  return GestureDetector(
    onTap: isLoading
        ? null
        : () {
            FocusManager.instance.primaryFocus?.unfocus();
            onPressed();
          },
    child: Opacity(
      opacity: isLoading ? 0.85 : 1,
      child: Container(
        height: buttonHeight ?? AppUIUtils.buttonHeight,
        width: buttonWidth ?? Get.width,
        decoration: BoxDecoration(
          color: background,
          borderRadius: BorderRadius.circular(
            borderRadius ?? AppUIUtils.primaryRadius,
          ),
          border: Border.all(color: border, width: 0.5),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (isLoading)
              SizedBox(
                width: 20,
                height: 20,
                child: CircularProgressIndicator(
                  strokeWidth: 2,
                  valueColor: AlwaysStoppedAnimation<Color>(foreground),
                ),
              )
            else ...[
              if (buttonIcon != null) ...[
                buttonIcon,
                const SizedBox(width: 10),
              ],
              Text(
                buttonText,
                style: textStyle ??
                    TextStyles.kSemiBold(
                      fontSize: TextStyles.k14FontSize,
                      colors: foreground,
                    ),
              ),
            ],
          ],
        ),
      ),
    ),
  );
}
