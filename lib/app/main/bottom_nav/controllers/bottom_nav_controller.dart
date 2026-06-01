import 'package:doctors_clinic/app/main/bottom_nav/models/bottom_nav_tab_item.dart';
import 'package:doctors_clinic/constants/string_constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BottomNavController extends GetxController {
  final selectedIndex = 0.obs;

  static const List<BottomNavTabItem> tabs = [
    BottomNavTabItem(
      label: kNavTabHome,
      icon: Icons.home_outlined,
      selectedIcon: Icons.home_rounded,
    ),
    BottomNavTabItem(
      label: kNavTabPatients,
      icon: Icons.groups_outlined,
      selectedIcon: Icons.groups_rounded,
    ),
    BottomNavTabItem(
      label: kNavTabAppointments,
      icon: Icons.event_outlined,
      selectedIcon: Icons.event_rounded,
    ),
    BottomNavTabItem(
      label: kNavTabMore,
      icon: Icons.grid_view_outlined,
      selectedIcon: Icons.grid_view_rounded,
    ),
  ];

  void onTabSelected(int index) {
    if (index < 0 || index >= tabs.length || selectedIndex.value == index) {
      return;
    }
    selectedIndex.value = index;
  }
}
