import 'package:doctors_clinic/app/main/doctors/controllers/doctor_editor_controller.dart';
import 'package:doctors_clinic/app/main/doctors/models/doctor_status.dart';
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
import 'package:get/get.dart';

class DoctorEditorView extends GetView<DoctorEditorController> {
  const DoctorEditorView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kColorBackground,
      appBar: const CommonAppBarWidget(title: kDoctorEditorTitle),
      body: ListView(
        padding: AppUIUtils.horizontalPadding.copyWith(top: 8, bottom: 24),
        children: [
          const AppText(
            text: kDoctorEditorSubtitle,
            fontSize: TextStyles.k14FontSize,
            color: kColorTextSecondary,
          ),
          Spacing.v12,
          AppTextField(
            controller: controller.nameController,
            hintText: kDoctorNameHint,
            prefix: AppTextField.fieldIcon(Icons.person_outline_rounded),
          ),
          Spacing.v12,
          AppTextField(
            controller: controller.specializationController,
            hintText: kDoctorSpecializationHint,
            prefix: AppTextField.fieldIcon(Icons.medical_services_outlined),
          ),
          Spacing.v12,
          AppTextField(
            controller: controller.phoneController,
            hintText: kDoctorPhoneHint,
            textInputType: TextInputType.phone,
            prefix: AppTextField.fieldIcon(Icons.call_outlined),
          ),
          Spacing.v12,
          AppTextField(
            controller: controller.emailController,
            hintText: kDoctorEmailHint,
            textInputType: TextInputType.emailAddress,
            prefix: AppTextField.fieldIcon(Icons.mail_outline_rounded),
          ),
          Spacing.v12,
          Obx(
            () => AppDropDown<DoctorStatus>(
              value: controller.selectedStatus.value,
              hint: kDoctorStatusHint,
              items: controller.statuses
                  .map(
                    (status) => DropdownMenuItem<DoctorStatus>(
                      value: status,
                      child: Text(status.label),
                    ),
                  )
                  .toList(),
              onChanged: controller.onStatusChanged,
            ),
          ),
          Spacing.v12,
          AppTextField(
            controller: controller.experienceController,
            hintText: kDoctorExperienceHint,
            prefix: AppTextField.fieldIcon(Icons.workspace_premium_outlined),
          ),
          Spacing.v12,
          AppTextField(
            controller: controller.opdController,
            hintText: kDoctorOpdHint,
            prefix: AppTextField.fieldIcon(Icons.schedule_rounded),
          ),
          Spacing.v12,
          AppTextField(
            controller: controller.notesController,
            hintText: kDoctorNotesHint,
            maxLines: 2,
            minLines: 2,
            prefix: AppTextField.fieldIcon(Icons.note_alt_outlined),
          ),
          Spacing.v16,
          Obx(
            () => appButton(
              onPressed: controller.onSave,
              buttonText: kDoctorSaveButton,
              isLoading: controller.isSaving.value,
            ),
          ),
        ],
      ),
    );
  }
}
