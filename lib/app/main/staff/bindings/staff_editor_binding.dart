import 'package:doctors_clinic/app/main/staff/controllers/staff_editor_controller.dart';
import 'package:doctors_clinic/app/main/staff/data/staff_repository.dart';
import 'package:get/get.dart';

class StaffEditorBinding extends Bindings {
  @override
  void dependencies() {
    if (!Get.isRegistered<StaffRepository>()) {
      Get.put(StaffRepository(), permanent: true);
    }
    Get.lazyPut<StaffEditorController>(() => StaffEditorController());
  }
}
