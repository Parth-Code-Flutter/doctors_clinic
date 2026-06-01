import 'package:doctors_clinic/constants/color_constants.dart';
import 'package:doctors_clinic/constants/string_constants.dart';
import 'package:doctors_clinic/utils/app_widgets/app_button.dart';
import 'package:doctors_clinic/utils/app_widgets/app_clinic_logo.dart';
import 'package:doctors_clinic/utils/app_widgets/app_spaces.dart';
import 'package:doctors_clinic/utils/text_utils/app_text.dart';
import 'package:doctors_clinic/utils/text_utils/text_styles.dart';
import 'package:doctors_clinic/utils/ui_utils/app_ui_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/welcome_controller.dart';

class WelcomeView extends GetView<WelcomeController> {
  const WelcomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kColorBackground,
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Padding(
            padding: AppUIUtils.horizontalPadding,
            child: Column(
              children: [
                const Spacer(flex: 2),
                _buildHeader(),
                const Spacer(flex: 3),
                _buildActions(),
                Spacing.v24,
                const AppText(
                  text: kWelcomeFooterNote,
                  align: TextAlign.center,
                  fontSize: TextStyles.k12FontSize,
                  color: kColorTextSecondary,
                ),
                Spacing.v32,
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Column(
      children: [
        const AppClinicLogo(size: 88, iconSize: 42, borderRadius: 24),
        Spacing.v24,
        const BoldText(
          text: kWelcomeTitle,
          fontSize: TextStyles.k28FontSize,
          color: kColorTitle,
          align: TextAlign.center,
        ),
        Spacing.v12,
        const AppText(
          text: kWelcomeSubtitle,
          align: TextAlign.center,
          fontSize: TextStyles.k14FontSize,
          color: kColorTextSecondary,
        ),
      ],
    );
  }

  Widget _buildActions() {
    return Column(
      children: [
        appButton(
          onPressed: controller.onLoginToClinic,
          buttonText: kLoginToClinicButton,
          variant: AppButtonVariant.primary,
        ),
        Spacing.v16,
        appButton(
          onPressed: controller.onOpenNewClinic,
          buttonText: kOpenNewClinicButton,
          variant: AppButtonVariant.secondary,
        ),
      ],
    );
  }
}
