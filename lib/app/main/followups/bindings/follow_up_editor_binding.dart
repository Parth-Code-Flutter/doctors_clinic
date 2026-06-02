import 'package:doctors_clinic/app/main/followups/controllers/follow_up_editor_controller.dart';
import 'package:doctors_clinic/app/main/followups/data/follow_up_repository.dart';
import 'package:doctors_clinic/app/main/patients/data/patient_repository.dart';
import 'package:get/get.dart';

class FollowUpEditorBinding extends Bindings {
  @override
  void dependencies() {
    if (!Get.isRegistered<PatientRepository>()) {
      Get.put(PatientRepository(), permanent: true);
    }
    if (!Get.isRegistered<FollowUpRepository>()) {
      Get.put(FollowUpRepository(), permanent: true);
    }
    Get.lazyPut<FollowUpEditorController>(() => FollowUpEditorController());
  }
}
