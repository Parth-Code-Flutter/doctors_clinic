import 'package:doctors_clinic/constants/color_constants.dart';
import 'package:doctors_clinic/constants/string_constants.dart';
import 'package:doctors_clinic/utils/app_widgets/app_button.dart';
import 'package:doctors_clinic/utils/app_widgets/app_spaces.dart';
import 'package:doctors_clinic/utils/app_widgets/app_text_field.dart';
import 'package:doctors_clinic/utils/app_widgets/common_app_bar_widget.dart';
import 'package:doctors_clinic/utils/text_utils/app_text.dart';
import 'package:doctors_clinic/utils/text_utils/text_styles.dart';
import 'package:doctors_clinic/utils/ui_utils/app_ui_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/reset_password_controller.dart';

class ResetPasswordView extends GetView<ResetPasswordController> {
  const ResetPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kColorBackground,
      resizeToAvoidBottomInset: true,
      appBar: const CommonAppBarWidget(
        title: '',
        backgroundColor: kColorBackground,
      ),
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Form(
          key: controller.formKey,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          child: SingleChildScrollView(
            padding: AppUIUtils.horizontalPadding.copyWith(top: 8, bottom: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const BoldText(
                  text: kResetPasswordTitle,
                  fontSize: TextStyles.k20FontSize,
                  color: kColorTitle,
                  align: TextAlign.center,
                ),
                Spacing.v8,
                const AppText(
                  text: kResetPasswordSubtitle,
                  fontSize: TextStyles.k14FontSize,
                  color: kColorTextSecondary,
                  align: TextAlign.center,
                ),
                Spacing.v24,
                Obx(
                  () => AppTextField(
                    controller: controller.passwordController,
                    validator: controller.validatePassword,
                    hintText: kNewPasswordHint,
                    obscureText: controller.isPasswordHidden.value,
                    textInputAction: TextInputAction.next,
                    prefix: AppTextField.fieldIcon(Icons.lock_outline_rounded),
                    suffix: AppTextField.visibilityToggle(
                      isHidden: controller.isPasswordHidden.value,
                      onToggle: controller.togglePasswordVisibility,
                    ),
                  ),
                ),
                Spacing.v12,
                Obx(
                  () => AppTextField(
                    controller: controller.confirmPasswordController,
                    validator: controller.validateConfirmPassword,
                    hintText: kConfirmPasswordHint,
                    obscureText: controller.isConfirmPasswordHidden.value,
                    textInputAction: TextInputAction.done,
                    prefix: AppTextField.fieldIcon(Icons.lock_outline_rounded),
                    suffix: AppTextField.visibilityToggle(
                      isHidden: controller.isConfirmPasswordHidden.value,
                      onToggle: controller.toggleConfirmPasswordVisibility,
                    ),
                  ),
                ),
                Spacing.v20,
                Obx(
                  () => appButton(
                    onPressed: controller.onUpdatePassword,
                    buttonText: kResetPasswordButtonText,
                    isLoading: controller.isLoading.value,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
