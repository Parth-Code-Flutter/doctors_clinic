class PrescriptionItemModel {
  const PrescriptionItemModel({
    required this.medicine,
    required this.dosage,
    required this.frequency,
    required this.duration,
    this.instructions,
  });

  final String medicine;
  final String dosage;
  final String frequency;
  final String duration;
  final String? instructions;
}
