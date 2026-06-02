import 'package:doctors_clinic/app/main/billing/controllers/billing_list_controller.dart';
import 'package:doctors_clinic/app/main/billing/data/billing_repository.dart';
import 'package:get/get.dart';

class BillingListBinding extends Bindings {
  @override
  void dependencies() {
    if (!Get.isRegistered<BillingRepository>()) {
      Get.put(BillingRepository(), permanent: true);
    }
    Get.lazyPut<BillingListController>(() => BillingListController());
  }
}
