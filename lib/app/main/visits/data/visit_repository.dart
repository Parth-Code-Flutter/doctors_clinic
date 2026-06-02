import 'package:doctors_clinic/app/main/appointments/data/appointment_repository.dart';
import 'package:doctors_clinic/app/main/patients/data/patient_repository.dart';
import 'package:doctors_clinic/app/main/patients/models/patient_model.dart';
import 'package:doctors_clinic/app/main/visits/models/prescription_item_model.dart';
import 'package:doctors_clinic/app/main/visits/models/visit_record_model.dart';
import 'package:get/get.dart';

class VisitRepository extends GetxService {
  final _visits = <VisitRecordModel>[].obs;

  List<VisitRecordModel> get visits => List.unmodifiable(_visits);

  PatientRepository get _patients => Get.find<PatientRepository>();
  AppointmentRepository get _appointments => Get.find<AppointmentRepository>();

  @override
  void onInit() {
    super.onInit();
    if (_visits.isEmpty) {
      seedMockVisits();
    }
  }

  VisitRecordModel? findById(String id) {
    for (final visit in _visits) {
      if (visit.id == id) {
        return visit;
      }
    }
    return null;
  }

  List<VisitRecordModel> visitsForPatient(String patientId) {
    final items = _visits.where((v) => v.patientId == patientId).toList();
    items.sort((a, b) => b.visitAt.compareTo(a.visitAt));
    return items;
  }

  VisitRecordModel? visitForAppointment(String appointmentId) {
    for (final visit in _visits) {
      if (visit.appointmentId == appointmentId) {
        return visit;
      }
    }
    return null;
  }

  void save(VisitRecordModel record) {
    final index = _visits.indexWhere((v) => v.id == record.id);
    if (index >= 0) {
      _visits[index] = record;
    } else {
      _visits.insert(0, record);
    }
  }

  String newId() => 'v-${DateTime.now().millisecondsSinceEpoch}';

  void seedMockVisits() {
    final patients = _patients.patients;
    if (patients.isEmpty) {
      return;
    }
    PatientModel p(int i) => patients[i % patients.length];
    final now = DateTime.now();
    final appointment = _appointments.appointments.isNotEmpty
        ? _appointments.appointments.first
        : null;

    _visits.assignAll([
      VisitRecordModel(
        id: 'v-1',
        patientId: p(0).id,
        patientName: p(0).fullName,
        patientPhone: p(0).phone,
        visitAt: now.subtract(const Duration(days: 4)),
        appointmentId: appointment?.id,
        chiefComplaint: 'Tooth pain on right side',
        clinicalNotes: 'Mild swelling. No fever.',
        diagnosis: 'Dental caries with gum inflammation',
        followUpAdvice: 'Warm saline rinse twice daily. Follow-up in 5 days.',
        prescription: const [
          PrescriptionItemModel(
            medicine: 'Amoxicillin',
            dosage: '500 mg',
            frequency: 'TID',
            duration: '5 days',
            instructions: 'After food',
          ),
          PrescriptionItemModel(
            medicine: 'Ibuprofen',
            dosage: '400 mg',
            frequency: 'SOS',
            duration: '3 days',
            instructions: 'If pain persists',
          ),
        ],
      ),
      VisitRecordModel(
        id: 'v-2',
        patientId: p(2).id,
        patientName: p(2).fullName,
        patientPhone: p(2).phone,
        visitAt: now.subtract(const Duration(days: 12)),
        chiefComplaint: 'Skin irritation and itching',
        clinicalNotes: 'Localized rash over forearm.',
        diagnosis: 'Contact dermatitis',
        followUpAdvice: 'Avoid trigger cosmetics and harsh soaps.',
        prescription: const [
          PrescriptionItemModel(
            medicine: 'Cetirizine',
            dosage: '10 mg',
            frequency: 'OD',
            duration: '7 days',
          ),
        ],
      ),
    ]);
  }
}
