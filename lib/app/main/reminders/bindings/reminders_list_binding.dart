import 'package:get/get.dart';

import '../controllers/reminders_list_controller.dart';

class RemindersListBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RemindersListController>(() => RemindersListController());
  }
}
