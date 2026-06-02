import 'package:get/get.dart';
import 'package:doctors_clinic/app/main/patients/data/patient_repository.dart';
import 'package:doctors_clinic/app/main/queue/data/queue_repository.dart';

import '../controllers/add_queue_token_controller.dart';

class AddQueueTokenBinding extends Bindings {
  @override
  void dependencies() {
    if (!Get.isRegistered<PatientRepository>()) {
      Get.put(PatientRepository(), permanent: true);
    }
    if (!Get.isRegistered<QueueRepository>()) {
      Get.put(QueueRepository(), permanent: true);
    }
    Get.lazyPut<AddQueueTokenController>(() => AddQueueTokenController());
  }
}
