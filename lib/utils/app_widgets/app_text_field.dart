import 'package:doctors_clinic/constants/color_constants.dart';
import 'package:doctors_clinic/utils/app_widgets/app_spaces.dart';
import 'package:doctors_clinic/utils/text_utils/app_text.dart';
import 'package:doctors_clinic/utils/text_utils/text_styles.dart';
import 'package:doctors_clinic/utils/ui_utils/app_ui_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

/// Shared text field (qobo-style [AppTextField]).
class AppTextField extends StatelessWidget {
  const AppTextField({
    super.key,
    this.controller,
    this.onChanged,
    this.validator,
    this.value,
    this.hintText,
    this.maxLength,
    this.textInputType,
    this.inputFormatters,
    this.maxLines,
    this.minLines,
    this.prefix,
    this.suffix,
    this.showCounter = false,
    this.labelText,
    this.labelStyle,
    this.textStyle,
    this.hintStyle,
    this.readOnly = false,
    this.onTap,
    this.fieldTitle,
    this.isRequired = false,
    this.exText,
    this.fillColor,
    this.padding = const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
    this.focusNode,
    this.obscureText = false,
    this.inputBorderRadius,
    this.autoFocus = false,
    this.autofillHints,
    this.textInputAction,
    this.textCapitalization,
    this.borderColor,
  });

  final TextEditingController? controller;
  final void Function(String value)? onChanged;
  final String? Function(String? value)? validator;
  final String? value;
  final String? hintText;
  final int? maxLength;
  final TextInputType? textInputType;
  final List<TextInputFormatter>? inputFormatters;
  final int? maxLines;
  final int? minLines;
  final Widget? prefix;
  final Widget? suffix;
  final bool showCounter;
  final String? labelText;
  final TextStyle? labelStyle;
  final TextStyle? textStyle;
  final TextStyle? hintStyle;
  final bool readOnly;
  final VoidCallback? onTap;
  final String? fieldTitle;
  final bool isRequired;
  final String? exText;
  final Color? fillColor;
  final EdgeInsetsGeometry? padding;
  final FocusNode? focusNode;
  final bool obscureText;
  final BorderRadius? inputBorderRadius;
  final bool autoFocus;
  final Iterable<String>? autofillHints;
  final TextInputAction? textInputAction;
  final TextCapitalization? textCapitalization;
  final Color? borderColor;

  /// Leading icon aligned for [AppTextField] prefix slot.
  static Widget fieldIcon(IconData icon) {
    return Padding(
      padding: const EdgeInsets.only(left: 12, right: 8),
      child: Icon(icon, color: kColorTextSecondary, size: 20),
    );
  }

  /// Password visibility toggle aligned for [AppTextField] suffix slot.
  static Widget visibilityToggle({
    required bool isHidden,
    required VoidCallback onToggle,
  }) {
    return IconButton(
      onPressed: onToggle,
      splashRadius: 22,
      padding: EdgeInsets.zero,
      constraints: const BoxConstraints(minWidth: 48, minHeight: 48),
      icon: Icon(
        isHidden ? Icons.visibility_off_outlined : Icons.visibility_outlined,
        color: kColorTextSecondary,
        size: 20,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (fieldTitle != null) ...[
          _fieldTitle(),
          Spacing.v8,
        ] else if (labelText != null) ...[
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4),
            child: Row(
              children: [
                Flexible(
                  child: AppText(
                    text: labelText!,
                    style: labelStyle ?? AppUIUtils.labelTextFieldTextStyle,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                if (isRequired)
                  AppText(
                    text: ' *',
                    style: (labelStyle ?? AppUIUtils.labelTextFieldTextStyle)
                        .copyWith(color: kColorError),
                  ),
              ],
            ),
          ),
          Spacing.v6,
        ],
        TextFormField(
          autofocus: autoFocus,
          controller: controller,
          cursorColor: kColorPrimary,
          style: textStyle ?? AppUIUtils.globalTextStyle,
          keyboardType: textInputType,
          textCapitalization: textCapitalization ?? TextCapitalization.sentences,
          onChanged: onChanged,
          textInputAction: textInputAction ?? TextInputAction.next,
          maxLength: maxLength,
          initialValue: controller == null ? value : null,
          inputFormatters: inputFormatters,
          maxLines: maxLines ?? 1,
          minLines: minLines ?? 1,
          readOnly: readOnly,
          onTap: onTap,
          focusNode: focusNode,
          obscureText: obscureText,
          obscuringCharacter: '*',
          validator: validator,
          autofillHints: autofillHints,
          decoration: InputDecoration(
            fillColor: fillColor ?? kColorSurface,
            filled: true,
            isDense: true,
            counterText: showCounter ? null : '',
            contentPadding: padding,
            hintText: hintText,
            hintStyle: hintStyle ?? AppUIUtils.hintTextFieldTextStyle,
            errorStyle: TextStyles.kMedium(
              colors: kColorError,
              fontSize: TextStyles.k12FontSize,
            ),
            enabledBorder: _border(borderColor ?? kColorBorder),
            focusedBorder: _border(kColorPrimary),
            errorBorder: _border(kColorError),
            focusedErrorBorder: _border(kColorError),
            prefixIcon: _alignFieldIcon(prefix),
            prefixIconConstraints: _fieldIconConstraints,
            suffixIcon: _alignFieldIcon(suffix),
            suffixIconConstraints: _fieldIconConstraints,
          ),
        ),
        if (exText != null) ...[
          Spacing.v8,
          AppText(
            text: exText!,
            style: TextStyles.kRegular(
              fontSize: TextStyles.k12FontSize,
              colors: kColorTextSecondary,
            ),
          ),
        ],
      ],
    );
  }

  Widget _fieldTitle() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        AppText(
          text: fieldTitle!,
          style: TextStyles.kMedium(fontSize: TextStyles.k14FontSize),
        ),
        if (isRequired)
          AppText(
            text: ' *',
            style: TextStyles.kMedium(
              fontSize: TextStyles.k14FontSize,
              colors: kColorError,
            ),
          ),
      ],
    );
  }

  static const BoxConstraints _fieldIconConstraints = BoxConstraints(
    minWidth: 48,
    maxWidth: 48,
    minHeight: 48,
    maxHeight: 48,
  );

  /// Centers prefix/suffix inside the field height (fixes eye icon sitting top-right).
  Widget? _alignFieldIcon(Widget? icon) {
    if (icon == null) {
      return null;
    }
    return SizedBox(
      width: 48,
      height: 48,
      child: Center(child: icon),
    );
  }

  InputBorder _border(Color color) {
    return OutlineInputBorder(
      gapPadding: 4,
      borderRadius: inputBorderRadius ?? AppUIUtils.textFieldBorderRadius,
      borderSide: BorderSide(color: color, width: 0.5),
    );
  }
}
