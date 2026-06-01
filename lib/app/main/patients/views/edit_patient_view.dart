import 'package:doctors_clinic/app/main/patients/controllers/edit_patient_controller.dart';
import 'package:doctors_clinic/app/main/patients/widgets/gender_selector.dart';
import 'package:doctors_clinic/app/main/patients/widgets/patient_tip_banner.dart';
import 'package:doctors_clinic/app/main/patients/widgets/quick_age_chips.dart';
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

class EditPatientView extends GetView<EditPatientController> {
  const EditPatientView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kColorBackground,
      appBar: const CommonAppBarWidget(title: kEditPatientTitle),
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Form(
          key: controller.formKey,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          child: ListView(
            padding: AppUIUtils.horizontalPadding.copyWith(top: 8, bottom: 24),
            children: [
              const PatientTipBanner(message: kAddPatientTipName),
              Spacing.v16,
              AppTextField(
                controller: controller.nameController,
                validator: controller.validateName,
                hintText: kAddPatientFullNameHint,
                textCapitalization: TextCapitalization.words,
                prefix: AppTextField.fieldIcon(Icons.badge_outlined),
              ),
              Spacing.v16,
              AppTextField(
                controller: controller.phoneController,
                validator: controller.validatePhone,
                hintText: kAddPatientPhoneHint,
                textInputType: TextInputType.phone,
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                  LengthLimitingTextInputFormatter(10),
                ],
                prefix: AppTextField.fieldIcon(Icons.phone_android_rounded),
              ),
              Spacing.v20,
              const SemiBoldText(
                text: kAddPatientGenderLabel,
                fontSize: TextStyles.k14FontSize,
                color: kColorTitle,
              ),
              Spacing.v8,
              Obx(
                () => GenderSelector(
                  selected: controller.selectedGender.value,
                  onSelected: controller.onGenderSelected,
                ),
              ),
              Spacing.v20,
              const SemiBoldText(
                text: kAddPatientQuickAgeLabel,
                fontSize: TextStyles.k14FontSize,
                color: kColorTitle,
              ),
              Spacing.v8,
              Obx(
                () => QuickAgeChips(
                  chips: QuickAgeChips.defaults,
                  selectedAge: controller.selectedQuickAge.value,
                  onSelected: controller.onQuickAgeSelected,
                ),
              ),
              Spacing.v12,
              AppTextField(
                controller: controller.ageController,
                validator: controller.validateAge,
                onChanged: controller.onAgeChanged,
                hintText: kAddPatientAgeHint,
                textInputType: TextInputType.number,
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                prefix: AppTextField.fieldIcon(Icons.cake_outlined),
              ),
              Spacing.v16,
              AppTextField(
                controller: controller.addressController,
                hintText: kAddPatientAddressHint,
                maxLines: 2,
                minLines: 2,
                prefix: AppTextField.fieldIcon(Icons.location_on_outlined),
              ),
              Spacing.v16,
              AppTextField(
                controller: controller.notesController,
                hintText: kAddPatientNotesHint,
                maxLines: 4,
                minLines: 3,
                prefix: AppTextField.fieldIcon(Icons.sticky_note_2_outlined),
              ),
              Spacing.v24,
              Obx(
                () => appButton(
                  onPressed: controller.onSave,
                  buttonText: kAddPatientUpdate,
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
