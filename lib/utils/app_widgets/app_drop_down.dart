import 'package:doctors_clinic/constants/color_constants.dart';
import 'package:doctors_clinic/utils/text_utils/text_styles.dart';
import 'package:doctors_clinic/utils/ui_utils/app_ui_utils.dart';
import 'package:flutter/material.dart';

/// Simple dropdown styled to match [AppTextField].
class AppDropDown<T> extends StatelessWidget {
  const AppDropDown({
    super.key,
    required this.value,
    required this.items,
    required this.onChanged,
    this.hint,
  });

  final T? value;
  final List<DropdownMenuItem<T>> items;
  final ValueChanged<T?> onChanged;
  final String? hint;

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<T>(
      value: value,
      items: items,
      onChanged: onChanged,
      decoration: InputDecoration(
        fillColor: kColorSurface,
        filled: true,
        isDense: true,
        contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
        hintText: hint,
        hintStyle: AppUIUtils.hintTextFieldTextStyle,
        enabledBorder: OutlineInputBorder(
          borderRadius: AppUIUtils.textFieldBorderRadius,
          borderSide: const BorderSide(color: kColorBorder, width: 0.5),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: AppUIUtils.textFieldBorderRadius,
          borderSide: const BorderSide(color: kColorPrimary, width: 0.5),
        ),
      ),
      style: TextStyles.kMedium(
        fontSize: TextStyles.k14FontSize,
        colors: kColorText,
      ),
      icon: const Icon(Icons.keyboard_arrow_down_rounded, color: kColorTextSecondary),
      isExpanded: true,
    );
  }
}
