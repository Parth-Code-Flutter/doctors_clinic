import 'package:doctors_clinic/app/main/billing/controllers/billing_detail_controller.dart';
import 'package:doctors_clinic/app/main/billing/data/billing_repository.dart';
import 'package:get/get.dart';

class BillingDetailBinding extends Bindings {
  @override
  void dependencies() {
    if (!Get.isRegistered<BillingRepository>()) {
      Get.put(BillingRepository(), permanent: true);
    }
    Get.lazyPut<BillingDetailController>(() => BillingDetailController());
  }
}
