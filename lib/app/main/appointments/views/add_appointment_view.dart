import 'package:doctors_clinic/app/main/appointments/controllers/add_appointment_controller.dart';
import 'package:doctors_clinic/app/main/appointments/widgets/booking_step_header.dart';
import 'package:doctors_clinic/app/main/appointments/widgets/patient_picker_tile.dart';
import 'package:doctors_clinic/app/main/appointments/widgets/quick_time_slot_chips.dart';
import 'package:doctors_clinic/app/main/patients/widgets/patient_avatar.dart';
import 'package:doctors_clinic/app/main/patients/widgets/patient_tip_banner.dart';
import 'package:doctors_clinic/constants/color_constants.dart';
import 'package:doctors_clinic/constants/string_constants.dart';
import 'package:doctors_clinic/utils/app_widgets/app_button.dart'
    show AppButtonVariant, appButton;
import 'package:doctors_clinic/utils/app_widgets/app_drop_down.dart';
import 'package:doctors_clinic/utils/app_widgets/app_spaces.dart';
import 'package:doctors_clinic/utils/app_widgets/app_text_field.dart';
import 'package:doctors_clinic/utils/app_widgets/common_app_bar_widget.dart';
import 'package:doctors_clinic/utils/text_utils/app_text.dart';
import 'package:doctors_clinic/utils/text_utils/text_styles.dart';
import 'package:doctors_clinic/utils/ui_utils/app_ui_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddAppointmentView extends GetView<AddAppointmentController> {
  const AddAppointmentView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kColorBackground,
      appBar: const CommonAppBarWidget(title: kAddAppointmentTitle),
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Column(
          children: [
            Expanded(
              child: Obx(
                () => Padding(
                  padding: AppUIUtils.horizontalPadding.copyWith(top: 8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      BookingStepHeader(
                        currentStep: controller.currentStep.value,
                        totalSteps: AddAppointmentController.totalSteps,
                        title: controller.stepTitle,
                        subtitle: controller.stepSubtitle,
                      ),
                      Spacing.v12,
                      PatientTipBanner(message: controller.currentTip),
                      Spacing.v16,
                      Expanded(
                        child: PageView(
                          controller: controller.pageController,
                          physics: const NeverScrollableScrollPhysics(),
                          children: [
                            _PatientStep(controller: controller),
                            _ScheduleStep(controller: controller),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            _BottomBar(controller: controller),
          ],
        ),
      ),
    );
  }
}

class _PatientStep extends StatelessWidget {
  const _PatientStep({required this.controller});

  final AddAppointmentController controller;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: controller.stepFormKeys[0],
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Obx(() {
            final selected = controller.selectedPatient.value;
            if (selected != null) {
              return Container(
                margin: const EdgeInsets.only(bottom: 12),
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: kColorSurface,
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: kColorLink),
                ),
                child: Row(
                  children: [
                    PatientAvatar(
                      initials: selected.initials,
                      colorIndex: selected.avatarColorIndex,
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const AppText(
                            text: kAddAppointmentSelectedPatient,
                            fontSize: TextStyles.k12FontSize,
                            color: kColorTextSecondary,
                          ),
                          SemiBoldText(
                            text: selected.fullName,
                            fontSize: TextStyles.k16FontSize,
                            color: kColorTitle,
                          ),
                        ],
                      ),
                    ),
                    TextButton(
                      onPressed: () => controller.selectedPatient.value = null,
                      child: const SemiBoldText(
                        text: kAddAppointmentChangePatient,
                        fontSize: TextStyles.k12FontSize,
                        color: kColorLink,
                      ),
                    ),
                  ],
                ),
              );
            }
            return const SizedBox.shrink();
          }),
          AppTextField(
            controller: controller.patientSearchController,
            hintText: kPatientsSearchHint,
            prefix: AppTextField.fieldIcon(Icons.search_rounded),
          ),
          Spacing.v12,
          Expanded(
            child: Obx(() {
              final patients = controller.filteredPatients;
              if (patients.isEmpty) {
                return const Center(
                  child: AppText(
                    text: kPatientsEmptySearchSubtitle,
                    fontSize: TextStyles.k14FontSize,
                    color: kColorTextSecondary,
                    align: TextAlign.center,
                  ),
                );
              }
              return ListView.separated(
                itemCount: patients.length,
                separatorBuilder: (_, __) => const SizedBox(height: 8),
                itemBuilder: (context, index) {
                  final patient = patients[index];
                  return Obx(
                    () => PatientPickerTile(
                      patient: patient,
                      selected:
                          controller.selectedPatient.value?.id == patient.id,
                      onTap: () => controller.onPatientSelected(patient),
                    ),
                  );
                },
              );
            }),
          ),
        ],
      ),
    );
  }
}

class _ScheduleStep extends StatelessWidget {
  const _ScheduleStep({required this.controller});

  final AddAppointmentController controller;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: controller.stepFormKeys[1],
      child: ListView(
        children: [
          const SemiBoldText(
            text: kAddAppointmentDateLabel,
            fontSize: TextStyles.k14FontSize,
            color: kColorTitle,
          ),
          Spacing.v8,
          Obx(
            () => Material(
              color: Colors.transparent,
              child: InkWell(
                onTap: () => controller.onPickDate(context),
                borderRadius: BorderRadius.circular(12),
                child: Ink(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 14,
                    vertical: 16,
                  ),
                  decoration: BoxDecoration(
                    color: kColorSurface,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: kColorBorder),
                  ),
                  child: Row(
                    children: [
                      const Icon(
                        Icons.calendar_month_rounded,
                        color: kColorLink,
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: SemiBoldText(
                          text: controller.selectedDateLabel,
                          fontSize: TextStyles.k14FontSize,
                          color: kColorTitle,
                        ),
                      ),
                      const Icon(Icons.chevron_right_rounded),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Spacing.v20,
          const SemiBoldText(
            text: kAddAppointmentTimeLabel,
            fontSize: TextStyles.k14FontSize,
            color: kColorTitle,
          ),
          Spacing.v8,
          Obx(
            () => QuickTimeSlotChips(
              slots: QuickTimeSlotChips.clinicDefaults(),
              selectedHour: controller.selectedHour.value,
              selectedMinute: controller.selectedMinute.value,
              onSelected: controller.onTimeSlotSelected,
            ),
          ),
          Spacing.v20,
          const SemiBoldText(
            text: kAddAppointmentDoctorLabel,
            fontSize: TextStyles.k14FontSize,
            color: kColorTitle,
          ),
          Spacing.v8,
          Obx(
            () => AppDropDown<String>(
              value: controller.selectedDoctorId.value,
              hint: kAddAppointmentDoctorHint,
              items: controller.doctors
                  .map(
                    (doctor) => DropdownMenuItem<String>(
                      value: doctor.id,
                      child: Text(doctor.fullName),
                    ),
                  )
                  .toList(),
              onChanged: controller.onDoctorChanged,
            ),
          ),
          Spacing.v20,
          AppTextField(
            controller: controller.reasonController,
            hintText: kAddAppointmentReasonHint,
            textCapitalization: TextCapitalization.sentences,
            prefix: AppTextField.fieldIcon(Icons.medical_services_outlined),
          ),
          Spacing.v16,
          const SemiBoldText(
            text: kAddAppointmentReminderLabel,
            fontSize: TextStyles.k14FontSize,
            color: kColorTitle,
          ),
          Spacing.v8,
          Obx(
            () => AppDropDown<int>(
              value: controller.selectedReminderIndex.value,
              items: List.generate(
                kDefaultReminderOptions.length,
                (index) => DropdownMenuItem(
                  value: index,
                  child: Text(kDefaultReminderOptions[index]),
                ),
              ),
              onChanged: controller.onReminderChanged,
            ),
          ),
          Spacing.v16,
          AppTextField(
            controller: controller.notesController,
            hintText: kAddAppointmentNotesHint,
            maxLines: 3,
            minLines: 2,
            prefix: AppTextField.fieldIcon(Icons.notes_rounded),
          ),
        ],
      ),
    );
  }
}

class _BottomBar extends StatelessWidget {
  const _BottomBar({required this.controller});

  final AddAppointmentController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: AppUIUtils.horizontalPadding.copyWith(
        top: 12,
        bottom: MediaQuery.paddingOf(context).bottom + 16,
      ),
      decoration: const BoxDecoration(
        color: kColorSurface,
        border: Border(top: BorderSide(color: kColorBorder)),
      ),
      child: Obx(
        () => Row(
          children: [
            if (controller.canGoBack)
              Expanded(
                child: appButton(
                  onPressed: controller.onBack,
                  buttonText: kAddAppointmentBack,
                  variant: AppButtonVariant.secondary,
                ),
              ),
            if (controller.canGoBack) const SizedBox(width: 12),
            Expanded(
              flex: controller.canGoBack ? 2 : 1,
              child: appButton(
                onPressed: controller.onPrimaryAction,
                buttonText: controller.primaryButtonLabel,
                isLoading: controller.isSaving.value,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
