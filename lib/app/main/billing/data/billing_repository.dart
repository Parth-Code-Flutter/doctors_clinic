import 'package:doctors_clinic/app/main/billing/models/billing_line_item_model.dart';
import 'package:doctors_clinic/app/main/billing/models/billing_receipt_model.dart';
import 'package:doctors_clinic/app/main/patients/data/patient_repository.dart';
import 'package:doctors_clinic/app/main/patients/models/patient_model.dart';
import 'package:get/get.dart';

class BillingRepository extends GetxService {
  final _receipts = <BillingReceiptModel>[].obs;

  PatientRepository get _patients => Get.find<PatientRepository>();

  List<BillingReceiptModel> get receipts {
    final list = List<BillingReceiptModel>.from(_receipts);
    list.sort((a, b) => b.createdAt.compareTo(a.createdAt));
    return list;
  }

  @override
  void onInit() {
    super.onInit();
    if (_receipts.isEmpty) {
      seedMockReceipts();
    }
  }

  BillingReceiptModel? findById(String id) {
    for (final receipt in _receipts) {
      if (receipt.id == id) {
        return receipt;
      }
    }
    return null;
  }

  List<BillingReceiptModel> search(String query) {
    final q = query.trim().toLowerCase();
    if (q.isEmpty) {
      return receipts;
    }
    return receipts.where((r) {
      return r.invoiceNumber.toLowerCase().contains(q) ||
          r.patientName.toLowerCase().contains(q) ||
          r.patientPhone.contains(q);
    }).toList();
  }

  BillingReceiptModel? findByVisitId(String visitId) {
    for (final receipt in _receipts) {
      if (receipt.visitId == visitId) {
        return receipt;
      }
    }
    return null;
  }

  void save(BillingReceiptModel receipt) {
    final index = _receipts.indexWhere((r) => r.id == receipt.id);
    if (index >= 0) {
      _receipts[index] = receipt;
    } else {
      _receipts.insert(0, receipt);
    }
  }

  String newId() => 'inv-${DateTime.now().millisecondsSinceEpoch}';

  String newInvoiceNumber() {
    final next = _receipts.length + 1;
    return 'INV-${next.toString().padLeft(4, '0')}';
  }

  void seedMockReceipts() {
    final patients = _patients.patients;
    if (patients.isEmpty) {
      return;
    }
    PatientModel p(int i) => patients[i % patients.length];
    final now = DateTime.now();

    _receipts.assignAll([
      BillingReceiptModel(
        id: 'inv-1',
        invoiceNumber: 'INV-0001',
        patientId: p(0).id,
        patientName: p(0).fullName,
        patientPhone: p(0).phone,
        createdAt: now.subtract(const Duration(days: 2)),
        paymentMode: 'Cash',
        discountAmount: 100,
        paidAmount: 900,
        items: const [
          BillingLineItemModel(label: 'Consultation', qty: 1, price: 500),
          BillingLineItemModel(label: 'Medicine', qty: 2, price: 250),
        ],
      ),
      BillingReceiptModel(
        id: 'inv-2',
        invoiceNumber: 'INV-0002',
        patientId: p(2).id,
        patientName: p(2).fullName,
        patientPhone: p(2).phone,
        createdAt: now.subtract(const Duration(days: 5)),
        paymentMode: 'UPI',
        discountAmount: 0,
        paidAmount: 600,
        items: const [
          BillingLineItemModel(label: 'Follow-up visit', qty: 1, price: 600),
        ],
      ),
    ]);
  }
}
