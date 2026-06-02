import 'package:doctors_clinic/app/main/queue/data/queue_repository.dart';
import 'package:doctors_clinic/app/main/queue/models/queue_token_model.dart';
import 'package:doctors_clinic/app/main/queue/queue_route_arguments.dart';
import 'package:doctors_clinic/constants/string_constants.dart';
import 'package:doctors_clinic/routes/app_pages.dart';
import 'package:doctors_clinic/utils/ui_utils/app_toast.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class QueueListController extends GetxController {
  final searchController = TextEditingController();
  final searchQuery = ''.obs;
  final activeFilter = QueueListFilter.waiting.obs;

  QueueRepository get _repo => Get.find<QueueRepository>();

  int get waitingCount => _repo.countForFilter(QueueListFilter.waiting);
  int get withDoctorCount => _repo.countForFilter(QueueListFilter.withDoctor);
  int get completedCount => _repo.countForFilter(QueueListFilter.completed);
  int get skippedCount => _repo.countForFilter(QueueListFilter.skipped);

  List<QueueTokenModel> get filteredTokens {
    return _repo.searchAndFilter(
      query: searchQuery.value,
      filter: activeFilter.value,
    );
  }

  @override
  void onInit() {
    super.onInit();
    searchController.addListener(() {
      searchQuery.value = searchController.text;
    });
  }

  @override
  void onClose() {
    searchController.dispose();
    super.onClose();
  }

  void onFilterSelected(QueueListFilter filter) {
    activeFilter.value = filter;
  }

  void refreshList() {
    searchQuery.refresh();
  }

  Future<void> onAddToken() async {
    final result = await Get.toNamed(Routes.QUEUE_ADD);
    if (result == true) {
      refreshList();
      showAppToast(
        kQueueTitle,
        kQueueTokenCreatedMessage,
        snackPosition: SnackPosition.BOTTOM,
        margin: const EdgeInsets.all(16),
        duration: const Duration(seconds: 2),
      );
    }
  }

  Future<void> onOpenBoard() async {
    await Get.toNamed(Routes.QUEUE_BOARD);
    refreshList();
  }

  Future<void> onTokenTap(QueueTokenModel token) async {
    await Get.toNamed(
      Routes.QUEUE_DETAIL,
      arguments: {QueueRouteArgs.queueTokenId: token.id},
    );
    refreshList();
  }
}
