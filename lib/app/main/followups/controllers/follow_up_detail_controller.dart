import 'package:doctors_clinic/app/main/followups/data/follow_up_repository.dart';
import 'package:doctors_clinic/app/main/followups/follow_up_route_arguments.dart';
import 'package:doctors_clinic/app/main/followups/models/follow_up_model.dart';
import 'package:doctors_clinic/constants/string_constants.dart';
import 'package:doctors_clinic/routes/app_pages.dart';
import 'package:doctors_clinic/utils/ui_utils/app_toast.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FollowUpDetailController extends GetxController {
  final item = Rxn<FollowUpModel>();
  late String _followUpId;

  FollowUpRepository get _repo => Get.find<FollowUpRepository>();

  @override
  void onInit() {
    super.onInit();
    _followUpId = Get.arguments?[FollowUpRouteArgs.followUpId] as String? ?? '';
    load();
  }

  void load() {
    final found = _repo.findById(_followUpId);
    if (found == null) {
      Get.back();
      return;
    }
    item.value = found;
  }

  Future<void> onEdit() async {
    final result = await Get.toNamed(
      Routes.FOLLOW_UP_EDITOR,
      arguments: {FollowUpRouteArgs.followUpId: _followUpId},
    );
    if (result == true) {
      load();
    }
  }

  void onMarkCompleted() {
    _repo.markCompleted(_followUpId);
    load();
    showAppToast(
      kFollowUpTitle,
      kFollowUpMarkedCompletedMessage,
      snackPosition: SnackPosition.BOTTOM,
      margin: const EdgeInsets.all(16),
    );
  }

  void onMarkMissed() {
    _repo.markMissed(_followUpId);
    load();
    showAppToast(
      kFollowUpTitle,
      kFollowUpMarkedMissedMessage,
      snackPosition: SnackPosition.BOTTOM,
      margin: const EdgeInsets.all(16),
    );
  }
}
