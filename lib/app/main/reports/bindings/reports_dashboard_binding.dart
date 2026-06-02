import 'package:doctors_clinic/app/main/reports/controllers/reports_dashboard_controller.dart';
import 'package:doctors_clinic/app/main/reports/data/reports_repository.dart';
import 'package:get/get.dart';

class ReportsDashboardBinding extends Bindings {
  @override
  void dependencies() {
    if (!Get.isRegistered<ReportsRepository>()) {
      Get.put(ReportsRepository(), permanent: true);
    }
    Get.lazyPut<ReportsDashboardController>(() => ReportsDashboardController());
  }
}
