import 'package:doctors_clinic/app/main/appointments/controllers/appointments_tab_controller.dart';
import 'package:doctors_clinic/app/main/appointments/data/appointment_repository.dart';
import 'package:doctors_clinic/app/main/queue/data/queue_repository.dart';
import 'package:doctors_clinic/app/main/reminders/data/reminder_repository.dart';
import 'package:doctors_clinic/app/main/settings/data/clinic_settings_repository.dart';
import 'package:doctors_clinic/app/main/visits/data/visit_repository.dart';
import 'package:doctors_clinic/app/main/whatsapp/data/whatsapp_repository.dart';
import 'package:doctors_clinic/app/main/billing/data/billing_repository.dart';
import 'package:doctors_clinic/app/main/followups/data/follow_up_repository.dart';
import 'package:doctors_clinic/app/main/staff/data/staff_repository.dart';
import 'package:doctors_clinic/app/main/dashboard/controllers/dashboard_controller.dart';
import 'package:doctors_clinic/app/main/more/controllers/more_tab_controller.dart';
import 'package:doctors_clinic/app/main/patients/controllers/patients_tab_controller.dart';
import 'package:doctors_clinic/app/main/patients/data/patient_repository.dart';
import 'package:get/get.dart';

import '../controllers/bottom_nav_controller.dart';

class BottomNavBinding extends Bindings {
  @override
  void dependencies() {
    if (!Get.isRegistered<PatientRepository>()) {
      Get.put(PatientRepository(), permanent: true);
    }
    if (!Get.isRegistered<AppointmentRepository>()) {
      Get.put(AppointmentRepository(), permanent: true);
    }
    if (!Get.isRegistered<ClinicSettingsRepository>()) {
      Get.put(ClinicSettingsRepository(), permanent: true);
    }
    if (!Get.isRegistered<ReminderRepository>()) {
      Get.put(ReminderRepository(), permanent: true);
    }
    if (!Get.isRegistered<QueueRepository>()) {
      Get.put(QueueRepository(), permanent: true);
    }
    if (!Get.isRegistered<WhatsAppRepository>()) {
      Get.put(WhatsAppRepository(), permanent: true);
    }
    if (!Get.isRegistered<VisitRepository>()) {
      Get.put(VisitRepository(), permanent: true);
    }
    if (!Get.isRegistered<BillingRepository>()) {
      Get.put(BillingRepository(), permanent: true);
    }
    if (!Get.isRegistered<FollowUpRepository>()) {
      Get.put(FollowUpRepository(), permanent: true);
    }
    if (!Get.isRegistered<StaffRepository>()) {
      Get.put(StaffRepository(), permanent: true);
    }
    Get.lazyPut<BottomNavController>(() => BottomNavController(), fenix: true);
    Get.lazyPut<DashboardController>(() => DashboardController(), fenix: true);
    Get.lazyPut<PatientsTabController>(
      () => PatientsTabController(),
      fenix: true,
    );
    Get.lazyPut<AppointmentsTabController>(
      () => AppointmentsTabController(),
      fenix: true,
    );
    Get.lazyPut<MoreTabController>(() => MoreTabController(), fenix: true);
  }
}
