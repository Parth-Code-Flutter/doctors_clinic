import 'package:doctors_clinic/app/main/staff/controllers/staff_detail_controller.dart';
import 'package:doctors_clinic/app/main/staff/data/staff_repository.dart';
import 'package:get/get.dart';

class StaffDetailBinding extends Bindings {
  @override
  void dependencies() {
    if (!Get.isRegistered<StaffRepository>()) {
      Get.put(StaffRepository(), permanent: true);
    }
    Get.lazyPut<StaffDetailController>(() => StaffDetailController());
  }
}
