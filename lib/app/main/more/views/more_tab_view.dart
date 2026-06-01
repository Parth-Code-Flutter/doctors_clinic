import 'package:doctors_clinic/constants/color_constants.dart';
import 'package:doctors_clinic/constants/string_constants.dart';
import 'package:doctors_clinic/utils/app_widgets/app_button.dart' show AppButtonVariant, appButton;
import 'package:doctors_clinic/utils/app_widgets/common_app_bar_widget.dart';
import 'package:doctors_clinic/utils/app_widgets/main_tab_scaffold.dart';
import 'package:doctors_clinic/utils/ui_utils/app_ui_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/more_tab_controller.dart';

class MoreTabView extends GetView<MoreTabController> {
  const MoreTabView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kColorBackground,
      appBar: const CommonAppBarWidget(
        title: kMoreTitle,
        showBackButton: false,
      ),
      body: Padding(
        padding: AppUIUtils.horizontalPadding.copyWith(bottom: 16),
        child: Column(
          children: [
            const Expanded(
              child: MainTabPlaceholderContent(
                title: kMoreTitle,
                subtitle: kMorePlaceholderSubtitle,
                icon: Icons.grid_view_outlined,
              ),
            ),
            appButton(
              onPressed: controller.onLogout,
              buttonText: kMoreLogoutButton,
              variant: AppButtonVariant.secondary,
            ),
          ],
        ),
      ),
    );
  }
}
