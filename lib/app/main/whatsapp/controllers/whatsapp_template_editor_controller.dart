import 'package:doctors_clinic/app/main/whatsapp/data/whatsapp_repository.dart';
import 'package:doctors_clinic/app/main/whatsapp/models/whatsapp_template_model.dart';
import 'package:doctors_clinic/app/main/whatsapp/whatsapp_route_arguments.dart';
import 'package:doctors_clinic/constants/string_constants.dart';
import 'package:doctors_clinic/utils/ui_utils/app_toast.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WhatsAppTemplateEditorController extends GetxController {
  final titleController = TextEditingController();
  final bodyController = TextEditingController();
  final isActive = true.obs;
  final isDefault = false.obs;
  final isSaving = false.obs;

  late String _templateId;
  WhatsAppTemplateModel? _template;

  WhatsAppRepository get _repo => Get.find<WhatsAppRepository>();

  @override
  void onInit() {
    super.onInit();
    _templateId = Get.arguments?[WhatsAppRouteArgs.templateId] as String? ?? '';
    _loadTemplate();
  }

  @override
  void onClose() {
    titleController.dispose();
    bodyController.dispose();
    super.onClose();
  }

  void _loadTemplate() {
    final t = _repo.findTemplateById(_templateId);
    if (t == null) {
      Get.back();
      return;
    }
    _template = t;
    titleController.text = t.title;
    bodyController.text = t.body;
    isActive.value = t.isActive;
    isDefault.value = t.isDefault;
  }

  void onToggleActive(bool value) => isActive.value = value;
  void onToggleDefault(bool value) => isDefault.value = value;

  void onInsertVariable(String variable) {
    final text = bodyController.text;
    bodyController.text = text.isEmpty ? variable : '$text $variable';
    bodyController.selection = TextSelection.collapsed(
      offset: bodyController.text.length,
    );
  }

  Future<void> onSave() async {
    final template = _template;
    if (template == null || isSaving.value) {
      return;
    }
    if (titleController.text.trim().isEmpty ||
        bodyController.text.trim().isEmpty) {
      showAppToast(
        kWhatsAppTemplateEditorTitle,
        kWhatsAppValidationTemplateRequired,
        snackPosition: SnackPosition.BOTTOM,
        margin: const EdgeInsets.all(16),
      );
      return;
    }

    try {
      isSaving.value = true;
      await Future<void>.delayed(const Duration(milliseconds: 300));
      _repo.updateTemplate(
        template.copyWith(
          title: titleController.text.trim(),
          body: bodyController.text.trim(),
          isActive: isActive.value,
          isDefault: isDefault.value,
        ),
      );
      Get.back();
      showAppToast(
        kWhatsAppTemplatesTitle,
        kWhatsAppTemplateSaved,
        snackPosition: SnackPosition.BOTTOM,
        margin: const EdgeInsets.all(16),
      );
    } finally {
      isSaving.value = false;
    }
  }
}
