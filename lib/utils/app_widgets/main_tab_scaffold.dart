import 'package:doctors_clinic/constants/color_constants.dart';
import 'package:doctors_clinic/utils/app_widgets/common_app_bar_widget.dart';
import 'package:doctors_clinic/utils/text_utils/app_text.dart';
import 'package:doctors_clinic/utils/text_utils/text_styles.dart';
import 'package:doctors_clinic/utils/ui_utils/app_ui_utils.dart';
import 'package:flutter/material.dart';

/// Centered placeholder content for main-app tabs (no scaffold).
class MainTabPlaceholderContent extends StatelessWidget {
  const MainTabPlaceholderContent({
    required this.title,
    required this.subtitle,
    required this.icon,
    super.key,
  });

  final String title;
  final String subtitle;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: AppUIUtils.horizontalPadding.copyWith(top: 24, bottom: 24),
      child: Column(
        children: [
          Container(
            width: 72,
            height: 72,
            decoration: BoxDecoration(
              color: kColorSecondaryButtonBackground,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Icon(icon, size: 36, color: kColorLink),
          ),
          const SizedBox(height: 20),
          BoldText(
            text: title,
            fontSize: TextStyles.k20FontSize,
            color: kColorTitle,
            align: TextAlign.center,
          ),
          const SizedBox(height: 8),
          AppText(
            text: subtitle,
            fontSize: TextStyles.k14FontSize,
            color: kColorTextSecondary,
            align: TextAlign.center,
          ),
        ],
      ),
    );
  }
}

/// Shared layout for main-app tab placeholders (dashboard, patients, etc.).
class MainTabScaffold extends StatelessWidget {
  const MainTabScaffold({
    required this.title,
    required this.subtitle,
    required this.icon,
    super.key,
  });

  final String title;
  final String subtitle;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kColorBackground,
      appBar: CommonAppBarWidget(
        title: title,
        showBackButton: false,
      ),
      body: MainTabPlaceholderContent(
        title: title,
        subtitle: subtitle,
        icon: icon,
      ),
    );
  }
}
