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

import '../controllers/open_new_clinic_controller.dart';

class OpenNewClinicView extends GetView<OpenNewClinicController> {
  const OpenNewClinicView({super.key});

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
            keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
            physics: const AlwaysScrollableScrollPhysics(),
            padding: AppUIUtils.horizontalPadding.copyWith(
              top: 8,
              bottom: 24,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                _buildHeader(),
                Spacing.v20,
                _buildFormFields(),
                Spacing.v20,
                _buildRegisterButton(),
                Spacing.v20,
                _buildLoginFooter(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return const Column(
      children: [
        BoldText(
          text: kOpenNewClinicTitle,
          fontSize: TextStyles.k20FontSize,
          color: kColorTitle,
          align: TextAlign.center,
        ),
        SizedBox(height: 8),
        AppText(
          text: kOpenNewClinicSubtitle,
          fontSize: TextStyles.k14FontSize,
          color: kColorTextSecondary,
          align: TextAlign.center,
        ),
      ],
    );
  }

  Widget _buildFormFields() {
    return Column(
      children: [
        AppTextField(
          controller: controller.clinicNameController,
          validator: controller.validateClinicName,
          hintText: kClinicNameHint,
          textInputAction: TextInputAction.next,
          textCapitalization: TextCapitalization.words,
          prefix: AppTextField.fieldIcon(Icons.local_hospital_outlined),
        ),
        Spacing.v12,
        AppTextField(
          controller: controller.ownerNameController,
          validator: controller.validateOwnerName,
          hintText: kOwnerNameHint,
          textInputAction: TextInputAction.next,
          textCapitalization: TextCapitalization.words,
          prefix: AppTextField.fieldIcon(Icons.person_outline_rounded),
        ),
        Spacing.v12,
        AppTextField(
          controller: controller.mobileController,
          validator: controller.validateMobile,
          hintText: kMobileNumberHint,
          textInputType: TextInputType.phone,
          inputFormatters: [FilteringTextInputFormatter.digitsOnly],
          maxLength: 10,
          textInputAction: TextInputAction.next,
          prefix: AppTextField.fieldIcon(Icons.phone_android_rounded),
        ),
        Spacing.v12,
        AppTextField(
          controller: controller.emailController,
          validator: controller.validateEmail,
          hintText: kEmailHint,
          textInputType: TextInputType.emailAddress,
          textInputAction: TextInputAction.next,
          textCapitalization: TextCapitalization.none,
          prefix: AppTextField.fieldIcon(Icons.mail_outline_rounded),
        ),
        Spacing.v12,
        Obx(
          () => AppTextField(
            controller: controller.passwordController,
            validator: controller.validatePassword,
            hintText: kLoginPasswordHint,
            obscureText: controller.isPasswordHidden.value,
            textInputType: TextInputType.visiblePassword,
            textInputAction: TextInputAction.next,
            textCapitalization: TextCapitalization.none,
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
            textInputType: TextInputType.visiblePassword,
            textInputAction: TextInputAction.done,
            textCapitalization: TextCapitalization.none,
            prefix: AppTextField.fieldIcon(Icons.lock_outline_rounded),
            suffix: AppTextField.visibilityToggle(
              isHidden: controller.isConfirmPasswordHidden.value,
              onToggle: controller.toggleConfirmPasswordVisibility,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildRegisterButton() {
    return Obx(
      () => appButton(
        onPressed: controller.onRegisterPressed,
        buttonText: kRegisterClinicButtonText,
        isLoading: controller.isRegisterLoading.value,
      ),
    );
  }

  Widget _buildLoginFooter() {
    return GestureDetector(
      onTap: controller.onLoginToClinic,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const AppText(
            text: kRegisterAlreadyHaveAccountPrefix,
            fontSize: TextStyles.k12FontSize,
            color: kColorTextSecondary,
          ),
          const SemiBoldText(
            text: kRegisterLoginLink,
            fontSize: TextStyles.k12FontSize,
            color: kColorLink,
          ),
        ],
      ),
    );
  }
}
