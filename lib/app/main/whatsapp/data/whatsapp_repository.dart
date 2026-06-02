import 'package:doctors_clinic/app/main/patients/data/patient_repository.dart';
import 'package:doctors_clinic/app/main/patients/models/patient_model.dart';
import 'package:doctors_clinic/app/main/whatsapp/models/whatsapp_log_status.dart';
import 'package:doctors_clinic/app/main/whatsapp/models/whatsapp_message_log_model.dart';
import 'package:doctors_clinic/app/main/whatsapp/models/whatsapp_template_model.dart';
import 'package:doctors_clinic/app/main/whatsapp/models/whatsapp_template_type.dart';
import 'package:doctors_clinic/constants/string_constants.dart';
import 'package:get/get.dart';

class WhatsAppRepository extends GetxService {
  final _templates = <WhatsAppTemplateModel>[].obs;
  final _logs = <WhatsAppMessageLogModel>[].obs;

  PatientRepository get _patients => Get.find<PatientRepository>();

  List<WhatsAppTemplateModel> get templates => List.unmodifiable(_templates);
  List<WhatsAppMessageLogModel> get logs => List.unmodifiable(_logs);

  @override
  void onInit() {
    super.onInit();
    if (_templates.isEmpty) {
      seedMockData();
    }
  }

  WhatsAppTemplateModel? findTemplateById(String id) {
    for (final t in _templates) {
      if (t.id == id) {
        return t;
      }
    }
    return null;
  }

  List<WhatsAppTemplateModel> searchTemplates(String query) {
    final normalized = query.trim().toLowerCase();
    final result = _templates.where((template) {
      if (normalized.isEmpty) {
        return true;
      }
      return template.title.toLowerCase().contains(normalized) ||
          template.body.toLowerCase().contains(normalized);
    }).toList();
    result.sort((a, b) => b.updatedAt.compareTo(a.updatedAt));
    return result;
  }

  List<WhatsAppMessageLogModel> searchLogs(String query) {
    final normalized = query.trim().toLowerCase();
    final result = _logs.where((log) {
      if (normalized.isEmpty) {
        return true;
      }
      return log.patientName.toLowerCase().contains(normalized) ||
          log.patientPhone.contains(normalized) ||
          log.templateTitle.toLowerCase().contains(normalized);
    }).toList();
    result.sort((a, b) => b.sentAt.compareTo(a.sentAt));
    return result;
  }

  int get queuedCount =>
      _logs.where((e) => e.status == WhatsAppLogStatus.queued).length;
  int get sentTodayCount => _logs
      .where((e) => e.status == WhatsAppLogStatus.sent && e.isToday)
      .length;
  int get failedCount =>
      _logs.where((e) => e.status == WhatsAppLogStatus.failed).length;

  void updateTemplate(WhatsAppTemplateModel updated) {
    final index = _templates.indexWhere((e) => e.id == updated.id);
    if (index >= 0) {
      _templates[index] = updated;
    }
  }

  void sendMessage({
    required PatientModel patient,
    required WhatsAppTemplateModel template,
    required String message,
  }) {
    final log = WhatsAppMessageLogModel(
      id: 'wlog-${DateTime.now().millisecondsSinceEpoch}',
      patientId: patient.id,
      patientName: patient.fullName,
      patientPhone: patient.phone,
      templateTitle: template.title,
      preview: message.trim(),
      status: WhatsAppLogStatus.queued,
      sentAt: DateTime.now(),
    );
    _logs.insert(0, log);
  }

  void retry(String logId) {
    final index = _logs.indexWhere((e) => e.id == logId);
    if (index < 0) {
      return;
    }
    final log = _logs[index];
    _logs[index] = log.copyWith(
      status: WhatsAppLogStatus.queued,
      sentAt: DateTime.now(),
      clearFailureReason: true,
    );
  }

  void seedMockData() {
    final now = DateTime.now();
    _templates.assignAll([
      WhatsAppTemplateModel(
        id: 'wt-1',
        title: kWhatsAppTemplateReminderTitle,
        body: kWhatsAppTemplateReminderBody,
        type: WhatsAppTemplateType.reminder,
        isActive: true,
        isDefault: true,
        updatedAt: now.subtract(const Duration(days: 1)),
      ),
      WhatsAppTemplateModel(
        id: 'wt-2',
        title: kWhatsAppTemplateFollowUpTitle,
        body: kWhatsAppTemplateFollowUpBody,
        type: WhatsAppTemplateType.followUp,
        isActive: true,
        isDefault: false,
        updatedAt: now.subtract(const Duration(days: 2)),
      ),
      WhatsAppTemplateModel(
        id: 'wt-3',
        title: kWhatsAppTemplateReceiptTitle,
        body: kWhatsAppTemplateReceiptBody,
        type: WhatsAppTemplateType.receipt,
        isActive: false,
        isDefault: false,
        updatedAt: now.subtract(const Duration(days: 5)),
      ),
    ]);

    final patients = _patients.patients;
    if (patients.isEmpty) {
      return;
    }
    PatientModel p(int i) => patients[i % patients.length];
    _logs.assignAll([
      WhatsAppMessageLogModel(
        id: 'wlog-1',
        patientId: p(0).id,
        patientName: p(0).fullName,
        patientPhone: p(0).phone,
        templateTitle: kWhatsAppTemplateReminderTitle,
        preview: 'Reminder for 9:30 AM visit tomorrow.',
        status: WhatsAppLogStatus.sent,
        sentAt: now.subtract(const Duration(hours: 1)),
      ),
      WhatsAppMessageLogModel(
        id: 'wlog-2',
        patientId: p(1).id,
        patientName: p(1).fullName,
        patientPhone: p(1).phone,
        templateTitle: kWhatsAppTemplateFollowUpTitle,
        preview: 'Hope you are feeling better. Book follow-up if needed.',
        status: WhatsAppLogStatus.failed,
        sentAt: now.subtract(const Duration(days: 1, hours: 3)),
        failureReason: kWhatsAppMockFailureReason,
      ),
      WhatsAppMessageLogModel(
        id: 'wlog-3',
        patientId: p(2).id,
        patientName: p(2).fullName,
        patientPhone: p(2).phone,
        templateTitle: kWhatsAppTemplateReceiptTitle,
        preview: 'Your consultation receipt is ready.',
        status: WhatsAppLogStatus.queued,
        sentAt: now.subtract(const Duration(minutes: 15)),
      ),
    ]);
  }
}
