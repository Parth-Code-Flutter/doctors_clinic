import 'package:doctors_clinic/constants/color_constants.dart';
import 'package:doctors_clinic/constants/string_constants.dart';
import 'package:doctors_clinic/utils/app_widgets/app_button.dart';
import 'package:doctors_clinic/utils/app_widgets/app_clinic_logo.dart';
import 'package:doctors_clinic/utils/app_widgets/app_spaces.dart';
import 'package:doctors_clinic/utils/app_widgets/app_text_field.dart';
import 'package:doctors_clinic/utils/app_widgets/common_app_bar_widget.dart';
import 'package:doctors_clinic/utils/text_utils/app_text.dart';
import 'package:doctors_clinic/utils/text_utils/text_styles.dart';
import 'package:doctors_clinic/utils/ui_utils/app_ui_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../controllers/auth_login_controller.dart';

class AuthLoginView extends GetView<AuthLoginController> {
  const AuthLoginView({super.key});

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
          child: LayoutBuilder(
            builder: (_, constraints) => SingleChildScrollView(
              keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
              physics: const AlwaysScrollableScrollPhysics(),
              padding: AppUIUtils.horizontalPadding.copyWith(bottom: 24),
              child: ConstrainedBox(
                constraints: BoxConstraints(minHeight: constraints.maxHeight),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    _buildHeader(),
                    Spacing.v24,
                    _buildCredentialsFields(),
                    Spacing.v20,
                    _buildLoginButton(),
                    Spacing.v24,
                    _buildOpenClinicFooter(),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Column(
      children: [
        const AppClinicLogo(size: 80, iconSize: 40, borderRadius: 22),
        Spacing.v16,
        const BoldText(
          text: kLoginTitle,
          fontSize: TextStyles.k20FontSize,
          color: kColorTitle,
          align: TextAlign.center,
        ),
        Spacing.v8,
        const AppText(
          text: kLoginSubtitle,
          fontSize: TextStyles.k14FontSize,
          color: kColorTextSecondary,
          align: TextAlign.center,
        ),
      ],
    );
  }

  Widget _buildCredentialsFields() {
    return Column(
      children: [
        Obx(
          () => AppTextField(
            controller: controller.emailOrPhoneController,
            onChanged: controller.onUsernameChanged,
            validator: controller.validateUsername,
            hintText: kLoginEmailOrPhoneHint,
            textInputType: controller.isPhoneInput.value
                ? TextInputType.phone
                : TextInputType.emailAddress,
            inputFormatters: controller.isPhoneInput.value
                ? [FilteringTextInputFormatter.digitsOnly]
                : null,
            maxLength: controller.isPhoneInput.value ? 10 : null,
            textInputAction: TextInputAction.next,
            textCapitalization: TextCapitalization.none,
            prefix: AppTextField.fieldIcon(Icons.mail_outline_rounded),
          ),
        ),
        Spacing.v12,
        Obx(
          () => AppTextField(
            controller: controller.passwordController,
            validator: controller.validatePassword,
            hintText: kLoginPasswordHint,
            obscureText: controller.isPasswordHidden.value,
            textInputType: TextInputType.visiblePassword,
            textInputAction: TextInputAction.done,
            textCapitalization: TextCapitalization.none,
            prefix: AppTextField.fieldIcon(Icons.lock_outline_rounded),
            suffix: AppTextField.visibilityToggle(
              isHidden: controller.isPasswordHidden.value,
              onToggle: controller.togglePasswordVisibility,
            ),
          ),
        ),
        Spacing.v8,
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
              onTap: controller.onLoginWithOtp,
              child: const SemiBoldText(
                text: kLoginWithOtp,
                fontSize: TextStyles.k12FontSize,
                color: kColorLink,
              ),
            ),
            GestureDetector(
              onTap: controller.onForgotPassword,
              child: const SemiBoldText(
                text: kForgotPassword,
                fontSize: TextStyles.k12FontSize,
                color: kColorLink,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildLoginButton() {
    return Obx(
      () => appButton(
        onPressed: controller.onLoginPressed,
        buttonText: kLoginButtonText,
        isLoading: controller.isLoginLoading.value,
      ),
    );
  }

  Widget _buildOpenClinicFooter() {
    return GestureDetector(
      onTap: controller.onOpenNewClinic,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const AppText(
            text: kLoginNoAccountPrefix,
            fontSize: TextStyles.k12FontSize,
            color: kColorTextSecondary,
          ),
          const SemiBoldText(
            text: kLoginOpenNewClinicLink,
            fontSize: TextStyles.k12FontSize,
            color: kColorLink,
          ),
        ],
      ),
    );
  }
}
