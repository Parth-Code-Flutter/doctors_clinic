import 'package:doctors_clinic/app/main/reports/data/reports_repository.dart';
import 'package:doctors_clinic/app/main/reports/models/report_kpi_item.dart';
import 'package:doctors_clinic/app/main/reports/models/report_trend_item.dart';
import 'package:doctors_clinic/constants/color_constants.dart';
import 'package:doctors_clinic/constants/string_constants.dart';
import 'package:doctors_clinic/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ReportsDashboardController extends GetxController {
  final selectedRange = 'Weekly'.obs;

  ReportsRepository get _repo => Get.find<ReportsRepository>();

  List<String> get ranges => const ['Weekly', 'Monthly'];

  List<ReportTrendItem> get trends => _repo.trendForRange(selectedRange.value);

  int get totalVisits => trends.fold(0, (sum, t) => sum + t.visits);
  int get totalRevenue => trends.fold(0, (sum, t) => sum + t.revenue);
  int get totalNoShows => trends.fold(0, (sum, t) => sum + t.noShows);
  int get followUpConversion => totalVisits == 0 ? 0 : ((totalVisits - totalNoShows) * 100 ~/ totalVisits);

  List<ReportKpiItem> get kpis => [
    ReportKpiItem(
      title: kReportsKpiVisits,
      value: totalVisits.toString(),
      icon: Icons.event_available_rounded,
      color: kColorLink,
    ),
    ReportKpiItem(
      title: kReportsKpiRevenue,
      value: 'INR $totalRevenue',
      icon: Icons.currency_rupee_rounded,
      color: kColorAppointmentSuccess,
    ),
    ReportKpiItem(
      title: kReportsKpiNoShows,
      value: totalNoShows.toString(),
      icon: Icons.event_busy_rounded,
      color: kColorAppointmentMissed,
    ),
    ReportKpiItem(
      title: kReportsKpiFollowUpConversion,
      value: '$followUpConversion%',
      icon: Icons.trending_up_rounded,
      color: kColorPrimary,
    ),
  ];

  void onRangeChanged(String? value) {
    if (value == null) {
      return;
    }
    selectedRange.value = value;
  }

  void onOpenAppointments() => Get.toNamed(Routes.APPOINTMENT_ADD);
  void onOpenBilling() => Get.toNamed(Routes.BILLING_LIST);
  void onOpenFollowUps() => Get.toNamed(Routes.FOLLOW_UP_LIST);
}
