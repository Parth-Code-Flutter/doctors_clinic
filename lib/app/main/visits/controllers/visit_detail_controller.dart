import 'package:doctors_clinic/app/main/visits/data/visit_repository.dart';
import 'package:doctors_clinic/app/main/visits/models/visit_record_model.dart';
import 'package:doctors_clinic/app/main/visits/visit_route_arguments.dart';
import 'package:doctors_clinic/routes/app_pages.dart';
import 'package:get/get.dart';

class VisitDetailController extends GetxController {
  final visit = Rxn<VisitRecordModel>();

  late String _visitId;

  VisitRepository get _repo => Get.find<VisitRepository>();

  @override
  void onInit() {
    super.onInit();
    _visitId = Get.arguments?[VisitRouteArgs.visitId] as String? ?? '';
    loadVisit();
  }

  void loadVisit() {
    final found = _repo.findById(_visitId);
    if (found == null) {
      Get.back();
      return;
    }
    visit.value = found;
  }

  Future<void> onEdit() async {
    final result = await Get.toNamed(
      Routes.VISIT_EDITOR,
      arguments: {VisitRouteArgs.visitId: _visitId},
    );
    if (result == true) {
      loadVisit();
    }
  }
}
