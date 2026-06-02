import 'package:doctors_clinic/app/main/billing/billing_route_arguments.dart';
import 'package:doctors_clinic/app/main/billing/data/billing_repository.dart';
import 'package:doctors_clinic/app/main/billing/models/billing_receipt_model.dart';
import 'package:doctors_clinic/constants/string_constants.dart';
import 'package:doctors_clinic/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BillingDetailController extends GetxController {
  final receipt = Rxn<BillingReceiptModel>();

  late String _receiptId;

  BillingRepository get _repo => Get.find<BillingRepository>();

  @override
  void onInit() {
    super.onInit();
    _receiptId = Get.arguments?[BillingRouteArgs.receiptId] as String? ?? '';
    loadReceipt();
  }

  void loadReceipt() {
    final found = _repo.findById(_receiptId);
    if (found == null) {
      Get.back();
      return;
    }
    receipt.value = found;
  }

  Future<void> onEdit() async {
    final result = await Get.toNamed(
      Routes.BILLING_EDITOR,
      arguments: {BillingRouteArgs.receiptId: _receiptId},
    );
    if (result == true) {
      loadReceipt();
    }
  }

  void onShare() {
    Get.snackbar(
      kBillingDetailTitle,
      kBillingShareMockMessage,
      snackPosition: SnackPosition.BOTTOM,
      margin: const EdgeInsets.all(16),
    );
  }
}
