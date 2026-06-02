/// In-memory clinic profile and reminder preferences (API v0.2+).
class ClinicSettingsModel {
  const ClinicSettingsModel({
    required this.clinicName,
    required this.ownerName,
    required this.mobile,
    required this.email,
    required this.address,
    required this.city,
    required this.state,
    required this.pincode,
    required this.clinicType,
    required this.workingDays,
    required this.workingHours,
    required this.defaultReminderIndex,
    required this.reminderChannelIndex,
    required this.autoRemindersEnabled,
  });

  final String clinicName;
  final String ownerName;
  final String mobile;
  final String email;
  final String address;
  final String city;
  final String state;
  final String pincode;
  final String clinicType;
  final String workingDays;
  final String workingHours;
  final int defaultReminderIndex;
  final int reminderChannelIndex;
  final bool autoRemindersEnabled;

  String get locationLine {
    final parts = <String>[
      if (city.isNotEmpty) city,
      if (state.isNotEmpty) state,
    ];
    return parts.join(', ');
  }

  ClinicSettingsModel copyWith({
    String? clinicName,
    String? ownerName,
    String? mobile,
    String? email,
    String? address,
    String? city,
    String? state,
    String? pincode,
    String? clinicType,
    String? workingDays,
    String? workingHours,
    int? defaultReminderIndex,
    int? reminderChannelIndex,
    bool? autoRemindersEnabled,
  }) {
    return ClinicSettingsModel(
      clinicName: clinicName ?? this.clinicName,
      ownerName: ownerName ?? this.ownerName,
      mobile: mobile ?? this.mobile,
      email: email ?? this.email,
      address: address ?? this.address,
      city: city ?? this.city,
      state: state ?? this.state,
      pincode: pincode ?? this.pincode,
      clinicType: clinicType ?? this.clinicType,
      workingDays: workingDays ?? this.workingDays,
      workingHours: workingHours ?? this.workingHours,
      defaultReminderIndex: defaultReminderIndex ?? this.defaultReminderIndex,
      reminderChannelIndex: reminderChannelIndex ?? this.reminderChannelIndex,
      autoRemindersEnabled: autoRemindersEnabled ?? this.autoRemindersEnabled,
    );
  }
}
