import 'package:doctors_clinic/app/main/patients/data/patient_repository.dart';
import 'package:doctors_clinic/app/main/patients/models/patient_model.dart';
import 'package:doctors_clinic/app/main/queue/models/queue_token_model.dart';
import 'package:doctors_clinic/app/main/queue/models/queue_token_status.dart';
import 'package:get/get.dart';

enum QueueListFilter { all, waiting, withDoctor, completed, skipped, priority }

class QueueRepository extends GetxService {
  final _tokens = <QueueTokenModel>[].obs;

  List<QueueTokenModel> get tokens => List.unmodifiable(_tokens);

  PatientRepository get _patients => Get.find<PatientRepository>();

  @override
  void onInit() {
    super.onInit();
    if (_tokens.isEmpty) {
      seedMockTokens();
    }
  }

  QueueTokenModel? findById(String id) {
    for (final token in _tokens) {
      if (token.id == id) {
        return token;
      }
    }
    return null;
  }

  int get nextTokenNumber {
    if (_tokens.isEmpty) {
      return 1;
    }
    return _tokens
            .map((e) => e.tokenNumber)
            .reduce((value, element) => value > element ? value : element) +
        1;
  }

  int countForFilter(QueueListFilter filter) {
    return searchAndFilter(filter: filter).length;
  }

  List<QueueTokenModel> searchAndFilter({
    String query = '',
    QueueListFilter filter = QueueListFilter.all,
  }) {
    final normalized = query.trim().toLowerCase();
    final filtered = _tokens.where((token) {
      if (!_matchesFilter(token, filter)) {
        return false;
      }
      if (normalized.isEmpty) {
        return true;
      }
      return token.patientName.toLowerCase().contains(normalized) ||
          token.patientPhone.contains(normalized) ||
          (token.reason ?? '').toLowerCase().contains(normalized);
    }).toList();

    filtered.sort((a, b) {
      final statusCompare = _statusSortIndex(
        a.status,
      ).compareTo(_statusSortIndex(b.status));
      if (statusCompare != 0) {
        return statusCompare;
      }
      return a.tokenNumber.compareTo(b.tokenNumber);
    });
    return filtered;
  }

  bool _matchesFilter(QueueTokenModel token, QueueListFilter filter) {
    switch (filter) {
      case QueueListFilter.all:
        return true;
      case QueueListFilter.waiting:
        return token.status == QueueTokenStatus.waiting;
      case QueueListFilter.withDoctor:
        return token.status == QueueTokenStatus.withDoctor;
      case QueueListFilter.completed:
        return token.status == QueueTokenStatus.completed;
      case QueueListFilter.skipped:
        return token.status == QueueTokenStatus.skipped;
      case QueueListFilter.priority:
        return token.isPriority;
    }
  }

  int _statusSortIndex(QueueTokenStatus status) {
    switch (status) {
      case QueueTokenStatus.withDoctor:
        return 0;
      case QueueTokenStatus.waiting:
        return 1;
      case QueueTokenStatus.completed:
        return 2;
      case QueueTokenStatus.skipped:
        return 3;
    }
  }

  QueueTokenModel addToken({
    required PatientModel patient,
    String? reason,
    String? notes,
    bool isPriority = false,
  }) {
    final token = QueueTokenModel(
      id: 'q-${DateTime.now().millisecondsSinceEpoch}',
      tokenNumber: nextTokenNumber,
      patientId: patient.id,
      patientName: patient.fullName,
      patientPhone: patient.phone,
      reason: reason,
      notes: notes,
      isPriority: isPriority,
      status: QueueTokenStatus.waiting,
      checkedInAt: DateTime.now(),
    );
    _tokens.add(token);
    return token;
  }

  void updateToken(QueueTokenModel token) {
    final index = _tokens.indexWhere((t) => t.id == token.id);
    if (index >= 0) {
      _tokens[index] = token;
    }
  }

  void updateStatus(String id, QueueTokenStatus status) {
    final token = findById(id);
    if (token == null) {
      return;
    }

    updateToken(
      token.copyWith(
        status: status,
        startedAt: status == QueueTokenStatus.withDoctor
            ? DateTime.now()
            : token.startedAt,
        completedAt:
            status == QueueTokenStatus.completed ||
                status == QueueTokenStatus.skipped
            ? DateTime.now()
            : token.completedAt,
      ),
    );
  }

  void updateNotes(String id, String notes) {
    final token = findById(id);
    if (token == null) {
      return;
    }
    updateToken(
      token.copyWith(
        notes: notes.trim().isEmpty ? null : notes.trim(),
        clearNotes: notes.trim().isEmpty,
      ),
    );
  }

  void seedMockTokens() {
    final patients = _patients.patients;
    if (patients.isEmpty) {
      return;
    }
    final now = DateTime.now();
    PatientModel patientAt(int index) => patients[index % patients.length];

    _tokens.assignAll([
      QueueTokenModel(
        id: 'q-1',
        tokenNumber: 1,
        patientId: patientAt(0).id,
        patientName: patientAt(0).fullName,
        patientPhone: patientAt(0).phone,
        reason: 'Follow-up check',
        isPriority: false,
        status: QueueTokenStatus.withDoctor,
        checkedInAt: DateTime(now.year, now.month, now.day, 9, 5),
        startedAt: DateTime(now.year, now.month, now.day, 9, 20),
      ),
      QueueTokenModel(
        id: 'q-2',
        tokenNumber: 2,
        patientId: patientAt(1).id,
        patientName: patientAt(1).fullName,
        patientPhone: patientAt(1).phone,
        reason: 'Walk-in consultation',
        isPriority: true,
        status: QueueTokenStatus.waiting,
        checkedInAt: DateTime(now.year, now.month, now.day, 9, 15),
      ),
      QueueTokenModel(
        id: 'q-3',
        tokenNumber: 3,
        patientId: patientAt(2).id,
        patientName: patientAt(2).fullName,
        patientPhone: patientAt(2).phone,
        reason: 'Skin treatment',
        isPriority: false,
        status: QueueTokenStatus.waiting,
        checkedInAt: DateTime(now.year, now.month, now.day, 9, 22),
      ),
      QueueTokenModel(
        id: 'q-4',
        tokenNumber: 4,
        patientId: patientAt(3).id,
        patientName: patientAt(3).fullName,
        patientPhone: patientAt(3).phone,
        reason: 'Dressing change',
        isPriority: false,
        status: QueueTokenStatus.completed,
        checkedInAt: DateTime(now.year, now.month, now.day, 8, 45),
        startedAt: DateTime(now.year, now.month, now.day, 9, 0),
        completedAt: DateTime(now.year, now.month, now.day, 9, 12),
      ),
    ]);
  }
}
