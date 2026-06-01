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

import '../controllers/forgot_password_controller.dart';

class ForgotPasswordView extends GetView<ForgotPasswordController> {
  const ForgotPasswordView({super.key});

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
                  text: kForgotPasswordTitle,
                  fontSize: TextStyles.k20FontSize,
                  color: kColorTitle,
                  align: TextAlign.center,
                ),
                Spacing.v8,
                const AppText(
                  text: kForgotPasswordSubtitle,
                  fontSize: TextStyles.k14FontSize,
                  color: kColorTextSecondary,
                  align: TextAlign.center,
                ),
                Spacing.v24,
                AppTextField(
                  controller: controller.contactController,
                  validator: controller.validateContact,
                  hintText: kLoginEmailOrPhoneHint,
                  textInputType: TextInputType.emailAddress,
                  textInputAction: TextInputAction.done,
                  textCapitalization: TextCapitalization.none,
                  prefix: AppTextField.fieldIcon(Icons.mail_outline_rounded),
                ),
                Spacing.v20,
                Obx(
                  () => appButton(
                    onPressed: controller.onSendOtp,
                    buttonText: kSendOtpButtonText,
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
