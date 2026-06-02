import 'package:doctors_clinic/app/main/staff/models/staff_role.dart';
import 'package:doctors_clinic/app/main/staff/models/staff_status.dart';

class StaffMemberModel {
  const StaffMemberModel({
    required this.id,
    required this.fullName,
    required this.phone,
    required this.role,
    required this.status,
    required this.joinedAt,
    this.email,
    this.shiftLabel,
    this.permissionsSummary,
    this.notes,
  });

  final String id;
  final String fullName;
  final String phone;
  final StaffRole role;
  final StaffStatus status;
  final DateTime joinedAt;
  final String? email;
  final String? shiftLabel;
  final String? permissionsSummary;
  final String? notes;

  StaffMemberModel copyWith({
    String? fullName,
    String? phone,
    StaffRole? role,
    StaffStatus? status,
    String? email,
    String? shiftLabel,
    String? permissionsSummary,
    String? notes,
    bool clearEmail = false,
    bool clearShift = false,
    bool clearPermissionsSummary = false,
    bool clearNotes = false,
  }) {
    return StaffMemberModel(
      id: id,
      fullName: fullName ?? this.fullName,
      phone: phone ?? this.phone,
      role: role ?? this.role,
      status: status ?? this.status,
      joinedAt: joinedAt,
      email: clearEmail ? null : (email ?? this.email),
      shiftLabel: clearShift ? null : (shiftLabel ?? this.shiftLabel),
      permissionsSummary: clearPermissionsSummary
          ? null
          : (permissionsSummary ?? this.permissionsSummary),
      notes: clearNotes ? null : (notes ?? this.notes),
    );
  }
}
