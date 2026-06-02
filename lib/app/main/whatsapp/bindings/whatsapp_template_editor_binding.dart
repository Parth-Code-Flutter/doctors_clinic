import 'package:doctors_clinic/app/main/patients/data/patient_repository.dart';
import 'package:doctors_clinic/app/main/whatsapp/data/whatsapp_repository.dart';
import 'package:get/get.dart';

import '../controllers/whatsapp_template_editor_controller.dart';

class WhatsAppTemplateEditorBinding extends Bindings {
  @override
  void dependencies() {
    if (!Get.isRegistered<PatientRepository>()) {
      Get.put(PatientRepository(), permanent: true);
    }
    if (!Get.isRegistered<WhatsAppRepository>()) {
      Get.put(WhatsAppRepository(), permanent: true);
    }
    Get.lazyPut<WhatsAppTemplateEditorController>(
      () => WhatsAppTemplateEditorController(),
    );
  }
}
