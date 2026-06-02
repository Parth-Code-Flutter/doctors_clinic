import 'package:doctors_clinic/app/main/staff/models/staff_member_model.dart';
import 'package:doctors_clinic/app/main/staff/models/staff_role.dart';
import 'package:doctors_clinic/app/main/staff/models/staff_status.dart';
import 'package:get/get.dart';

enum StaffListFilter { all, active, onLeave, inactive }

class StaffRepository extends GetxService {
  final _members = <StaffMemberModel>[].obs;

  List<StaffMemberModel> get members {
    final list = List<StaffMemberModel>.from(_members);
    list.sort((a, b) => a.fullName.compareTo(b.fullName));
    return list;
  }

  @override
  void onInit() {
    super.onInit();
    if (_members.isEmpty) {
      seedMockMembers();
    }
  }

  StaffMemberModel? findById(String id) {
    for (final member in _members) {
      if (member.id == id) {
        return member;
      }
    }
    return null;
  }

  List<StaffMemberModel> searchAndFilter({
    String query = '',
    StaffListFilter filter = StaffListFilter.all,
  }) {
    final q = query.trim().toLowerCase();
    return members.where((m) {
      if (!_matchesFilter(m, filter)) {
        return false;
      }
      if (q.isEmpty) {
        return true;
      }
      return m.fullName.toLowerCase().contains(q) ||
          m.phone.contains(q) ||
          m.role.label.toLowerCase().contains(q);
    }).toList();
  }

  bool _matchesFilter(StaffMemberModel member, StaffListFilter filter) {
    switch (filter) {
      case StaffListFilter.all:
        return true;
      case StaffListFilter.active:
        return member.status == StaffStatus.active;
      case StaffListFilter.onLeave:
        return member.status == StaffStatus.onLeave;
      case StaffListFilter.inactive:
        return member.status == StaffStatus.inactive;
    }
  }

  int countForFilter(StaffListFilter filter) =>
      searchAndFilter(filter: filter).length;

  void save(StaffMemberModel member) {
    final index = _members.indexWhere((m) => m.id == member.id);
    if (index >= 0) {
      _members[index] = member;
    } else {
      _members.insert(0, member);
    }
  }

  void updateStatus(String id, StaffStatus status) {
    final member = findById(id);
    if (member == null) {
      return;
    }
    save(member.copyWith(status: status));
  }

  String newId() => 's-${DateTime.now().millisecondsSinceEpoch}';

  void seedMockMembers() {
    final now = DateTime.now();
    _members.assignAll([
      StaffMemberModel(
        id: 's-1',
        fullName: 'Priya Sharma',
        phone: '9876543210',
        role: StaffRole.receptionist,
        status: StaffStatus.active,
        joinedAt: now.subtract(const Duration(days: 420)),
        email: 'priya@clinic.dev',
        shiftLabel: 'Morning shift',
        permissionsSummary: 'Patients, appointments, reminders',
      ),
      StaffMemberModel(
        id: 's-2',
        fullName: 'Karan Patel',
        phone: '9898989898',
        role: StaffRole.assistant,
        status: StaffStatus.onLeave,
        joinedAt: now.subtract(const Duration(days: 300)),
        shiftLabel: 'General shift',
        permissionsSummary: 'Queue and front desk support',
      ),
      StaffMemberModel(
        id: 's-3',
        fullName: 'Meera Joshi',
        phone: '9810011001',
        role: StaffRole.manager,
        status: StaffStatus.active,
        joinedAt: now.subtract(const Duration(days: 700)),
        email: 'meera@clinic.dev',
        shiftLabel: 'Full day',
        permissionsSummary: 'All non-clinical modules',
      ),
    ]);
  }
}
