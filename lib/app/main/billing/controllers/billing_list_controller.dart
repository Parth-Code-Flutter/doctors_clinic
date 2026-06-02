import 'package:doctors_clinic/app/main/billing/billing_route_arguments.dart';
import 'package:doctors_clinic/app/main/billing/data/billing_repository.dart';
import 'package:doctors_clinic/app/main/billing/models/billing_receipt_model.dart';
import 'package:doctors_clinic/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BillingListController extends GetxController {
  final searchController = TextEditingController();
  final searchQuery = ''.obs;

  BillingRepository get _repo => Get.find<BillingRepository>();

  List<BillingReceiptModel> get receipts => _repo.search(searchQuery.value);
  int get totalInvoices => _repo.receipts.length;
  double get totalCollected =>
      _repo.receipts.fold(0, (sum, item) => sum + item.paidAmount);
  double get totalDue =>
      _repo.receipts.fold(0, (sum, item) => sum + item.dueAmount);

  @override
  void onInit() {
    super.onInit();
    searchController.addListener(
      () => searchQuery.value = searchController.text,
    );
  }

  @override
  void onClose() {
    searchController.dispose();
    super.onClose();
  }

  void refreshList() {
    searchQuery.refresh();
  }

  Future<void> onCreateReceipt() async {
    final result = await Get.toNamed(Routes.BILLING_EDITOR);
    if (result == true) {
      refreshList();
    }
  }

  Future<void> onReceiptTap(BillingReceiptModel receipt) async {
    await Get.toNamed(
      Routes.BILLING_DETAIL,
      arguments: {BillingRouteArgs.receiptId: receipt.id},
    );
    refreshList();
  }
}
