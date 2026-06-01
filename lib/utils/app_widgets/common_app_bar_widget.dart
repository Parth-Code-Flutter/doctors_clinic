import 'package:doctors_clinic/constants/color_constants.dart';
import 'package:doctors_clinic/utils/text_utils/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

/// Reusable app bar with optional back navigation (qobo-style).
///
/// Defaults to [kColorBackground] so it matches auth/onboarding scaffolds.
/// Scroll tint is disabled so the bar color stays consistent while scrolling.
class CommonAppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  const CommonAppBarWidget({
    super.key,
    required this.title,
    this.showBackButton = true,
    this.onBackPressed,
    this.backgroundColor = kColorBackground,
    this.titleColor = kColorTitle,
    this.actions,
  });

  final String title;
  final bool showBackButton;
  final VoidCallback? onBackPressed;
  final Color backgroundColor;
  final Color titleColor;
  final List<Widget>? actions;

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: backgroundColor,
      elevation: 0,
      scrolledUnderElevation: 0,
      shadowColor: Colors.transparent,
      surfaceTintColor: Colors.transparent,
      systemOverlayStyle: SystemUiOverlayStyle.dark,
      centerTitle: true,
      automaticallyImplyLeading: false,
      leading: showBackButton
          ? IconButton(
              onPressed: onBackPressed ?? () => Get.back(),
              icon: Icon(Icons.arrow_back_ios_new, color: titleColor, size: 20),
            )
          : null,
      title: title.isEmpty
          ? null
          : Text(
              title,
              style: TextStyles.kSemiBold(
                fontSize: TextStyles.k18FontSize,
                colors: titleColor,
              ),
            ),
      actions: actions,
      flexibleSpace: ColoredBox(color: backgroundColor),
    );
  }
}
