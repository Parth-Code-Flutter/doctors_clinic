import 'package:doctors_clinic/app/main/billing/billing_route_arguments.dart';
import 'package:doctors_clinic/app/main/billing/data/billing_repository.dart';
import 'package:doctors_clinic/app/main/billing/models/billing_line_item_model.dart';
import 'package:doctors_clinic/app/main/billing/models/billing_receipt_model.dart';
import 'package:doctors_clinic/app/main/patients/data/patient_repository.dart';
import 'package:doctors_clinic/app/main/patients/models/patient_model.dart';
import 'package:doctors_clinic/app/main/visits/data/visit_repository.dart';
import 'package:doctors_clinic/constants/string_constants.dart';
import 'package:doctors_clinic/utils/ui_utils/app_toast.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BillingEditorController extends GetxController {
  final serviceController = TextEditingController();
  final qtyController = TextEditingController(text: '1');
  final priceController = TextEditingController();
  final discountController = TextEditingController(text: '0');
  final paidController = TextEditingController(text: '0');
  final noteController = TextEditingController();

  final selectedPatientId = RxnString();
  final selectedPaymentMode = 'Cash'.obs;
  final lineItems = <BillingLineItemModel>[].obs;
  final isSaving = false.obs;

  String? _receiptId;
  String? _visitId;

  BillingRepository get _repo => Get.find<BillingRepository>();
  PatientRepository get _patientRepo => Get.find<PatientRepository>();
  VisitRepository get _visitRepo => Get.find<VisitRepository>();

  List<PatientModel> get patients => _patientRepo.patients;
  List<String> get paymentModes => kBillingPaymentModes;

  double get subTotal => lineItems.fold(0, (sum, i) => sum + i.total);
  double get discount => _toDouble(discountController.text);
  double get total => (subTotal - discount).clamp(0, double.infinity);
  double get paid => _toDouble(paidController.text);
  double get due => (total - paid).clamp(0, double.infinity);

  @override
  void onInit() {
    super.onInit();
    _receiptId = Get.arguments?[BillingRouteArgs.receiptId] as String?;
    _visitId = Get.arguments?[BillingRouteArgs.visitId] as String?;
    final patientId = Get.arguments?[BillingRouteArgs.patientId] as String?;
    _setInitialData(patientId: patientId);
  }

  @override
  void onClose() {
    serviceController.dispose();
    qtyController.dispose();
    priceController.dispose();
    discountController.dispose();
    paidController.dispose();
    noteController.dispose();
    super.onClose();
  }

  void _setInitialData({String? patientId}) {
    if (_receiptId != null) {
      final receipt = _repo.findById(_receiptId!);
      if (receipt == null) {
        return;
      }
      selectedPatientId.value = receipt.patientId;
      selectedPaymentMode.value = receipt.paymentMode;
      lineItems.assignAll(receipt.items);
      discountController.text = receipt.discountAmount.toStringAsFixed(0);
      paidController.text = receipt.paidAmount.toStringAsFixed(0);
      noteController.text = receipt.note ?? '';
      return;
    }

    if (_visitId != null) {
      final visit = _visitRepo.findById(_visitId!);
      if (visit != null) {
        selectedPatientId.value = visit.patientId;
        serviceController.text = visit.diagnosis ?? 'Visit consultation';
      }
      final existing = _repo.findByVisitId(_visitId!);
      if (existing != null) {
        _receiptId = existing.id;
        _setInitialData();
      }
      return;
    }

    if (patientId != null && _patientRepo.findById(patientId) != null) {
      selectedPatientId.value = patientId;
    }
  }

  void onPatientChanged(String? id) {
    selectedPatientId.value = id;
  }

  void onPaymentModeChanged(String? mode) {
    if (mode == null) {
      return;
    }
    selectedPaymentMode.value = mode;
  }

  void onAddLineItem() {
    final label = serviceController.text.trim();
    final qty = int.tryParse(qtyController.text.trim()) ?? 0;
    final price = _toDouble(priceController.text);
    if (label.isEmpty || qty <= 0 || price <= 0) {
      showAppToast(
        kBillingEditorTitle,
        kBillingValidationLineRequired,
        snackPosition: SnackPosition.BOTTOM,
        margin: const EdgeInsets.all(16),
      );
      return;
    }
    lineItems.add(BillingLineItemModel(label: label, qty: qty, price: price));
    serviceController.clear();
    qtyController.text = '1';
    priceController.clear();
  }

  void onRemoveLineItem(int index) {
    if (index < 0 || index >= lineItems.length) {
      return;
    }
    lineItems.removeAt(index);
  }

  Future<void> onSave() async {
    if (isSaving.value) {
      return;
    }
    final patientId = selectedPatientId.value;
    if (patientId == null) {
      showAppToast(
        kBillingEditorTitle,
        kBillingValidationPatientRequired,
        snackPosition: SnackPosition.BOTTOM,
        margin: const EdgeInsets.all(16),
      );
      return;
    }
    if (lineItems.isEmpty) {
      showAppToast(
        kBillingEditorTitle,
        kBillingValidationNoItems,
        snackPosition: SnackPosition.BOTTOM,
        margin: const EdgeInsets.all(16),
      );
      return;
    }
    final patient = _patientRepo.findById(patientId);
    if (patient == null) {
      return;
    }

    try {
      isSaving.value = true;
      await Future<void>.delayed(const Duration(milliseconds: 350));
      _repo.save(
        BillingReceiptModel(
          id: _receiptId ?? _repo.newId(),
          invoiceNumber: _receiptId == null
              ? _repo.newInvoiceNumber()
              : (_repo.findById(_receiptId!)?.invoiceNumber ??
                    _repo.newInvoiceNumber()),
          patientId: patient.id,
          patientName: patient.fullName,
          patientPhone: patient.phone,
          createdAt: DateTime.now(),
          items: List<BillingLineItemModel>.from(lineItems),
          discountAmount: discount,
          paidAmount: paid,
          paymentMode: selectedPaymentMode.value,
          visitId: _visitId,
          note: noteController.text.trim().isEmpty
              ? null
              : noteController.text.trim(),
        ),
      );
      Get.back(result: true);
      showAppToast(
        kBillingEditorTitle,
        kBillingSavedMessage,
        snackPosition: SnackPosition.BOTTOM,
        margin: const EdgeInsets.all(16),
      );
    } finally {
      isSaving.value = false;
    }
  }

  double _toDouble(String value) => double.tryParse(value.trim()) ?? 0;
}
