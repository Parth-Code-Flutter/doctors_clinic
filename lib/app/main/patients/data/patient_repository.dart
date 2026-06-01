import 'package:doctors_clinic/app/main/patients/models/patient_gender.dart';
import 'package:doctors_clinic/app/main/patients/models/patient_model.dart';
import 'package:get/get.dart';

/// In-memory patient store until v0.2 APIs are connected.
class PatientRepository extends GetxService {
  final _patients = <PatientModel>[].obs;

  List<PatientModel> get patients => List.unmodifiable(_patients);

  @override
  void onInit() {
    super.onInit();
    if (_patients.isEmpty) {
      seedMockPatients();
    }
  }

  PatientModel? findById(String id) {
    for (final patient in _patients) {
      if (patient.id == id) {
        return patient;
      }
    }
    return null;
  }

  void addPatient(PatientModel patient) {
    _patients.insert(0, patient);
  }

  void updatePatient(PatientModel patient) {
    final index = _patients.indexWhere((p) => p.id == patient.id);
    if (index >= 0) {
      _patients[index] = patient;
    }
  }

  List<PatientModel> searchAndFilter({
    String query = '',
    bool recentOnly = false,
    bool upcomingOnly = false,
  }) {
    final normalized = query.trim().toLowerCase();
    final now = DateTime.now();
    final weekAgo = now.subtract(const Duration(days: 7));

    return _patients.where((patient) {
      if (recentOnly && patient.createdAt.isBefore(weekAgo)) {
        return false;
      }
      if (upcomingOnly && !patient.hasUpcomingVisit) {
        return false;
      }
      if (normalized.isEmpty) {
        return true;
      }
      final phone = patient.phone;
      return patient.fullName.toLowerCase().contains(normalized) ||
          phone.contains(normalized) ||
          (patient.notes ?? '').toLowerCase().contains(normalized);
    }).toList()
      ..sort((a, b) => a.fullName.compareTo(b.fullName));
  }

  void seedMockPatients() {
    final now = DateTime.now();
    _patients.assignAll([
      PatientModel(
        id: 'p-1',
        fullName: 'Riya Sharma',
        phone: '9876543210',
        gender: PatientGender.female,
        age: 28,
        address: 'Andheri West, Mumbai',
        notes: 'Prefers morning slots',
        lastVisitAt: now.subtract(const Duration(days: 14)),
        nextAppointmentAt: now.add(const Duration(days: 2, hours: 10)),
        createdAt: now.subtract(const Duration(days: 120)),
      ),
      PatientModel(
        id: 'p-2',
        fullName: 'Amit Patel',
        phone: '9123456780',
        gender: PatientGender.male,
        age: 42,
        lastVisitAt: now.subtract(const Duration(days: 3)),
        createdAt: now.subtract(const Duration(days: 80)),
      ),
      PatientModel(
        id: 'p-3',
        fullName: 'Neha Gupta',
        phone: '9988776655',
        gender: PatientGender.female,
        age: 35,
        nextAppointmentAt: now.add(const Duration(days: 5, hours: 15)),
        createdAt: now.subtract(const Duration(days: 2)),
      ),
      PatientModel(
        id: 'p-4',
        fullName: 'Vikram Singh',
        phone: '9012345678',
        gender: PatientGender.male,
        age: 51,
        address: 'Sector 18, Noida',
        lastVisitAt: now.subtract(const Duration(days: 45)),
        createdAt: now.subtract(const Duration(days: 200)),
      ),
      PatientModel(
        id: 'p-5',
        fullName: 'Sana Khan',
        phone: '9090909090',
        gender: PatientGender.female,
        age: 24,
        createdAt: now.subtract(const Duration(days: 1)),
      ),
    ]);
  }
}
