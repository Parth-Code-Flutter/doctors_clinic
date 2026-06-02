import 'package:doctors_clinic/app/main/settings/data/clinic_settings_repository.dart';
import 'package:doctors_clinic/constants/string_constants.dart';
import 'package:doctors_clinic/routes/app_pages.dart';
import 'package:get/get.dart';

class MoreTabController extends GetxController {
  ClinicSettingsRepository get _repo => Get.find<ClinicSettingsRepository>();

  String get reminderMenuSubtitle {
    final s = _repo.settings.value;
    final timing = kDefaultReminderOptions[s.defaultReminderIndex];
    final channel = kReminderChannelOptions[s.reminderChannelIndex];
    return '$timing · $channel';
  }

  void onClinicProfile() => Get.toNamed(Routes.SETTINGS_CLINIC_PROFILE);

  void onQueue() => Get.toNamed(Routes.QUEUE_LIST);

  void onWhatsApp() => Get.toNamed(Routes.WHATSAPP_HUB);

  void onBilling() => Get.toNamed(Routes.BILLING_LIST);

  void onFollowUps() => Get.toNamed(Routes.FOLLOW_UP_LIST);

  void onStaff() => Get.toNamed(Routes.STAFF_LIST);

  void onRemindersList() => Get.toNamed(Routes.REMINDERS_LIST);

  void onReminderSettings() => Get.toNamed(Routes.SETTINGS_REMINDERS);

  void onAccount() => Get.toNamed(Routes.SETTINGS_ACCOUNT);

  void onAbout() => Get.toNamed(Routes.SETTINGS_ABOUT);

  void onLogout() => Get.offAllNamed(Routes.WELCOME);
}
