import 'package:doctors_clinic/app/main/appointments/views/appointments_tab_view.dart';
import 'package:doctors_clinic/app/main/dashboard/views/dashboard_view.dart';
import 'package:doctors_clinic/app/main/more/views/more_tab_view.dart';
import 'package:doctors_clinic/app/main/patients/views/patients_tab_view.dart';
import 'package:doctors_clinic/constants/color_constants.dart';
import 'package:doctors_clinic/utils/app_widgets/clinic_bottom_nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/bottom_nav_controller.dart';

class BottomNavView extends GetView<BottomNavController> {
  const BottomNavView({super.key});

  static const List<Widget> _tabBodies = [
    DashboardView(),
    PatientsTabView(),
    AppointmentsTabView(),
    MoreTabView(),
  ];

  @override
  Widget build(BuildContext context) {
    final bottomClearance =
        kClinicBottomNavContentClearance + MediaQuery.paddingOf(context).bottom;

    return Scaffold(
      backgroundColor: kColorBackground,
      body: Stack(
        fit: StackFit.expand,
        children: [
          Obx(
            () => Padding(
              padding: EdgeInsets.only(bottom: bottomClearance),
              child: IndexedStack(
                index: controller.selectedIndex.value,
                children: _tabBodies,
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Obx(
              () => ClinicBottomNavBar(
                items: BottomNavController.tabs,
                selectedIndex: controller.selectedIndex.value,
                onTabSelected: controller.onTabSelected,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
