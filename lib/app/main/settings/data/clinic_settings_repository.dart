import 'package:doctors_clinic/app/main/settings/data/clinic_settings_model.dart';
import 'package:doctors_clinic/constants/string_constants.dart';
import 'package:get/get.dart';

class ClinicSettingsRepository extends GetxService {
  final settings = ClinicSettingsModel(
    clinicName: kDashboardMockClinicName,
    ownerName: kDashboardMockOwnerName,
    mobile: kSettingsMockMobile,
    email: kSettingsMockEmail,
    address: kSettingsMockAddress,
    city: kSettingsMockCity,
    state: kSettingsMockState,
    pincode: kSettingsMockPincode,
    clinicType: kSettingsMockClinicType,
    workingDays: kSettingsMockWorkingDays,
    workingHours: kSettingsMockWorkingHours,
    defaultReminderIndex: 2,
    reminderChannelIndex: 0,
    autoRemindersEnabled: true,
  ).obs;

  void updateProfile(ClinicSettingsModel updated) {
    settings.value = settings.value.copyWith(
      clinicName: updated.clinicName,
      ownerName: updated.ownerName,
      mobile: updated.mobile,
      email: updated.email,
      address: updated.address,
      city: updated.city,
      state: updated.state,
      pincode: updated.pincode,
      clinicType: updated.clinicType,
      workingDays: updated.workingDays,
      workingHours: updated.workingHours,
    );
  }

  void updateReminders({
    required int defaultReminderIndex,
    required int reminderChannelIndex,
    required bool autoRemindersEnabled,
  }) {
    settings.value = settings.value.copyWith(
      defaultReminderIndex: defaultReminderIndex,
      reminderChannelIndex: reminderChannelIndex,
      autoRemindersEnabled: autoRemindersEnabled,
    );
  }
}
