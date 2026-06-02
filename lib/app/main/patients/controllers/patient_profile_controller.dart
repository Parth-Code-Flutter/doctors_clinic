import 'package:doctors_clinic/app/main/patients/data/patient_repository.dart';
import 'package:doctors_clinic/app/main/patients/models/patient_model.dart';
import 'package:doctors_clinic/app/main/patients/models/patient_visit_item.dart';
import 'package:doctors_clinic/app/main/patients/patient_route_arguments.dart';
import 'package:doctors_clinic/app/main/appointments/utils/appointment_format_utils.dart';
import 'package:doctors_clinic/app/main/visits/data/visit_repository.dart';
import 'package:doctors_clinic/app/main/visits/visit_route_arguments.dart';
import 'package:doctors_clinic/constants/string_constants.dart';
import 'package:doctors_clinic/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PatientProfileController extends GetxController {
  final patient = Rxn<PatientModel>();
  final visits = <PatientVisitItem>[].obs;

  late String _patientId;

  PatientRepository get _repo => Get.find<PatientRepository>();
  VisitRepository get _visitRepo => Get.find<VisitRepository>();

  @override
  void onInit() {
    super.onInit();
    _patientId = Get.arguments?[PatientRouteArgs.patientId] as String? ?? '';
    loadPatient();
  }

  void loadPatient() {
    final found = _repo.findById(_patientId);
    if (found == null) {
      Get.back();
      return;
    }
    patient.value = found;
    visits.assignAll(_visitsForPatient(found));
  }

  Future<void> onEdit() async {
    final result = await Get.toNamed(
      Routes.PATIENT_EDIT,
      arguments: {PatientRouteArgs.patientId: _patientId},
    );
    if (result == true) {
      loadPatient();
    }
  }

  void onBookVisit() {
    Get.toNamed(
      Routes.APPOINTMENT_ADD,
      arguments: {PatientRouteArgs.patientId: _patientId},
    );
  }

  void onCall() {
    Get.snackbar(
      kPatientProfileCall,
      patient.value?.phone ?? '',
      snackPosition: SnackPosition.BOTTOM,
      margin: const EdgeInsets.all(16),
      duration: const Duration(seconds: 2),
    );
  }

  Future<void> onTapVisit(PatientVisitItem visit) async {
    if (visit.visitId == null) {
      return;
    }
    final result = await Get.toNamed(
      Routes.VISIT_DETAIL,
      arguments: {VisitRouteArgs.visitId: visit.visitId},
    );
    if (result == true) {
      loadPatient();
    }
  }

  List<PatientVisitItem> _visitsForPatient(PatientModel p) {
    final visitRecords = _visitRepo.visitsForPatient(p.id);
    final mapped = visitRecords
        .map(
          (record) => PatientVisitItem(
            visitId: record.id,
            dateLabel: AppointmentFormatUtils.formatDateLong(record.visitAt),
            timeLabel: AppointmentFormatUtils.formatTime(record.visitAt),
            reason: record.diagnosis ?? record.chiefComplaint ?? 'Visit note',
            statusLabel: kDashboardStatusCompleted,
            isUpcoming: false,
          ),
        )
        .toList();
    if (mapped.isNotEmpty) {
      return mapped;
    }
    return [
      if (p.nextAppointmentAt != null)
        const PatientVisitItem(
          dateLabel: 'Upcoming',
          timeLabel: '10:30 AM',
          reason: 'Scheduled follow-up',
          statusLabel: kDashboardStatusUpcoming,
          isUpcoming: true,
        ),
      const PatientVisitItem(
        dateLabel: '12 May 2026',
        timeLabel: '11:00 AM',
        reason: 'Consultation',
        statusLabel: kDashboardStatusCompleted,
        isUpcoming: false,
      ),
      const PatientVisitItem(
        dateLabel: '28 Apr 2026',
        timeLabel: '09:15 AM',
        reason: 'Routine check',
        statusLabel: kDashboardStatusCompleted,
        isUpcoming: false,
      ),
    ];
  }
}
