import 'package:doctors_clinic/app/main/whatsapp/data/whatsapp_repository.dart';
import 'package:doctors_clinic/app/main/whatsapp/models/whatsapp_message_log_model.dart';
import 'package:doctors_clinic/constants/string_constants.dart';
import 'package:doctors_clinic/utils/ui_utils/app_toast.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WhatsAppLogsController extends GetxController {
  final searchController = TextEditingController();
  final searchQuery = ''.obs;

  WhatsAppRepository get _repo => Get.find<WhatsAppRepository>();

  int get queuedCount => _repo.queuedCount;
  int get sentTodayCount => _repo.sentTodayCount;
  int get failedCount => _repo.failedCount;

  List<WhatsAppMessageLogModel> get filteredLogs =>
      _repo.searchLogs(searchQuery.value);

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

  void onRetry(WhatsAppMessageLogModel log) {
    _repo.retry(log.id);
    searchQuery.refresh();
    showAppToast(
      kWhatsAppLogsTitle,
      kWhatsAppRetryQueued,
      snackPosition: SnackPosition.BOTTOM,
      margin: const EdgeInsets.all(16),
    );
  }
}
