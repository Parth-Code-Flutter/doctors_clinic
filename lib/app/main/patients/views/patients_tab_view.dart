import 'package:doctors_clinic/constants/string_constants.dart';
import 'package:doctors_clinic/utils/app_widgets/main_tab_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/patients_tab_controller.dart';

class PatientsTabView extends GetView<PatientsTabController> {
  const PatientsTabView({super.key});

  @override
  Widget build(BuildContext context) {
    return const MainTabScaffold(
      title: kPatientsTitle,
      subtitle: kPatientsPlaceholderSubtitle,
      icon: Icons.groups_outlined,
    );
  }
}
