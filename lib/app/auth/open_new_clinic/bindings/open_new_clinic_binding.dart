import 'package:get/get.dart';

import '../controllers/open_new_clinic_controller.dart';

class OpenNewClinicBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<OpenNewClinicController>(
      () => OpenNewClinicController(),
      fenix: true,
    );
  }
}
