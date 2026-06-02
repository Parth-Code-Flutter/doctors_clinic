import 'package:doctors_clinic/constants/color_constants.dart';
import 'package:doctors_clinic/constants/string_constants.dart';
import 'package:doctors_clinic/utils/app_widgets/app_button.dart';
import 'package:doctors_clinic/utils/app_widgets/app_drop_down.dart';
import 'package:doctors_clinic/utils/app_widgets/app_spaces.dart';
import 'package:doctors_clinic/utils/app_widgets/app_text_field.dart';
import 'package:doctors_clinic/utils/app_widgets/common_app_bar_widget.dart';
import 'package:doctors_clinic/utils/text_utils/app_text.dart';
import 'package:doctors_clinic/utils/text_utils/text_styles.dart';
import 'package:doctors_clinic/utils/ui_utils/app_ui_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../controllers/clinic_setup_controller.dart';

class ClinicSetupView extends GetView<ClinicSetupController> {
  const ClinicSetupView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kColorBackground,
      resizeToAvoidBottomInset: true,
      appBar: CommonAppBarWidget(
        title: '',
        backgroundColor: kColorBackground,
        showBackButton: false,
        actions: [
          TextButton(
            onPressed: controller.onSkipSetup,
            child: const Text(
              kSkipClinicSetup,
              style: TextStyle(color: kColorLink),
            ),
          ),
        ],
      ),
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Form(
          key: controller.formKey,
          child: SingleChildScrollView(
            padding: AppUIUtils.horizontalPadding.copyWith(top: 8, bottom: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const BoldText(
                  text: kClinicSetupTitle,
                  fontSize: TextStyles.k20FontSize,
                  color: kColorTitle,
                  align: TextAlign.center,
                ),
                Spacing.v8,
                const AppText(
                  text: kClinicSetupSubtitle,
                  fontSize: TextStyles.k14FontSize,
                  color: kColorTextSecondary,
                  align: TextAlign.center,
                ),
                Spacing.v20,
                AppTextField(
                  controller: controller.addressController,
                  hintText: kAddressHint,
                  maxLines: 2,
                  minLines: 2,
                  textInputAction: TextInputAction.next,
                  prefix: AppTextField.fieldIcon(Icons.location_on_outlined),
                ),
                Spacing.v12,
                AppTextField(
                  controller: controller.cityController,
                  hintText: kCityHint,
                  textInputAction: TextInputAction.next,
                  textCapitalization: TextCapitalization.words,
                  prefix: AppTextField.fieldIcon(Icons.location_city_outlined),
                ),
                Spacing.v12,
                AppTextField(
                  controller: controller.stateController,
                  hintText: kStateHint,
                  textInputAction: TextInputAction.next,
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
                  textInputAction: TextInputAction.next,
                  prefix: AppTextField.fieldIcon(Icons.pin_drop_outlined),
                ),
                Spacing.v12,
                AppTextField(
                  controller: controller.clinicTypeController,
                  hintText: kClinicTypeHint,
                  textInputAction: TextInputAction.next,
                  textCapitalization: TextCapitalization.words,
                  prefix: AppTextField.fieldIcon(
                    Icons.medical_services_outlined,
                  ),
                ),
                Spacing.v12,
                AppTextField(
                  controller: controller.workingDaysController,
                  hintText: kWorkingDaysHint,
                  textInputAction: TextInputAction.next,
                  prefix: AppTextField.fieldIcon(Icons.calendar_today_outlined),
                ),
                Spacing.v12,
                AppTextField(
                  controller: controller.workingHoursController,
                  hintText: kWorkingHoursHint,
                  textInputAction: TextInputAction.next,
                  prefix: AppTextField.fieldIcon(Icons.access_time_outlined),
                ),
                Spacing.v12,
                Obx(
                  () => AppDropDown<int>(
                    value: controller.selectedReminderIndex.value,
                    hint: kDefaultReminderHint,
                    items: List.generate(
                      kDefaultReminderOptions.length,
                      (index) => DropdownMenuItem<int>(
                        value: index,
                        child: Text(kDefaultReminderOptions[index]),
                      ),
                    ),
                    onChanged: controller.onReminderChanged,
                  ),
                ),
                Spacing.v20,
                Obx(
                  () => appButton(
                    onPressed: controller.onSaveSetup,
                    buttonText: kSaveClinicSetupButtonText,
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
