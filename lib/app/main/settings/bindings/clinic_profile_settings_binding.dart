import 'package:get/get.dart';

import '../controllers/clinic_profile_settings_controller.dart';

class ClinicProfileSettingsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ClinicProfileSettingsController>(
      () => ClinicProfileSettingsController(),
    );
  }
}
