import 'package:doctors_clinic/app/main/whatsapp/data/whatsapp_repository.dart';
import 'package:doctors_clinic/app/main/whatsapp/models/whatsapp_template_model.dart';
import 'package:doctors_clinic/app/main/whatsapp/whatsapp_route_arguments.dart';
import 'package:doctors_clinic/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WhatsAppTemplatesController extends GetxController {
  final searchController = TextEditingController();
  final searchQuery = ''.obs;

  WhatsAppRepository get _repo => Get.find<WhatsAppRepository>();

  List<WhatsAppTemplateModel> get filteredTemplates =>
      _repo.searchTemplates(searchQuery.value);

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

  void onEditTemplate(WhatsAppTemplateModel template) {
    Get.toNamed(
      Routes.WHATSAPP_TEMPLATE_EDITOR,
      arguments: {WhatsAppRouteArgs.templateId: template.id},
    )?.then((_) => searchQuery.refresh());
  }
}
