import 'package:doctors_clinic/app/main/doctors/models/doctor_model.dart';
import 'package:doctors_clinic/app/main/doctors/models/doctor_status.dart';
import 'package:get/get.dart';

enum DoctorListFilter { all, available, busy, offDuty }

class DoctorRepository extends GetxService {
  final _doctors = <DoctorModel>[].obs;

  List<DoctorModel> get doctors {
    final list = List<DoctorModel>.from(_doctors);
    list.sort((a, b) => a.fullName.compareTo(b.fullName));
    return list;
  }

  @override
  void onInit() {
    super.onInit();
    if (_doctors.isEmpty) {
      seedMockDoctors();
    }
  }

  DoctorModel? findById(String id) {
    for (final doctor in _doctors) {
      if (doctor.id == id) {
        return doctor;
      }
    }
    return null;
  }

  List<DoctorModel> searchAndFilter({
    String query = '',
    DoctorListFilter filter = DoctorListFilter.all,
  }) {
    final q = query.trim().toLowerCase();
    return doctors.where((d) {
      if (!_matchesFilter(d, filter)) {
        return false;
      }
      if (q.isEmpty) {
        return true;
      }
      return d.fullName.toLowerCase().contains(q) ||
          d.specialization.toLowerCase().contains(q) ||
          d.phone.contains(q);
    }).toList();
  }

  bool _matchesFilter(DoctorModel doctor, DoctorListFilter filter) {
    switch (filter) {
      case DoctorListFilter.all:
        return true;
      case DoctorListFilter.available:
        return doctor.status == DoctorStatus.available;
      case DoctorListFilter.busy:
        return doctor.status == DoctorStatus.busy;
      case DoctorListFilter.offDuty:
        return doctor.status == DoctorStatus.offDuty;
    }
  }

  int countForFilter(DoctorListFilter filter) =>
      searchAndFilter(filter: filter).length;

  void save(DoctorModel doctor) {
    final index = _doctors.indexWhere((d) => d.id == doctor.id);
    if (index >= 0) {
      _doctors[index] = doctor;
    } else {
      _doctors.insert(0, doctor);
    }
  }

  void updateStatus(String id, DoctorStatus status) {
    final doctor = findById(id);
    if (doctor == null) {
      return;
    }
    save(doctor.copyWith(status: status));
  }

  String newId() => 'd-${DateTime.now().millisecondsSinceEpoch}';

  void seedMockDoctors() {
    _doctors.assignAll(const [
      DoctorModel(
        id: 'd-1',
        fullName: 'Dr. Rohan Mehta',
        specialization: 'Dental Surgeon',
        phone: '9890011223',
        status: DoctorStatus.available,
        experienceLabel: '10 years',
        opdTimings: '9:00 AM - 2:00 PM',
      ),
      DoctorModel(
        id: 'd-2',
        fullName: 'Dr. Sneha Iyer',
        specialization: 'Dermatologist',
        phone: '9876501234',
        status: DoctorStatus.busy,
        experienceLabel: '8 years',
        opdTimings: '11:00 AM - 6:00 PM',
      ),
      DoctorModel(
        id: 'd-3',
        fullName: 'Dr. Aarav Singh',
        specialization: 'Physiotherapist',
        phone: '9866001122',
        status: DoctorStatus.offDuty,
        experienceLabel: '6 years',
        opdTimings: '4:00 PM - 8:00 PM',
      ),
    ]);
  }
}
