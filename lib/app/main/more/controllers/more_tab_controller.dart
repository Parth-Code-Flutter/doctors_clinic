import 'package:doctors_clinic/routes/app_pages.dart';
import 'package:get/get.dart';

class MoreTabController extends GetxController {
  void onLogout() {
    Get.offAllNamed(Routes.WELCOME);
  }
}
