import 'package:doctors_clinic/app/main/appointments/utils/appointment_format_utils.dart';
import 'package:doctors_clinic/app/main/visits/controllers/visit_editor_controller.dart';
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

class VisitEditorView extends GetView<VisitEditorController> {
  const VisitEditorView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kColorBackground,
      appBar: const CommonAppBarWidget(title: kVisitEditorTitle),
      body: ListView(
        padding: AppUIUtils.horizontalPadding.copyWith(top: 8, bottom: 24),
        children: [
          const AppText(
            text: kVisitEditorSubtitle,
            fontSize: TextStyles.k14FontSize,
            color: kColorTextSecondary,
          ),
          Spacing.v16,
          Obx(
            () => AppDropDown<String>(
              value: controller.selectedPatientId.value,
              hint: kVisitPatientHint,
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
                      Icons.event_note_rounded,
                      size: 20,
                      color: kColorTextSecondary,
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: AppText(
                        text: AppointmentFormatUtils.formatDateLong(
                          controller.visitDate.value,
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
            controller: controller.complaintController,
            hintText: kVisitComplaintHint,
            prefix: AppTextField.fieldIcon(Icons.record_voice_over_outlined),
          ),
          Spacing.v12,
          AppTextField(
            controller: controller.notesController,
            hintText: kVisitClinicalNotesHint,
            maxLines: 3,
            minLines: 3,
            prefix: AppTextField.fieldIcon(Icons.description_outlined),
          ),
          Spacing.v12,
          AppTextField(
            controller: controller.diagnosisController,
            hintText: kVisitDiagnosisHint,
            maxLines: 2,
            minLines: 2,
            prefix: AppTextField.fieldIcon(Icons.science_outlined),
          ),
          Spacing.v12,
          AppTextField(
            controller: controller.followUpController,
            hintText: kVisitFollowUpHint,
            maxLines: 2,
            minLines: 2,
            prefix: AppTextField.fieldIcon(Icons.assignment_turned_in_outlined),
          ),
          Spacing.v20,
          const SemiBoldText(
            text: kVisitPrescriptionSectionTitle,
            fontSize: TextStyles.k16FontSize,
            color: kColorTitle,
          ),
          const SizedBox(height: 10),
          AppTextField(
            controller: controller.medicineController,
            hintText: kVisitMedicineNameHint,
            prefix: AppTextField.fieldIcon(Icons.medication_outlined),
          ),
          Spacing.v8,
          Row(
            children: [
              Expanded(
                child: AppTextField(
                  controller: controller.dosageController,
                  hintText: kVisitMedicineDosageHint,
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: AppTextField(
                  controller: controller.frequencyController,
                  hintText: kVisitMedicineFrequencyHint,
                ),
              ),
            ],
          ),
          Spacing.v8,
          Row(
            children: [
              Expanded(
                child: AppTextField(
                  controller: controller.durationController,
                  hintText: kVisitMedicineDurationHint,
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: AppTextField(
                  controller: controller.instructionController,
                  hintText: kVisitMedicineInstructionHint,
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          SizedBox(
            height: 38,
            child: appButton(
              onPressed: controller.onAddMedicine,
              buttonText: kVisitAddMedicineButton,
              variant: AppButtonVariant.secondary,
              buttonHeight: 38,
              buttonWidth: 170,
            ),
          ),
          Spacing.v12,
          Obx(() {
            if (controller.prescriptionItems.isEmpty) {
              return const AppText(
                text: kVisitPrescriptionEmpty,
                fontSize: TextStyles.k12FontSize,
                color: kColorTextSecondary,
              );
            }
            return Column(
              children: List.generate(controller.prescriptionItems.length, (
                index,
              ) {
                final item = controller.prescriptionItems[index];
                return Container(
                  margin: const EdgeInsets.only(bottom: 8),
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: kColorSurface,
                    borderRadius: BorderRadius.circular(14),
                    border: Border.all(color: kColorBorder),
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SemiBoldText(
                              text: item.medicine,
                              fontSize: TextStyles.k14FontSize,
                              color: kColorTitle,
                            ),
                            const SizedBox(height: 3),
                            AppText(
                              text:
                                  '${item.dosage} · ${item.frequency} · ${item.duration}',
                              fontSize: TextStyles.k12FontSize,
                              color: kColorTextSecondary,
                            ),
                            if (item.instructions != null &&
                                item.instructions!.isNotEmpty) ...[
                              const SizedBox(height: 3),
                              AppText(
                                text: item.instructions!,
                                fontSize: TextStyles.k12FontSize,
                                color: kColorTextSecondary,
                              ),
                            ],
                          ],
                        ),
                      ),
                      IconButton(
                        onPressed: () => controller.onRemoveMedicine(index),
                        icon: const Icon(
                          Icons.close_rounded,
                          color: kColorAppointmentMissed,
                        ),
                      ),
                    ],
                  ),
                );
              }),
            );
          }),
          Spacing.v20,
          Obx(
            () => appButton(
              onPressed: controller.onSaveVisit,
              buttonText: kVisitSaveButton,
              isLoading: controller.isSaving.value,
            ),
          ),
        ],
      ),
    );
  }
}
