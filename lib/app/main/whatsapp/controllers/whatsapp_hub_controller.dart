import 'package:doctors_clinic/app/main/whatsapp/data/whatsapp_repository.dart';
import 'package:doctors_clinic/routes/app_pages.dart';
import 'package:get/get.dart';

class WhatsAppHubController extends GetxController {
  WhatsAppRepository get _repo => Get.find<WhatsAppRepository>();

  int get templateCount => _repo.templates.length;
  int get queuedCount => _repo.queuedCount;
  int get sentTodayCount => _repo.sentTodayCount;
  int get failedCount => _repo.failedCount;

  void onTemplates() => Get.toNamed(Routes.WHATSAPP_TEMPLATES);
  void onCompose() => Get.toNamed(Routes.WHATSAPP_COMPOSE);
  void onLogs() => Get.toNamed(Routes.WHATSAPP_LOGS);
}
