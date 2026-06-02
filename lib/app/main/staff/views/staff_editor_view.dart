import 'package:doctors_clinic/app/main/staff/controllers/staff_editor_controller.dart';
import 'package:doctors_clinic/app/main/staff/models/staff_role.dart';
import 'package:doctors_clinic/app/main/staff/models/staff_status.dart';
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

class StaffEditorView extends GetView<StaffEditorController> {
  const StaffEditorView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kColorBackground,
      appBar: const CommonAppBarWidget(title: kStaffEditorTitle),
      body: ListView(
        padding: AppUIUtils.horizontalPadding.copyWith(top: 8, bottom: 24),
        children: [
          const AppText(
            text: kStaffEditorSubtitle,
            fontSize: TextStyles.k14FontSize,
            color: kColorTextSecondary,
          ),
          Spacing.v12,
          AppTextField(
            controller: controller.nameController,
            hintText: kStaffNameHint,
            prefix: AppTextField.fieldIcon(Icons.person_outline_rounded),
          ),
          Spacing.v12,
          AppTextField(
            controller: controller.phoneController,
            hintText: kStaffPhoneHint,
            textInputType: TextInputType.phone,
            prefix: AppTextField.fieldIcon(Icons.call_outlined),
          ),
          Spacing.v12,
          AppTextField(
            controller: controller.emailController,
            hintText: kStaffEmailHint,
            textInputType: TextInputType.emailAddress,
            prefix: AppTextField.fieldIcon(Icons.mail_outline_rounded),
          ),
          Spacing.v12,
          Obx(
            () => AppDropDown<StaffRole>(
              value: controller.selectedRole.value,
              hint: kStaffRoleHint,
              items: controller.roles
                  .map(
                    (role) => DropdownMenuItem<StaffRole>(
                      value: role,
                      child: Text(role.label),
                    ),
                  )
                  .toList(),
              onChanged: controller.onRoleChanged,
            ),
          ),
          Spacing.v12,
          Obx(
            () => AppDropDown<StaffStatus>(
              value: controller.selectedStatus.value,
              hint: kStaffStatusHint,
              items: controller.statuses
                  .map(
                    (status) => DropdownMenuItem<StaffStatus>(
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
            controller: controller.shiftController,
            hintText: kStaffShiftHint,
            prefix: AppTextField.fieldIcon(Icons.schedule_rounded),
          ),
          Spacing.v12,
          AppTextField(
            controller: controller.permissionsController,
            hintText: kStaffPermissionsHint,
            maxLines: 2,
            minLines: 2,
            prefix: AppTextField.fieldIcon(Icons.verified_user_outlined),
          ),
          Spacing.v12,
          AppTextField(
            controller: controller.notesController,
            hintText: kStaffNotesHint,
            maxLines: 2,
            minLines: 2,
            prefix: AppTextField.fieldIcon(Icons.note_alt_outlined),
          ),
          Spacing.v16,
          Obx(
            () => appButton(
              onPressed: controller.onSave,
              buttonText: kStaffSaveButton,
              isLoading: controller.isSaving.value,
            ),
          ),
        ],
      ),
    );
  }
}
