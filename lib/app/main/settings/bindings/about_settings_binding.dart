import 'package:get/get.dart';

import '../controllers/about_settings_controller.dart';

class AboutSettingsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AboutSettingsController>(() => AboutSettingsController());
  }
}
