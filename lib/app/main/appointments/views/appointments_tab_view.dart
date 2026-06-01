import 'package:doctors_clinic/constants/string_constants.dart';
import 'package:doctors_clinic/utils/app_widgets/main_tab_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/appointments_tab_controller.dart';

class AppointmentsTabView extends GetView<AppointmentsTabController> {
  const AppointmentsTabView({super.key});

  @override
  Widget build(BuildContext context) {
    return const MainTabScaffold(
      title: kAppointmentsTitle,
      subtitle: kAppointmentsPlaceholderSubtitle,
      icon: Icons.event_outlined,
    );
  }
}
