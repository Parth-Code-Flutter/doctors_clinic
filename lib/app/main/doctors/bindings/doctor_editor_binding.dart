import 'package:doctors_clinic/app/main/doctors/controllers/doctor_editor_controller.dart';
import 'package:doctors_clinic/app/main/doctors/data/doctor_repository.dart';
import 'package:get/get.dart';

class DoctorEditorBinding extends Bindings {
  @override
  void dependencies() {
    if (!Get.isRegistered<DoctorRepository>()) {
      Get.put(DoctorRepository(), permanent: true);
    }
    Get.lazyPut<DoctorEditorController>(() => DoctorEditorController());
  }
}
