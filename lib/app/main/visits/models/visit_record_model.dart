import 'package:doctors_clinic/app/main/visits/models/prescription_item_model.dart';

class VisitRecordModel {
  const VisitRecordModel({
    required this.id,
    required this.patientId,
    required this.patientName,
    required this.patientPhone,
    required this.visitAt,
    this.appointmentId,
    this.chiefComplaint,
    this.clinicalNotes,
    this.diagnosis,
    this.followUpAdvice,
    this.prescription = const [],
  });

  final String id;
  final String patientId;
  final String patientName;
  final String patientPhone;
  final DateTime visitAt;
  final String? appointmentId;
  final String? chiefComplaint;
  final String? clinicalNotes;
  final String? diagnosis;
  final String? followUpAdvice;
  final List<PrescriptionItemModel> prescription;

  VisitRecordModel copyWith({
    DateTime? visitAt,
    String? chiefComplaint,
    String? clinicalNotes,
    String? diagnosis,
    String? followUpAdvice,
    List<PrescriptionItemModel>? prescription,
    bool clearChiefComplaint = false,
    bool clearClinicalNotes = false,
    bool clearDiagnosis = false,
    bool clearFollowUpAdvice = false,
  }) {
    return VisitRecordModel(
      id: id,
      patientId: patientId,
      patientName: patientName,
      patientPhone: patientPhone,
      visitAt: visitAt ?? this.visitAt,
      appointmentId: appointmentId,
      chiefComplaint: clearChiefComplaint
          ? null
          : (chiefComplaint ?? this.chiefComplaint),
      clinicalNotes: clearClinicalNotes
          ? null
          : (clinicalNotes ?? this.clinicalNotes),
      diagnosis: clearDiagnosis ? null : (diagnosis ?? this.diagnosis),
      followUpAdvice: clearFollowUpAdvice
          ? null
          : (followUpAdvice ?? this.followUpAdvice),
      prescription: prescription ?? this.prescription,
    );
  }
}
