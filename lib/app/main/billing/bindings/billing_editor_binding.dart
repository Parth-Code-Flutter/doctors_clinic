import 'package:doctors_clinic/app/main/billing/controllers/billing_editor_controller.dart';
import 'package:doctors_clinic/app/main/billing/data/billing_repository.dart';
import 'package:doctors_clinic/app/main/patients/data/patient_repository.dart';
import 'package:doctors_clinic/app/main/visits/data/visit_repository.dart';
import 'package:get/get.dart';

class BillingEditorBinding extends Bindings {
  @override
  void dependencies() {
    if (!Get.isRegistered<PatientRepository>()) {
      Get.put(PatientRepository(), permanent: true);
    }
    if (!Get.isRegistered<VisitRepository>()) {
      Get.put(VisitRepository(), permanent: true);
    }
    if (!Get.isRegistered<BillingRepository>()) {
      Get.put(BillingRepository(), permanent: true);
    }
    Get.lazyPut<BillingEditorController>(() => BillingEditorController());
  }
}
