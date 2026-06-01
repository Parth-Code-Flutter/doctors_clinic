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
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../controllers/otp_verification_controller.dart';

class OtpVerificationView extends GetView<OtpVerificationController> {
  const OtpVerificationView({super.key});

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
                  text: kOtpVerificationTitle,
                  fontSize: TextStyles.k20FontSize,
                  color: kColorTitle,
                  align: TextAlign.center,
                ),
                Spacing.v8,
                const AppText(
                  text: kOtpVerificationSubtitle,
                  fontSize: TextStyles.k14FontSize,
                  color: kColorTextSecondary,
                  align: TextAlign.center,
                ),
                Spacing.v8,
                AppText(
                  text: controller.contactLabel,
                  fontSize: TextStyles.k14FontSize,
                  color: kColorLink,
                  align: TextAlign.center,
                ),
                Spacing.v24,
                AppTextField(
                  controller: controller.otpController,
                  validator: controller.validateOtp,
                  hintText: kOtpHint,
                  textInputType: TextInputType.number,
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  maxLength: 6,
                  textInputAction: TextInputAction.done,
                  prefix: AppTextField.fieldIcon(Icons.pin_outlined),
                ),
                Spacing.v16,
                Obx(
                  () => GestureDetector(
                    onTap: controller.canResend ? controller.onResendOtp : null,
                    child: SemiBoldText(
                      text: controller.canResend
                          ? kResendOtp
                          : '$kResendOtpIn ${controller.resendTimerLabel}',
                      fontSize: TextStyles.k14FontSize,
                      color: controller.canResend
                          ? kColorLink
                          : kColorTextSecondary,
                      align: TextAlign.center,
                    ),
                  ),
                ),
                Spacing.v24,
                Obx(
                  () => appButton(
                    onPressed: controller.onVerifyOtp,
                    buttonText: kVerifyOtpButtonText,
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
