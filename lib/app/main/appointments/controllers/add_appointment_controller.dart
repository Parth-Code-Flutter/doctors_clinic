import 'package:doctors_clinic/app/main/appointments/appointment_route_arguments.dart';
import 'package:doctors_clinic/app/main/appointments/data/appointment_repository.dart';
import 'package:doctors_clinic/app/main/appointments/models/appointment_model.dart';
import 'package:doctors_clinic/app/main/appointments/models/appointment_status.dart';
import 'package:doctors_clinic/app/main/appointments/utils/appointment_format_utils.dart';
import 'package:doctors_clinic/app/main/appointments/widgets/quick_time_slot_chips.dart';
import 'package:doctors_clinic/app/main/patients/data/patient_repository.dart';
import 'package:doctors_clinic/app/main/patients/models/patient_model.dart';
import 'package:doctors_clinic/constants/string_constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddAppointmentController extends GetxController {
  static const int totalSteps = 2;

  final stepFormKeys = List.generate(totalSteps, (_) => GlobalKey<FormState>());
  final pageController = PageController();
  final patientSearchController = TextEditingController();
  final reasonController = TextEditingController();
  final notesController = TextEditingController();

  final currentStep = 0.obs;
  final patientSearchQuery = ''.obs;
  final selectedPatient = Rxn<PatientModel>();
  final selectedDate = Rxn<DateTime>();
  final selectedHour = Rxn<int>();
  final selectedMinute = Rxn<int>();
  final selectedReminderIndex = 1.obs;
  final isSaving = false.obs;

  AppointmentRepository get _appointments => Get.find<AppointmentRepository>();
  PatientRepository get _patients => Get.find<PatientRepository>();

  String? _preselectedPatientId;

  List<PatientModel> get filteredPatients {
    final query = patientSearchQuery.value.trim().toLowerCase();
    final all = _patients.patients;
    if (query.isEmpty) {
      return all;
    }
    return all
        .where(
          (p) =>
              p.fullName.toLowerCase().contains(query) ||
              p.phone.contains(query),
        )
        .toList();
  }

  String get currentTip => currentStep.value == 0
      ? kAddAppointmentTipPatient
      : kAddAppointmentTipSchedule;

  String get stepTitle => currentStep.value == 0
      ? kAddAppointmentStepPatientTitle
      : kAddAppointmentStepScheduleTitle;

  String get stepSubtitle => currentStep.value == 0
      ? kAddAppointmentStepPatientSubtitle
      : kAddAppointmentStepScheduleSubtitle;

  String get primaryButtonLabel =>
      currentStep.value < totalSteps - 1 ? kAddAppointmentContinue : kAddAppointmentSave;

  String get selectedDateLabel {
    final date = selectedDate.value;
    if (date == null) {
      return kAddAppointmentPickDate;
    }
    return AppointmentFormatUtils.formatDateLong(date);
  }

  bool get canGoBack => currentStep.value > 0;

  @override
  void onInit() {
    super.onInit();
    final args = Get.arguments;
    if (args is Map) {
      _preselectedPatientId = args[AppointmentRouteArgs.patientId] as String?;
    }
    patientSearchController.addListener(
      () => patientSearchQuery.value = patientSearchController.text,
    );
    _applyPreselectedPatient();
    selectedDate.value = DateTime.now();
  }

  @override
  void onClose() {
    pageController.dispose();
    patientSearchController.dispose();
    reasonController.dispose();
    notesController.dispose();
    super.onClose();
  }

  void _applyPreselectedPatient() {
    if (_preselectedPatientId == null) {
      return;
    }
    final patient = _patients.findById(_preselectedPatientId!);
    if (patient != null) {
      selectedPatient.value = patient;
    }
  }

  void onPatientSelected(PatientModel patient) {
    selectedPatient.value = patient;
  }

  void onTimeSlotSelected(QuickTimeSlot slot) {
    selectedHour.value = slot.hour;
    selectedMinute.value = slot.minute;
  }

  Future<void> onPickDate(BuildContext context) async {
    final now = DateTime.now();
    final picked = await showDatePicker(
      context: context,
      initialDate: selectedDate.value ?? now,
      firstDate: now.subtract(const Duration(days: 1)),
      lastDate: now.add(const Duration(days: 365)),
    );
    if (picked != null) {
      selectedDate.value = picked;
    }
  }

  void onReminderChanged(int? index) {
    if (index != null) {
      selectedReminderIndex.value = index;
    }
  }

  Future<void> onPrimaryAction() async {
    if (!_validateCurrentStep()) {
      return;
    }

    if (currentStep.value < totalSteps - 1) {
      _goToStep(currentStep.value + 1);
      return;
    }

    await _saveAppointment();
  }

  void onBack() {
    if (currentStep.value > 0) {
      _goToStep(currentStep.value - 1);
    } else {
      Get.back();
    }
  }

  String? validatePatientStep() {
    if (selectedPatient.value == null) {
      return kValidationPatientSelectRequired;
    }
    return null;
  }

  String? validateScheduleStep() {
    if (selectedDate.value == null) {
      return kValidationAppointmentDateRequired;
    }
    if (selectedHour.value == null || selectedMinute.value == null) {
      return kValidationAppointmentTimeRequired;
    }
    return null;
  }

  bool _validateCurrentStep() {
    final step = currentStep.value;
    final formValid = stepFormKeys[step].currentState?.validate() ?? true;
    if (!formValid) {
      return false;
    }
    if (step == 0) {
      final error = validatePatientStep();
      if (error != null) {
        Get.snackbar(
          kAddAppointmentTitle,
          error,
          snackPosition: SnackPosition.BOTTOM,
          margin: const EdgeInsets.all(16),
          duration: const Duration(seconds: 2),
        );
        return false;
      }
    }
    if (step == 1) {
      final error = validateScheduleStep();
      if (error != null) {
        Get.snackbar(
          kAddAppointmentTitle,
          error,
          snackPosition: SnackPosition.BOTTOM,
          margin: const EdgeInsets.all(16),
          duration: const Duration(seconds: 2),
        );
        return false;
      }
    }
    return true;
  }

  void _goToStep(int step) {
    currentStep.value = step;
    pageController.animateToPage(
      step,
      duration: const Duration(milliseconds: 280),
      curve: Curves.easeOutCubic,
    );
  }

  Future<void> _saveAppointment() async {
    if (isSaving.value) {
      return;
    }

    final patient = selectedPatient.value;
    final date = selectedDate.value;
    final hour = selectedHour.value;
    final minute = selectedMinute.value;
    if (patient == null || date == null || hour == null || minute == null) {
      return;
    }

    try {
      isSaving.value = true;
      await Future<void>.delayed(const Duration(milliseconds: 500));

      final scheduledAt = DateTime(
        date.year,
        date.month,
        date.day,
        hour,
        minute,
      );

      final appointment = AppointmentModel(
        id: 'a-${DateTime.now().millisecondsSinceEpoch}',
        patientId: patient.id,
        patientName: patient.fullName,
        patientPhone: patient.phone,
        scheduledAt: scheduledAt,
        status: AppointmentStatus.upcoming,
        reason: reasonController.text.trim().isEmpty
            ? null
            : reasonController.text.trim(),
        notes: notesController.text.trim().isEmpty
            ? null
            : notesController.text.trim(),
        reminderLabel:
            kDefaultReminderOptions[selectedReminderIndex.value.clamp(
              0,
              kDefaultReminderOptions.length - 1,
            )],
        createdAt: DateTime.now(),
      );

      _appointments.addAppointment(appointment);
      Get.back(result: true);
      Get.snackbar(
        kAddAppointmentTitle,
        kAddAppointmentSuccess,
        snackPosition: SnackPosition.BOTTOM,
        margin: const EdgeInsets.all(16),
        duration: const Duration(seconds: 2),
      );
    } finally {
      isSaving.value = false;
    }
  }
}
