import 'package:doctors_clinic/app/main/queue/controllers/add_queue_token_controller.dart';
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

class AddQueueTokenView extends GetView<AddQueueTokenController> {
  const AddQueueTokenView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kColorBackground,
      appBar: const CommonAppBarWidget(title: kQueueAddTitle),
      body: ListView(
        padding: AppUIUtils.horizontalPadding.copyWith(top: 8, bottom: 24),
        children: [
          const AppText(
            text: kQueueAddSubtitle,
            fontSize: TextStyles.k14FontSize,
            color: kColorTextSecondary,
          ),
          Spacing.v16,
          Obx(
            () => AppDropDown<String>(
              value: controller.selectedPatientId.value,
              hint: kQueuePatientHint,
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
          AppTextField(
            controller: controller.reasonController,
            hintText: kQueueReasonHint,
            prefix: AppTextField.fieldIcon(Icons.short_text_rounded),
          ),
          Spacing.v12,
          AppTextField(
            controller: controller.notesController,
            hintText: kQueueNotesHint,
            maxLines: 2,
            minLines: 2,
            prefix: AppTextField.fieldIcon(Icons.sticky_note_2_outlined),
          ),
          Spacing.v12,
          Obx(
            () => Container(
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 4),
              decoration: BoxDecoration(
                color: kColorSurface,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: kColorBorder),
              ),
              child: SwitchListTile(
                contentPadding: EdgeInsets.zero,
                value: controller.isPriority.value,
                onChanged: controller.onPriorityChanged,
                title: const SemiBoldText(
                  text: kQueuePrioritySwitchTitle,
                  fontSize: TextStyles.k14FontSize,
                  color: kColorTitle,
                ),
                subtitle: const AppText(
                  text: kQueuePrioritySwitchSubtitle,
                  fontSize: TextStyles.k12FontSize,
                  color: kColorTextSecondary,
                ),
              ),
            ),
          ),
          Spacing.v20,
          Obx(
            () => appButton(
              onPressed: controller.onCreateToken,
              buttonText: kQueueCreateButton,
              isLoading: controller.isSaving.value,
            ),
          ),
        ],
      ),
    );
  }
}
