import 'package:get/get.dart';

import '../controllers/clinic_setup_controller.dart';

class ClinicSetupBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ClinicSetupController>(
      () => ClinicSetupController(),
      fenix: true,
    );
  }
}
