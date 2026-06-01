import 'package:doctors_clinic/app/main/appointments/controllers/appointments_tab_controller.dart';
import 'package:doctors_clinic/app/main/appointments/data/appointment_repository.dart';
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
    Get.lazyPut<BottomNavController>(() => BottomNavController(), fenix: true);
    Get.lazyPut<DashboardController>(() => DashboardController(), fenix: true);
    Get.lazyPut<PatientsTabController>(() => PatientsTabController(), fenix: true);
    Get.lazyPut<AppointmentsTabController>(
      () => AppointmentsTabController(),
      fenix: true,
    );
    Get.lazyPut<MoreTabController>(() => MoreTabController(), fenix: true);
  }
}
