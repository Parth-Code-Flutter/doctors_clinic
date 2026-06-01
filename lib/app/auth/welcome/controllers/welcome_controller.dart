import 'package:doctors_clinic/routes/app_pages.dart';
import 'package:get/get.dart';

class WelcomeController extends GetxController {
  void onLoginToClinic() {
    Get.toNamed(Routes.AUTH_LOGIN);
  }

  void onOpenNewClinic() {
    Get.toNamed(Routes.OPEN_NEW_CLINIC);
  }
}
