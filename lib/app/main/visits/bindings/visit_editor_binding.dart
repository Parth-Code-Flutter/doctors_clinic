import 'package:doctors_clinic/app/main/appointments/data/appointment_repository.dart';
import 'package:doctors_clinic/app/main/patients/data/patient_repository.dart';
import 'package:doctors_clinic/app/main/visits/data/visit_repository.dart';
import 'package:get/get.dart';

import '../controllers/visit_editor_controller.dart';

class VisitEditorBinding extends Bindings {
  @override
  void dependencies() {
    if (!Get.isRegistered<PatientRepository>()) {
      Get.put(PatientRepository(), permanent: true);
    }
    if (!Get.isRegistered<AppointmentRepository>()) {
      Get.put(AppointmentRepository(), permanent: true);
    }
    if (!Get.isRegistered<VisitRepository>()) {
      Get.put(VisitRepository(), permanent: true);
    }
    Get.lazyPut<VisitEditorController>(() => VisitEditorController());
  }
}
