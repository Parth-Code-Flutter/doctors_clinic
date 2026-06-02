import 'package:doctors_clinic/app/main/queue/data/queue_repository.dart';
import 'package:doctors_clinic/app/main/queue/models/queue_token_model.dart';
import 'package:doctors_clinic/app/main/queue/models/queue_token_status.dart';
import 'package:get/get.dart';

class QueueBoardController extends GetxController {
  QueueRepository get _repo => Get.find<QueueRepository>();

  List<QueueTokenModel> get activeTokens => _repo
      .searchAndFilter(filter: QueueListFilter.all)
      .where(
        (token) =>
            token.status == QueueTokenStatus.waiting ||
            token.status == QueueTokenStatus.withDoctor,
      )
      .toList();

  QueueTokenModel? get nowServing {
    for (final token in activeTokens) {
      if (token.status == QueueTokenStatus.withDoctor) {
        return token;
      }
    }
    return null;
  }
}
