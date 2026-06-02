import 'package:doctors_clinic/app/main/staff/data/staff_repository.dart';
import 'package:doctors_clinic/app/main/staff/models/staff_member_model.dart';
import 'package:doctors_clinic/app/main/staff/models/staff_role.dart';
import 'package:doctors_clinic/app/main/staff/models/staff_status.dart';
import 'package:doctors_clinic/app/main/staff/staff_route_arguments.dart';
import 'package:doctors_clinic/constants/string_constants.dart';
import 'package:doctors_clinic/utils/ui_utils/app_toast.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class StaffEditorController extends GetxController {
  final nameController = TextEditingController();
  final phoneController = TextEditingController();
  final emailController = TextEditingController();
  final shiftController = TextEditingController();
  final permissionsController = TextEditingController();
  final notesController = TextEditingController();

  final selectedRole = StaffRole.receptionist.obs;
  final selectedStatus = StaffStatus.active.obs;
  final isSaving = false.obs;

  String? _staffId;

  StaffRepository get _repo => Get.find<StaffRepository>();

  List<StaffRole> get roles => StaffRole.values;
  List<StaffStatus> get statuses => StaffStatus.values;

  @override
  void onInit() {
    super.onInit();
    _staffId = Get.arguments?[StaffRouteArgs.staffId] as String?;
    _seed();
  }

  @override
  void onClose() {
    nameController.dispose();
    phoneController.dispose();
    emailController.dispose();
    shiftController.dispose();
    permissionsController.dispose();
    notesController.dispose();
    super.onClose();
  }

  void _seed() {
    if (_staffId == null) {
      return;
    }
    final member = _repo.findById(_staffId!);
    if (member == null) {
      return;
    }
    nameController.text = member.fullName;
    phoneController.text = member.phone;
    emailController.text = member.email ?? '';
    shiftController.text = member.shiftLabel ?? '';
    permissionsController.text = member.permissionsSummary ?? '';
    notesController.text = member.notes ?? '';
    selectedRole.value = member.role;
    selectedStatus.value = member.status;
  }

  void onRoleChanged(StaffRole? role) {
    if (role == null) {
      return;
    }
    selectedRole.value = role;
  }

  void onStatusChanged(StaffStatus? status) {
    if (status == null) {
      return;
    }
    selectedStatus.value = status;
  }

  Future<void> onSave() async {
    if (isSaving.value) {
      return;
    }
    final name = nameController.text.trim();
    final phone = phoneController.text.trim();
    if (name.isEmpty || phone.isEmpty) {
      showAppToast(
        kStaffEditorTitle,
        kStaffValidationNamePhoneRequired,
        snackPosition: SnackPosition.BOTTOM,
        margin: const EdgeInsets.all(16),
      );
      return;
    }
    if (!RegExp(r'^\d{10}$').hasMatch(phone)) {
      showAppToast(
        kStaffEditorTitle,
        kStaffValidationPhoneInvalid,
        snackPosition: SnackPosition.BOTTOM,
        margin: const EdgeInsets.all(16),
      );
      return;
    }

    try {
      isSaving.value = true;
      await Future<void>.delayed(const Duration(milliseconds: 350));
      final existing = _staffId != null ? _repo.findById(_staffId!) : null;
      final member = StaffMemberModel(
        id: existing?.id ?? _repo.newId(),
        fullName: name,
        phone: phone,
        role: selectedRole.value,
        status: selectedStatus.value,
        joinedAt: existing?.joinedAt ?? DateTime.now(),
        email: emailController.text.trim().isEmpty
            ? null
            : emailController.text.trim(),
        shiftLabel: shiftController.text.trim().isEmpty
            ? null
            : shiftController.text.trim(),
        permissionsSummary: permissionsController.text.trim().isEmpty
            ? null
            : permissionsController.text.trim(),
        notes: notesController.text.trim().isEmpty
            ? null
            : notesController.text.trim(),
      );
      _repo.save(member);
      Get.back(result: true);
      showAppToast(
        kStaffEditorTitle,
        kStaffSavedMessage,
        snackPosition: SnackPosition.BOTTOM,
        margin: const EdgeInsets.all(16),
      );
    } finally {
      isSaving.value = false;
    }
  }
}
