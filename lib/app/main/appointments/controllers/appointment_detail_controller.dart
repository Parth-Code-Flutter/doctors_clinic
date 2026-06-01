import 'package:doctors_clinic/app/main/appointments/appointment_route_arguments.dart';
import 'package:doctors_clinic/app/main/appointments/data/appointment_repository.dart';
import 'package:doctors_clinic/app/main/reminders/data/reminder_repository.dart';
import 'package:doctors_clinic/app/main/appointments/models/appointment_model.dart';
import 'package:doctors_clinic/app/main/appointments/models/appointment_status.dart';
import 'package:doctors_clinic/constants/string_constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppointmentDetailController extends GetxController {
  final appointment = Rxn<AppointmentModel>();

  late String _appointmentId;

  AppointmentRepository get _repo => Get.find<AppointmentRepository>();

  @override
  void onInit() {
    super.onInit();
    _appointmentId =
        Get.arguments?[AppointmentRouteArgs.appointmentId] as String? ?? '';
    loadAppointment();
  }

  void loadAppointment() {
    final found = _repo.findById(_appointmentId);
    if (found == null) {
      Get.back();
      return;
    }
    appointment.value = found;
  }

  void _updateStatus(AppointmentStatus status) {
    final current = appointment.value;
    if (current == null) {
      return;
    }
    final updated = current.copyWith(status: status);
    _repo.updateAppointment(updated);
    appointment.value = updated;
    Get.snackbar(
      kAppointmentDetailTitle,
      kAppointmentDetailStatusUpdated,
      snackPosition: SnackPosition.BOTTOM,
      margin: const EdgeInsets.all(16),
      duration: const Duration(seconds: 2),
    );
  }

  void onMarkCompleted() => _updateStatus(AppointmentStatus.completed);

  void onMarkMissed() => _updateStatus(AppointmentStatus.missed);

  void onCancel() => _updateStatus(AppointmentStatus.cancelled);

  void onSendReminder() {
    final current = appointment.value;
    if (current == null) {
      return;
    }
    final updated = current.copyWith(reminderSent: true);
    _repo.updateAppointment(updated);
    appointment.value = updated;
    if (Get.isRegistered<ReminderRepository>()) {
      Get.find<ReminderRepository>().markSentForAppointment(_appointmentId);
    }
    Get.snackbar(
      kAppointmentDetailSendReminder,
      kRemindersManualSentNote,
      snackPosition: SnackPosition.BOTTOM,
      margin: const EdgeInsets.all(16),
      duration: const Duration(seconds: 3),
    );
  }

  void onCallPatient() {
    Get.snackbar(
      kAppointmentDetailCall,
      appointment.value?.patientPhone ?? '',
      snackPosition: SnackPosition.BOTTOM,
      margin: const EdgeInsets.all(16),
      duration: const Duration(seconds: 2),
    );
  }
}
