import 'package:doctors_clinic/app/main/appointments/utils/appointment_format_utils.dart';
import 'package:doctors_clinic/app/main/followups/controllers/follow_up_editor_controller.dart';
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

class FollowUpEditorView extends GetView<FollowUpEditorController> {
  const FollowUpEditorView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kColorBackground,
      appBar: const CommonAppBarWidget(title: kFollowUpEditorTitle),
      body: ListView(
        padding: AppUIUtils.horizontalPadding.copyWith(top: 8, bottom: 24),
        children: [
          const AppText(
            text: kFollowUpEditorSubtitle,
            fontSize: TextStyles.k14FontSize,
            color: kColorTextSecondary,
          ),
          Spacing.v12,
          Obx(
            () => AppDropDown<String>(
              value: controller.selectedPatientId.value,
              hint: kFollowUpPatientHint,
              items: controller.patients
                  .map(
                    (patient) => DropdownMenuItem<String>(
                      value: patient.id,
                      child: Text('${patient.fullName} · ${patient.phone}'),
                    ),
                  )
                  .toList(),
              onChanged: controller.onPatientChanged,
            ),
          ),
          Spacing.v12,
          Obx(
            () => InkWell(
              onTap: () => controller.onPickDate(context),
              borderRadius: BorderRadius.circular(12),
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 14,
                ),
                decoration: BoxDecoration(
                  color: kColorSurface,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: kColorBorder, width: 0.5),
                ),
                child: Row(
                  children: [
                    const Icon(
                      Icons.event_outlined,
                      size: 20,
                      color: kColorTextSecondary,
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: AppText(
                        text: AppointmentFormatUtils.formatDateLong(
                          controller.followUpDate.value,
                        ),
                        fontSize: TextStyles.k14FontSize,
                        color: kColorTitle,
                      ),
                    ),
                    const Icon(
                      Icons.calendar_month_outlined,
                      size: 20,
                      color: kColorTextSecondary,
                    ),
                  ],
                ),
              ),
            ),
          ),
          Spacing.v12,
          AppTextField(
            controller: controller.reasonController,
            hintText: kFollowUpReasonHint,
            prefix: AppTextField.fieldIcon(Icons.healing_outlined),
          ),
          Spacing.v12,
          AppTextField(
            controller: controller.notesController,
            hintText: kFollowUpNotesHint,
            maxLines: 3,
            minLines: 3,
            prefix: AppTextField.fieldIcon(Icons.note_alt_outlined),
          ),
          Spacing.v16,
          Obx(
            () => appButton(
              onPressed: controller.onSave,
              buttonText: kFollowUpSaveButton,
              isLoading: controller.isSaving.value,
            ),
          ),
        ],
      ),
    );
  }
}
