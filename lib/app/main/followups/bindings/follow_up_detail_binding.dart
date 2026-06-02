import 'package:doctors_clinic/app/main/followups/controllers/follow_up_detail_controller.dart';
import 'package:doctors_clinic/app/main/followups/data/follow_up_repository.dart';
import 'package:get/get.dart';

class FollowUpDetailBinding extends Bindings {
  @override
  void dependencies() {
    if (!Get.isRegistered<FollowUpRepository>()) {
      Get.put(FollowUpRepository(), permanent: true);
    }
    Get.lazyPut<FollowUpDetailController>(() => FollowUpDetailController());
  }
}
