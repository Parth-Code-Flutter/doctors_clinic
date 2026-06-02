import 'package:doctors_clinic/app/main/reports/models/report_trend_item.dart';
import 'package:get/get.dart';

class ReportsRepository extends GetxService {
  final _weekly = <ReportTrendItem>[].obs;
  final _monthly = <ReportTrendItem>[].obs;

  List<ReportTrendItem> trendForRange(String rangeKey) {
    if (rangeKey == 'Monthly') {
      return List<ReportTrendItem>.from(_monthly);
    }
    return List<ReportTrendItem>.from(_weekly);
  }

  @override
  void onInit() {
    super.onInit();
    if (_weekly.isEmpty) {
      seedMock();
    }
  }

  void seedMock() {
    _weekly.assignAll(const [
      ReportTrendItem(label: 'Mon', visits: 12, revenue: 8200, noShows: 1),
      ReportTrendItem(label: 'Tue', visits: 15, revenue: 10200, noShows: 2),
      ReportTrendItem(label: 'Wed', visits: 11, revenue: 7600, noShows: 1),
      ReportTrendItem(label: 'Thu', visits: 17, revenue: 11800, noShows: 3),
      ReportTrendItem(label: 'Fri', visits: 14, revenue: 9800, noShows: 1),
      ReportTrendItem(label: 'Sat', visits: 9, revenue: 6400, noShows: 0),
      ReportTrendItem(label: 'Sun', visits: 6, revenue: 4200, noShows: 0),
    ]);
    _monthly.assignAll(const [
      ReportTrendItem(label: 'W1', visits: 72, revenue: 48600, noShows: 5),
      ReportTrendItem(label: 'W2', visits: 80, revenue: 55400, noShows: 7),
      ReportTrendItem(label: 'W3', visits: 76, revenue: 53100, noShows: 6),
      ReportTrendItem(label: 'W4', visits: 84, revenue: 60200, noShows: 4),
    ]);
  }
}
