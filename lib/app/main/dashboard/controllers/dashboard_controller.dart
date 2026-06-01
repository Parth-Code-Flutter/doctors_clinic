import 'package:doctors_clinic/app/main/bottom_nav/controllers/bottom_nav_controller.dart';
import 'package:doctors_clinic/app/main/appointments/appointment_route_arguments.dart';
import 'package:doctors_clinic/app/main/appointments/controllers/appointments_tab_controller.dart';
import 'package:doctors_clinic/app/main/appointments/data/appointment_repository.dart';
import 'package:doctors_clinic/app/main/patients/controllers/patients_tab_controller.dart';
import 'package:doctors_clinic/routes/app_pages.dart';
import 'package:doctors_clinic/app/main/dashboard/models/dashboard_appointment_item.dart';
import 'package:doctors_clinic/app/main/dashboard/models/dashboard_appointment_status.dart';
import 'package:doctors_clinic/app/main/dashboard/models/dashboard_stat_item.dart';
import 'package:doctors_clinic/constants/color_constants.dart';
import 'package:doctors_clinic/constants/string_constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DashboardController extends GetxController {
  static const _weekdays = [
    'Monday',
    'Tuesday',
    'Wednesday',
    'Thursday',
    'Friday',
    'Saturday',
    'Sunday',
  ];
  static const _months = [
    'Jan',
    'Feb',
    'Mar',
    'Apr',
    'May',
    'Jun',
    'Jul',
    'Aug',
    'Sep',
    'Oct',
    'Nov',
    'Dec',
  ];

  final isRefreshing = false.obs;
  final clinicName = kDashboardMockClinicName.obs;
  final ownerName = kDashboardMockOwnerName.obs;
  final stats = <DashboardStatItem>[].obs;
  final todayAppointments = <DashboardAppointmentItem>[].obs;

  @override
  void onInit() {
    super.onInit();
    _loadMockData();
  }

  String get greeting {
    final hour = DateTime.now().hour;
    if (hour < 12) {
      return kDashboardGreetingMorning;
    }
    if (hour < 17) {
      return kDashboardGreetingAfternoon;
    }
    return kDashboardGreetingEvening;
  }

  String get formattedDate {
    final now = DateTime.now();
    return '${_weekdays[now.weekday - 1]}, ${now.day} '
        '${_months[now.month - 1]} ${now.year}';
  }

  bool get hasAppointmentsToday => todayAppointments.isNotEmpty;

  Future<void> onRefresh() async {
    if (isRefreshing.value) {
      return;
    }
    try {
      isRefreshing.value = true;
      await Future<void>.delayed(const Duration(milliseconds: 800));
      _loadMockData();
    } finally {
      isRefreshing.value = false;
    }
  }

  void onAddPatient() {
    if (Get.isRegistered<BottomNavController>()) {
      Get.find<BottomNavController>().onTabSelected(1);
    }
    Get.toNamed(Routes.PATIENT_ADD)?.then((result) {
      if (result == true && Get.isRegistered<PatientsTabController>()) {
        Get.find<PatientsTabController>().refreshList();
      }
    });
  }

  void onBookAppointment() {
    if (Get.isRegistered<BottomNavController>()) {
      Get.find<BottomNavController>().onTabSelected(2);
    }
    Get.toNamed(Routes.APPOINTMENT_ADD)?.then((_) {
      if (Get.isRegistered<AppointmentsTabController>()) {
        Get.find<AppointmentsTabController>().refreshList();
      }
    });
  }

  void onViewAllAppointments() {
    onBookAppointment();
  }

  void onAppointmentTap(DashboardAppointmentItem item) {
    if (!Get.isRegistered<AppointmentRepository>()) {
      return;
    }
    final repo = Get.find<AppointmentRepository>();
    final match = repo.appointments.where(
      (a) => a.patientName == item.patientName && a.reason == item.serviceLabel,
    );
    if (match.isEmpty) {
      Get.toNamed(Routes.APPOINTMENT_DETAIL, arguments: {
        AppointmentRouteArgs.appointmentId: repo.appointments.first.id,
      });
      return;
    }
    Get.toNamed(
      Routes.APPOINTMENT_DETAIL,
      arguments: {AppointmentRouteArgs.appointmentId: match.first.id},
    );
  }

  void _loadMockData() {
    stats.assignAll(const [
      DashboardStatItem(
        label: kDashboardStatToday,
        value: '8',
        icon: Icons.event_available_rounded,
        iconBackground: Color(0xFFCFFAFE),
        iconColor: kColorLink,
      ),
      DashboardStatItem(
        label: kDashboardStatUpcoming,
        value: '14',
        icon: Icons.schedule_rounded,
        iconBackground: Color(0xFFFEF3C7),
        iconColor: kColorAppointmentPending,
      ),
      DashboardStatItem(
        label: kDashboardStatPatients,
        value: '126',
        icon: Icons.groups_rounded,
        iconBackground: Color(0xFFDCFCE7),
        iconColor: kColorAppointmentSuccess,
      ),
    ]);

    todayAppointments.assignAll(const [
      DashboardAppointmentItem(
        id: '1',
        patientName: 'Riya Sharma',
        timeLabel: '09:30 AM',
        serviceLabel: 'Dental check-up',
        status: DashboardAppointmentStatus.completed,
      ),
      DashboardAppointmentItem(
        id: '2',
        patientName: 'Amit Patel',
        timeLabel: '10:15 AM',
        serviceLabel: 'Root canal follow-up',
        status: DashboardAppointmentStatus.inProgress,
      ),
      DashboardAppointmentItem(
        id: '3',
        patientName: 'Neha Gupta',
        timeLabel: '11:00 AM',
        serviceLabel: 'Skin consultation',
        status: DashboardAppointmentStatus.upcoming,
      ),
      DashboardAppointmentItem(
        id: '4',
        patientName: 'Vikram Singh',
        timeLabel: '12:30 PM',
        serviceLabel: 'Physio session',
        status: DashboardAppointmentStatus.upcoming,
      ),
    ]);
  }
}
