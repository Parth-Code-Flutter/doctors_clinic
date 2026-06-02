import 'package:doctors_clinic/app/main/queue/data/queue_repository.dart';
import 'package:doctors_clinic/app/main/queue/models/queue_token_model.dart';
import 'package:doctors_clinic/app/main/queue/models/queue_token_status.dart';
import 'package:doctors_clinic/app/main/queue/queue_route_arguments.dart';
import 'package:doctors_clinic/constants/string_constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class QueueTokenDetailController extends GetxController {
  final token = Rxn<QueueTokenModel>();
  final notesController = TextEditingController();
  final isSavingNotes = false.obs;

  late String _queueTokenId;

  QueueRepository get _repo => Get.find<QueueRepository>();

  @override
  void onInit() {
    super.onInit();
    _queueTokenId = Get.arguments?[QueueRouteArgs.queueTokenId] as String? ?? '';
    _loadToken();
  }

  @override
  void onClose() {
    notesController.dispose();
    super.onClose();
  }

  void _loadToken() {
    final found = _repo.findById(_queueTokenId);
    if (found == null) {
      Get.back();
      return;
    }
    token.value = found;
    notesController.text = found.notes ?? '';
  }

  void _updateStatus(QueueTokenStatus status) {
    _repo.updateStatus(_queueTokenId, status);
    _loadToken();
    Get.snackbar(
      kQueueDetailTitle,
      kQueueStatusUpdatedMessage,
      snackPosition: SnackPosition.BOTTOM,
      margin: const EdgeInsets.all(16),
      duration: const Duration(seconds: 2),
    );
  }

  void onMarkWithDoctor() => _updateStatus(QueueTokenStatus.withDoctor);
  void onMarkCompleted() => _updateStatus(QueueTokenStatus.completed);
  void onMarkSkipped() => _updateStatus(QueueTokenStatus.skipped);
  void onMarkWaiting() => _updateStatus(QueueTokenStatus.waiting);

  Future<void> onSaveNotes() async {
    if (isSavingNotes.value) {
      return;
    }
    try {
      isSavingNotes.value = true;
      await Future<void>.delayed(const Duration(milliseconds: 200));
      _repo.updateNotes(_queueTokenId, notesController.text);
      _loadToken();
      Get.snackbar(
        kQueueDetailTitle,
        kQueueNotesSavedMessage,
        snackPosition: SnackPosition.BOTTOM,
        margin: const EdgeInsets.all(16),
        duration: const Duration(seconds: 2),
      );
    } finally {
      isSavingNotes.value = false;
    }
  }
}
