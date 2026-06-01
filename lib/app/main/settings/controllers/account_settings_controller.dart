import 'package:doctors_clinic/app/main/settings/data/clinic_settings_repository.dart';
import 'package:doctors_clinic/routes/app_pages.dart';
import 'package:get/get.dart';

class AccountSettingsController extends GetxController {
  ClinicSettingsRepository get _repo => Get.find<ClinicSettingsRepository>();

  String get accountEmail => _repo.settings.value.email;

  void onChangePassword() {
    Get.toNamed(Routes.AUTH_RESET_PASSWORD);
  }

  void onLogout() {
    Get.offAllNamed(Routes.WELCOME);
  }
}
