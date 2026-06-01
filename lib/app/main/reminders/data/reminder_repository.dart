import 'package:doctors_clinic/app/main/appointments/data/appointment_repository.dart';
import 'package:doctors_clinic/app/main/appointments/models/appointment_model.dart';
import 'package:doctors_clinic/app/main/appointments/models/appointment_status.dart';
import 'package:doctors_clinic/app/main/reminders/models/reminder_model.dart';
import 'package:doctors_clinic/app/main/reminders/models/reminder_status.dart';
import 'package:doctors_clinic/app/main/reminders/utils/reminder_format_utils.dart';
import 'package:doctors_clinic/app/main/settings/data/clinic_settings_repository.dart';
import 'package:doctors_clinic/constants/string_constants.dart';
import 'package:get/get.dart';

enum ReminderListFilter {
  all,
  today,
  scheduled,
  sent,
  failed,
}

class ReminderRepository extends GetxService {
  final _reminders = <ReminderModel>[].obs;

  List<ReminderModel> get reminders => List.unmodifiable(_reminders);

  AppointmentRepository get _appointments => Get.find<AppointmentRepository>();

  ClinicSettingsRepository? get _settings =>
      Get.isRegistered<ClinicSettingsRepository>()
          ? Get.find<ClinicSettingsRepository>()
          : null;

  @override
  void onInit() {
    super.onInit();
    if (_reminders.isEmpty) {
      seedMockReminders();
    }
  }

  ReminderModel? findById(String id) {
    for (final item in _reminders) {
      if (item.id == id) {
        return item;
      }
    }
    return null;
  }

  ReminderModel? findByAppointmentId(String appointmentId) {
    for (final item in _reminders) {
      if (item.appointmentId == appointmentId) {
        return item;
      }
    }
    return null;
  }

  int countForFilter(ReminderListFilter filter) {
    return searchAndFilter(filter: filter).length;
  }

  List<ReminderModel> searchAndFilter({
    String query = '',
    ReminderListFilter filter = ReminderListFilter.all,
  }) {
    final normalized = query.trim().toLowerCase();
    final now = DateTime.now();

    final filtered = _reminders.where((reminder) {
      if (!_matchesFilter(reminder, filter, now)) {
        return false;
      }
      if (normalized.isEmpty) {
        return true;
      }
      return reminder.patientName.toLowerCase().contains(normalized) ||
          reminder.patientPhone.contains(normalized) ||
          reminder.channelLabel.toLowerCase().contains(normalized);
    }).toList();

    filtered.sort((a, b) => b.deliverAt.compareTo(a.deliverAt));
    return filtered;
  }

  bool _matchesFilter(
    ReminderModel reminder,
    ReminderListFilter filter,
    DateTime now,
  ) {
    switch (filter) {
      case ReminderListFilter.all:
        return true;
      case ReminderListFilter.today:
        return reminder.isDeliverToday;
      case ReminderListFilter.scheduled:
        return reminder.status == ReminderStatus.scheduled;
      case ReminderListFilter.sent:
        return reminder.status == ReminderStatus.sent;
      case ReminderListFilter.failed:
        return reminder.status == ReminderStatus.failed;
    }
  }

  void markSentForAppointment(String appointmentId) {
    final existing = findByAppointmentId(appointmentId);
    if (existing != null) {
      _updateReminder(
        existing.copyWith(
          status: ReminderStatus.sent,
          sentAt: DateTime.now(),
          clearFailureMessage: true,
        ),
      );
      return;
    }

    final appointment = _appointments.findById(appointmentId);
    if (appointment == null) {
      return;
    }

    _reminders.insert(0, _fromAppointment(appointment, status: ReminderStatus.sent));
  }

  void retryReminder(String id) {
    final reminder = findById(id);
    if (reminder == null || reminder.status != ReminderStatus.failed) {
      return;
    }
    _updateReminder(
      reminder.copyWith(
        status: ReminderStatus.scheduled,
        clearSentAt: true,
        clearFailureMessage: true,
      ),
    );
  }

  void upsertScheduledForAppointment(AppointmentModel appointment) {
    if (appointment.status == AppointmentStatus.cancelled ||
        appointment.status == AppointmentStatus.missed) {
      return;
    }

    final existing = findByAppointmentId(appointment.id);
    final replacement = _fromAppointment(
      appointment,
      status: existing?.status == ReminderStatus.sent
          ? ReminderStatus.sent
          : ReminderStatus.scheduled,
      sentAt: existing?.sentAt,
    );

    if (existing != null) {
      _updateReminder(replacement.copyWith(id: existing.id));
    } else {
      _reminders.insert(0, replacement);
    }
  }

  void _updateReminder(ReminderModel reminder) {
    final index = _reminders.indexWhere((r) => r.id == reminder.id);
    if (index >= 0) {
      _reminders[index] = reminder;
    }
  }

  void seedMockReminders() {
    final now = DateTime.now();
    final channel = _channelLabel;
    final timing = _timingLabel;

    final items = <ReminderModel>[];

    for (final appointment in _appointments.appointments) {
      if (appointment.status == AppointmentStatus.cancelled) {
        continue;
      }

      ReminderStatus status;
      DateTime? sentAt;
      String? failureMessage;

      switch (appointment.status) {
        case AppointmentStatus.completed:
          status = ReminderStatus.sent;
          sentAt = appointment.scheduledAt.subtract(
            ReminderFormatUtils.offsetForTimingLabel(appointment.reminderLabel),
          );
        case AppointmentStatus.upcoming:
        case AppointmentStatus.inProgress:
          status = ReminderStatus.scheduled;
        case AppointmentStatus.missed:
          status = ReminderStatus.failed;
          failureMessage = kRemindersMockFailureDelivery;
        case AppointmentStatus.cancelled:
          continue;
      }

      items.add(
        _fromAppointment(
          appointment,
          status: status,
          channelLabel: channel,
          timingLabel: appointment.reminderLabel,
          sentAt: sentAt,
          failureMessage: failureMessage,
        ),
      );
    }

    if (items.length < 3) {
      items.add(
        ReminderModel(
          id: 'rem-failed-1',
          appointmentId: 'a-6',
          patientName: 'Demo Patient',
          patientPhone: '9000000001',
          appointmentAt: now.subtract(const Duration(days: 2)),
          deliverAt: now.subtract(const Duration(days: 2, hours: 1)),
          status: ReminderStatus.failed,
          channelLabel: channel,
          timingLabel: timing,
          failureMessage: kRemindersMockFailureDelivery,
          createdAt: now.subtract(const Duration(days: 3)),
        ),
      );
    }

    _reminders.assignAll(items);
  }

  String get _channelLabel {
    final settings = _settings?.settings.value;
    if (settings == null) {
      return kReminderChannelOptions.first;
    }
    final index = settings.reminderChannelIndex.clamp(
      0,
      kReminderChannelOptions.length - 1,
    );
    return kReminderChannelOptions[index];
  }

  String get _timingLabel {
    final settings = _settings?.settings.value;
    if (settings == null) {
      return kDefaultReminderOptions[1];
    }
    final index = settings.defaultReminderIndex.clamp(
      0,
      kDefaultReminderOptions.length - 1,
    );
    return kDefaultReminderOptions[index];
  }

  ReminderModel _fromAppointment(
    AppointmentModel appointment, {
    required ReminderStatus status,
    String? channelLabel,
    String? timingLabel,
    DateTime? sentAt,
    String? failureMessage,
  }) {
    final timing = timingLabel ?? appointment.reminderLabel;
    final deliverAt = appointment.scheduledAt.subtract(
      ReminderFormatUtils.offsetForTimingLabel(timing),
    );

    return ReminderModel(
      id: 'rem-${appointment.id}',
      appointmentId: appointment.id,
      patientName: appointment.patientName,
      patientPhone: appointment.patientPhone,
      appointmentAt: appointment.scheduledAt,
      deliverAt: deliverAt,
      status: status,
      channelLabel: channelLabel ?? _channelLabel,
      timingLabel: timing,
      sentAt: sentAt ?? (status == ReminderStatus.sent ? deliverAt : null),
      failureMessage: failureMessage,
      createdAt: appointment.createdAt,
    );
  }
}
