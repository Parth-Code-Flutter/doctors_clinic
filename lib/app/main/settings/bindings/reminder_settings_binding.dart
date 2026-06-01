import 'package:get/get.dart';

import '../controllers/reminder_settings_controller.dart';

class ReminderSettingsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ReminderSettingsController>(() => ReminderSettingsController());
  }
}
