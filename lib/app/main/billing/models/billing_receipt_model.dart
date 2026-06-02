import 'package:doctors_clinic/app/main/billing/models/billing_line_item_model.dart';

class BillingReceiptModel {
  const BillingReceiptModel({
    required this.id,
    required this.invoiceNumber,
    required this.patientId,
    required this.patientName,
    required this.patientPhone,
    required this.createdAt,
    required this.items,
    required this.discountAmount,
    required this.paidAmount,
    required this.paymentMode,
    this.visitId,
    this.note,
  });

  final String id;
  final String invoiceNumber;
  final String patientId;
  final String patientName;
  final String patientPhone;
  final DateTime createdAt;
  final List<BillingLineItemModel> items;
  final double discountAmount;
  final double paidAmount;
  final String paymentMode;
  final String? visitId;
  final String? note;

  double get subTotal => items.fold(0, (sum, i) => sum + i.total);
  double get total => (subTotal - discountAmount).clamp(0, double.infinity);
  double get dueAmount => (total - paidAmount).clamp(0, double.infinity);
}
