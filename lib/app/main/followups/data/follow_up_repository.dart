import 'package:doctors_clinic/app/main/followups/models/follow_up_model.dart';
import 'package:doctors_clinic/app/main/followups/models/follow_up_status.dart';
import 'package:doctors_clinic/app/main/patients/data/patient_repository.dart';
import 'package:doctors_clinic/app/main/patients/models/patient_model.dart';
import 'package:get/get.dart';

enum FollowUpListFilter { all, today, upcoming, completed, missed }

class FollowUpRepository extends GetxService {
  final _items = <FollowUpModel>[].obs;

  PatientRepository get _patients => Get.find<PatientRepository>();

  List<FollowUpModel> get items {
    final list = List<FollowUpModel>.from(_items);
    list.sort((a, b) => a.scheduledAt.compareTo(b.scheduledAt));
    return list;
  }

  @override
  void onInit() {
    super.onInit();
    if (_items.isEmpty) {
      seedMockFollowUps();
    }
  }

  FollowUpModel? findById(String id) {
    for (final item in _items) {
      if (item.id == id) {
        return item;
      }
    }
    return null;
  }

  List<FollowUpModel> searchAndFilter({
    String query = '',
    FollowUpListFilter filter = FollowUpListFilter.all,
  }) {
    final q = query.trim().toLowerCase();
    final now = DateTime.now();

    final list = items.where((item) {
      if (!_matchFilter(item, filter, now)) {
        return false;
      }
      if (q.isEmpty) {
        return true;
      }
      return item.patientName.toLowerCase().contains(q) ||
          item.patientPhone.contains(q);
    }).toList();
    return list;
  }

  bool _matchFilter(
    FollowUpModel item,
    FollowUpListFilter filter,
    DateTime now,
  ) {
    final startToday = DateTime(now.year, now.month, now.day);
    final endToday = startToday.add(const Duration(days: 1));
    final isToday =
        item.scheduledAt.isAfter(
          startToday.subtract(const Duration(milliseconds: 1)),
        ) &&
        item.scheduledAt.isBefore(endToday);

    switch (filter) {
      case FollowUpListFilter.all:
        return true;
      case FollowUpListFilter.today:
        return isToday;
      case FollowUpListFilter.upcoming:
        return item.status == FollowUpStatus.scheduled &&
            item.scheduledAt.isAfter(now);
      case FollowUpListFilter.completed:
        return item.status == FollowUpStatus.completed;
      case FollowUpListFilter.missed:
        return item.status == FollowUpStatus.missed;
    }
  }

  int countForFilter(FollowUpListFilter filter) =>
      searchAndFilter(filter: filter).length;

  void save(FollowUpModel model) {
    final index = _items.indexWhere((i) => i.id == model.id);
    if (index >= 0) {
      _items[index] = model;
    } else {
      _items.insert(0, model);
    }
  }

  void markCompleted(String id) {
    final item = findById(id);
    if (item == null) {
      return;
    }
    save(
      item.copyWith(
        status: FollowUpStatus.completed,
        completedAt: DateTime.now(),
      ),
    );
  }

  void markMissed(String id) {
    final item = findById(id);
    if (item == null) {
      return;
    }
    save(item.copyWith(status: FollowUpStatus.missed, clearCompletedAt: true));
  }

  String newId() => 'fu-${DateTime.now().millisecondsSinceEpoch}';

  void seedMockFollowUps() {
    final patients = _patients.patients;
    if (patients.isEmpty) {
      return;
    }
    PatientModel p(int i) => patients[i % patients.length];
    final now = DateTime.now();

    _items.assignAll([
      FollowUpModel(
        id: 'fu-1',
        patientId: p(0).id,
        patientName: p(0).fullName,
        patientPhone: p(0).phone,
        scheduledAt: now.add(const Duration(days: 2)),
        status: FollowUpStatus.scheduled,
        reason: 'Re-check pain response',
      ),
      FollowUpModel(
        id: 'fu-2',
        patientId: p(1).id,
        patientName: p(1).fullName,
        patientPhone: p(1).phone,
        scheduledAt: now.subtract(const Duration(days: 1)),
        status: FollowUpStatus.completed,
        reason: 'Medication completion review',
        completedAt: now.subtract(const Duration(days: 1, hours: 2)),
      ),
      FollowUpModel(
        id: 'fu-3',
        patientId: p(2).id,
        patientName: p(2).fullName,
        patientPhone: p(2).phone,
        scheduledAt: now.subtract(const Duration(days: 3)),
        status: FollowUpStatus.missed,
        reason: 'Skin progress check',
      ),
    ]);
  }
}
