import 'package:doctors_clinic/constants/string_constants.dart';
import 'package:doctors_clinic/utils/app_widgets/main_tab_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/dashboard_controller.dart';

class DashboardView extends GetView<DashboardController> {
  const DashboardView({super.key});

  @override
  Widget build(BuildContext context) {
    return const MainTabScaffold(
      title: kDashboardTitle,
      subtitle: kDashboardPlaceholderSubtitle,
      icon: Icons.dashboard_outlined,
    );
  }
}
