import 'package:doctors_clinic/app/main/visits/data/visit_repository.dart';
import 'package:get/get.dart';

import '../controllers/visit_detail_controller.dart';

class VisitDetailBinding extends Bindings {
  @override
  void dependencies() {
    if (!Get.isRegistered<VisitRepository>()) {
      Get.put(VisitRepository(), permanent: true);
    }
    Get.lazyPut<VisitDetailController>(() => VisitDetailController());
  }
}
