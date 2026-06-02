import 'package:doctors_clinic/app/main/patients/data/patient_repository.dart';
import 'package:doctors_clinic/app/main/patients/models/patient_model.dart';
import 'package:doctors_clinic/app/main/whatsapp/data/whatsapp_repository.dart';
import 'package:doctors_clinic/app/main/whatsapp/models/whatsapp_template_model.dart';
import 'package:doctors_clinic/constants/string_constants.dart';
import 'package:doctors_clinic/utils/ui_utils/app_toast.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WhatsAppComposeController extends GetxController {
  final messageController = TextEditingController();
  final selectedPatientId = RxnString();
  final selectedTemplateId = RxnString();
  final isSending = false.obs;

  PatientRepository get _patientsRepo => Get.find<PatientRepository>();
  WhatsAppRepository get _repo => Get.find<WhatsAppRepository>();

  List<PatientModel> get patients => _patientsRepo.patients;
  List<WhatsAppTemplateModel> get templates => _repo.templates;

  PatientModel? get selectedPatient =>
      _patientsRepo.findById(selectedPatientId.value ?? '');
  WhatsAppTemplateModel? get selectedTemplate =>
      _repo.findTemplateById(selectedTemplateId.value ?? '');

  @override
  void onInit() {
    super.onInit();
    if (templates.isNotEmpty) {
      selectedTemplateId.value = templates.first.id;
      messageController.text = templates.first.body;
    }
  }

  @override
  void onClose() {
    messageController.dispose();
    super.onClose();
  }

  void onPatientChanged(String? patientId) {
    selectedPatientId.value = patientId;
  }

  void onTemplateChanged(String? templateId) {
    selectedTemplateId.value = templateId;
    final template = selectedTemplate;
    if (template != null) {
      messageController.text = template.body;
    }
  }

  Future<void> onSend() async {
    if (isSending.value) {
      return;
    }
    final patient = selectedPatient;
    final template = selectedTemplate;
    if (patient == null || template == null) {
      showAppToast(
        kWhatsAppComposeTitle,
        kWhatsAppValidationSelectionRequired,
        snackPosition: SnackPosition.BOTTOM,
        margin: const EdgeInsets.all(16),
      );
      return;
    }
    if (messageController.text.trim().isEmpty) {
      showAppToast(
        kWhatsAppComposeTitle,
        kWhatsAppValidationMessageRequired,
        snackPosition: SnackPosition.BOTTOM,
        margin: const EdgeInsets.all(16),
      );
      return;
    }

    try {
      isSending.value = true;
      await Future<void>.delayed(const Duration(milliseconds: 300));
      _repo.sendMessage(
        patient: patient,
        template: template,
        message: messageController.text,
      );
      Get.back();
      showAppToast(
        kWhatsAppTitle,
        kWhatsAppMessageQueued,
        snackPosition: SnackPosition.BOTTOM,
        margin: const EdgeInsets.all(16),
      );
    } finally {
      isSending.value = false;
    }
  }
}
