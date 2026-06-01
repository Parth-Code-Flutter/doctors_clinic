import 'package:doctors_clinic/app/main/settings/controllers/clinic_profile_settings_controller.dart';
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

class ClinicProfileSettingsView extends GetView<ClinicProfileSettingsController> {
  const ClinicProfileSettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kColorBackground,
      resizeToAvoidBottomInset: true,
      appBar: const CommonAppBarWidget(title: kSettingsClinicProfileScreenTitle),
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Form(
          key: controller.formKey,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          child: ListView(
            padding: AppUIUtils.horizontalPadding.copyWith(top: 8, bottom: 24),
            children: [
              const AppText(
                text: kSettingsClinicProfileScreenSubtitle,
                fontSize: TextStyles.k14FontSize,
                color: kColorTextSecondary,
              ),
              Spacing.v16,
              AppTextField(
                controller: controller.clinicNameController,
                hintText: kClinicNameHint,
                textCapitalization: TextCapitalization.words,
                validator: controller.validateClinicName,
                prefix: AppTextField.fieldIcon(Icons.local_hospital_outlined),
              ),
              Spacing.v12,
              AppTextField(
                controller: controller.ownerNameController,
                hintText: kOwnerNameHint,
                textCapitalization: TextCapitalization.words,
                validator: controller.validateOwnerName,
                prefix: AppTextField.fieldIcon(Icons.person_outline_rounded),
              ),
              Spacing.v12,
              AppTextField(
                controller: controller.mobileController,
                hintText: kMobileNumberHint,
                textInputType: TextInputType.phone,
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                maxLength: 10,
                validator: controller.validateMobile,
                prefix: AppTextField.fieldIcon(Icons.phone_outlined),
              ),
              Spacing.v12,
              AppTextField(
                controller: controller.emailController,
                hintText: kEmailHint,
                textInputType: TextInputType.emailAddress,
                validator: controller.validateEmail,
                prefix: AppTextField.fieldIcon(Icons.email_outlined),
              ),
              Spacing.v12,
              AppTextField(
                controller: controller.addressController,
                hintText: kAddressHint,
                maxLines: 2,
                minLines: 2,
                prefix: AppTextField.fieldIcon(Icons.location_on_outlined),
              ),
              Spacing.v12,
              AppTextField(
                controller: controller.cityController,
                hintText: kCityHint,
                textCapitalization: TextCapitalization.words,
                prefix: AppTextField.fieldIcon(Icons.location_city_outlined),
              ),
              Spacing.v12,
              AppTextField(
                controller: controller.stateController,
                hintText: kStateHint,
                textCapitalization: TextCapitalization.words,
                prefix: AppTextField.fieldIcon(Icons.map_outlined),
              ),
              Spacing.v12,
              AppTextField(
                controller: controller.pincodeController,
                hintText: kPincodeHint,
                textInputType: TextInputType.number,
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                maxLength: 6,
                prefix: AppTextField.fieldIcon(Icons.pin_drop_outlined),
              ),
              Spacing.v12,
              AppTextField(
                controller: controller.clinicTypeController,
                hintText: kClinicTypeHint,
                textCapitalization: TextCapitalization.words,
                prefix:
                    AppTextField.fieldIcon(Icons.medical_services_outlined),
              ),
              Spacing.v12,
              AppTextField(
                controller: controller.workingDaysController,
                hintText: kWorkingDaysHint,
                prefix: AppTextField.fieldIcon(Icons.calendar_today_outlined),
              ),
              Spacing.v12,
              AppTextField(
                controller: controller.workingHoursController,
                hintText: kWorkingHoursHint,
                prefix: AppTextField.fieldIcon(Icons.access_time_outlined),
              ),
              Spacing.v20,
              Obx(
                () => appButton(
                  onPressed: controller.onSave,
                  buttonText: kSettingsSaveProfileButton,
                  isLoading: controller.isSaving.value,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
