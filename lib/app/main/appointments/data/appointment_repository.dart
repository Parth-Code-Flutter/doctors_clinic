import 'package:doctors_clinic/app/main/appointments/models/appointment_model.dart';
import 'package:doctors_clinic/app/main/appointments/models/appointment_status.dart';
import 'package:doctors_clinic/app/main/patients/data/patient_repository.dart';
import 'package:doctors_clinic/app/main/patients/models/patient_model.dart';
import 'package:get/get.dart';

enum AppointmentListFilter {
  all,
  today,
  upcoming,
  completed,
  cancelled,
  missed,
}

class AppointmentRepository extends GetxService {
  final _appointments = <AppointmentModel>[].obs;

  List<AppointmentModel> get appointments => List.unmodifiable(_appointments);

  PatientRepository get _patients => Get.find<PatientRepository>();

  @override
  void onInit() {
    super.onInit();
    if (_appointments.isEmpty) {
      seedMockAppointments();
    }
  }

  AppointmentModel? findById(String id) {
    for (final item in _appointments) {
      if (item.id == id) {
        return item;
      }
    }
    return null;
  }

  void addAppointment(AppointmentModel appointment) {
    _appointments.insert(0, appointment);
    _syncPatientNextVisit(appointment);
  }

  void updateAppointment(AppointmentModel appointment) {
    final index = _appointments.indexWhere((a) => a.id == appointment.id);
    if (index >= 0) {
      _appointments[index] = appointment;
      _syncPatientNextVisit(appointment);
    }
  }

  int countForFilter(AppointmentListFilter filter) {
    return searchAndFilter(filter: filter).length;
  }

  List<AppointmentModel> searchAndFilter({
    String query = '',
    AppointmentListFilter filter = AppointmentListFilter.all,
  }) {
    final normalized = query.trim().toLowerCase();
    final now = DateTime.now();

    final filtered = _appointments.where((appointment) {
      if (!_matchesFilter(appointment, filter, now)) {
        return false;
      }
      if (normalized.isEmpty) {
        return true;
      }
      return appointment.patientName.toLowerCase().contains(normalized) ||
          appointment.patientPhone.contains(normalized) ||
          (appointment.reason ?? '').toLowerCase().contains(normalized);
    }).toList();

    filtered.sort((a, b) => a.scheduledAt.compareTo(b.scheduledAt));
    return filtered;
  }

  bool _matchesFilter(
    AppointmentModel appointment,
    AppointmentListFilter filter,
    DateTime now,
  ) {
    switch (filter) {
      case AppointmentListFilter.all:
        return true;
      case AppointmentListFilter.today:
        return appointment.isToday;
      case AppointmentListFilter.upcoming:
        return appointment.status == AppointmentStatus.upcoming &&
            !appointment.scheduledAt.isBefore(
              DateTime(now.year, now.month, now.day),
            );
      case AppointmentListFilter.completed:
        return appointment.status == AppointmentStatus.completed;
      case AppointmentListFilter.cancelled:
        return appointment.status == AppointmentStatus.cancelled;
      case AppointmentListFilter.missed:
        return appointment.status == AppointmentStatus.missed;
    }
  }

  void _syncPatientNextVisit(AppointmentModel appointment) {
    if (appointment.status != AppointmentStatus.upcoming &&
        appointment.status != AppointmentStatus.inProgress) {
      return;
    }

    final patient = _patients.findById(appointment.patientId);
    if (patient == null) {
      return;
    }

    _patients.updatePatient(
      patient.copyWith(nextAppointmentAt: appointment.scheduledAt),
    );
  }

  void seedMockAppointments() {
    final patients = _patients.patients;
    if (patients.isEmpty) {
      return;
    }

    final now = DateTime.now();
    PatientModel patientAt(int index) => patients[index % patients.length];

    _appointments.assignAll([
      _mock(
        id: 'a-1',
        patient: patientAt(0),
        scheduledAt: DateTime(now.year, now.month, now.day, 9, 30),
        status: AppointmentStatus.completed,
        reason: 'Dental check-up',
      ),
      _mock(
        id: 'a-2',
        patient: patientAt(1),
        scheduledAt: DateTime(now.year, now.month, now.day, 10, 15),
        status: AppointmentStatus.inProgress,
        reason: 'Root canal follow-up',
      ),
      _mock(
        id: 'a-3',
        patient: patientAt(2),
        scheduledAt: DateTime(now.year, now.month, now.day, 11, 0),
        status: AppointmentStatus.upcoming,
        reason: 'Skin consultation',
      ),
      _mock(
        id: 'a-4',
        patient: patientAt(3),
        scheduledAt: DateTime(now.year, now.month, now.day, 12, 30),
        status: AppointmentStatus.upcoming,
        reason: 'Physio session',
      ),
      _mock(
        id: 'a-5',
        patient: patientAt(4),
        scheduledAt: now.add(const Duration(days: 2, hours: 15)),
        status: AppointmentStatus.upcoming,
        reason: 'Follow-up visit',
      ),
      _mock(
        id: 'a-6',
        patient: patientAt(1),
        scheduledAt: now.subtract(const Duration(days: 3, hours: 2)),
        status: AppointmentStatus.missed,
        reason: 'Missed consultation',
      ),
      _mock(
        id: 'a-7',
        patient: patientAt(2),
        scheduledAt: now.subtract(const Duration(days: 5)),
        status: AppointmentStatus.cancelled,
        reason: 'Cancelled by patient',
      ),
    ]);
  }

  AppointmentModel _mock({
    required String id,
    required PatientModel patient,
    required DateTime scheduledAt,
    required AppointmentStatus status,
    required String reason,
  }) {
    return AppointmentModel(
      id: id,
      patientId: patient.id,
      patientName: patient.fullName,
      patientPhone: patient.phone,
      scheduledAt: scheduledAt,
      status: status,
      reason: reason,
      createdAt: scheduledAt.subtract(const Duration(days: 2)),
    );
  }
}
