import 'package:doctors_clinic/app/main/appointments/utils/appointment_format_utils.dart';
import 'package:doctors_clinic/app/main/followups/controllers/follow_up_detail_controller.dart';
import 'package:doctors_clinic/app/main/followups/models/follow_up_status.dart';
import 'package:doctors_clinic/constants/color_constants.dart';
import 'package:doctors_clinic/constants/string_constants.dart';
import 'package:doctors_clinic/utils/app_widgets/app_button.dart';
import 'package:doctors_clinic/utils/app_widgets/app_spaces.dart';
import 'package:doctors_clinic/utils/app_widgets/common_app_bar_widget.dart';
import 'package:doctors_clinic/utils/text_utils/app_text.dart';
import 'package:doctors_clinic/utils/text_utils/text_styles.dart';
import 'package:doctors_clinic/utils/ui_utils/app_ui_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FollowUpDetailView extends GetView<FollowUpDetailController> {
  const FollowUpDetailView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kColorBackground,
      appBar: const CommonAppBarWidget(title: kFollowUpDetailTitle),
      body: Obx(() {
        final item = controller.item.value;
        if (item == null) {
          return const SizedBox.shrink();
        }
        return ListView(
          padding: AppUIUtils.horizontalPadding.copyWith(top: 8, bottom: 24),
          children: [
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: kColorSurface,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: kColorBorder),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SemiBoldText(
                    text: item.patientName,
                    fontSize: TextStyles.k18FontSize,
                    color: kColorTitle,
                  ),
                  const SizedBox(height: 4),
                  AppText(
                    text: item.patientPhone,
                    fontSize: TextStyles.k14FontSize,
                    color: kColorTextSecondary,
                  ),
                  const SizedBox(height: 8),
                  AppText(
                    text: AppointmentFormatUtils.formatDateLong(
                      item.scheduledAt,
                    ),
                    fontSize: TextStyles.k12FontSize,
                    color: kColorTextSecondary,
                  ),
                  const SizedBox(height: 3),
                  AppText(
                    text: item.status.label,
                    fontSize: TextStyles.k12FontSize,
                    color: kColorTextSecondary,
                  ),
                ],
              ),
            ),
            if (item.reason != null && item.reason!.isNotEmpty) ...[
              Spacing.v16,
              const SemiBoldText(
                text: kFollowUpReasonSectionTitle,
                fontSize: TextStyles.k14FontSize,
                color: kColorTitle,
              ),
              const SizedBox(height: 6),
              AppText(
                text: item.reason!,
                fontSize: TextStyles.k14FontSize,
                color: kColorTextSecondary,
              ),
            ],
            if (item.notes != null && item.notes!.isNotEmpty) ...[
              Spacing.v16,
              const SemiBoldText(
                text: kFollowUpNotesSectionTitle,
                fontSize: TextStyles.k14FontSize,
                color: kColorTitle,
              ),
              const SizedBox(height: 6),
              AppText(
                text: item.notes!,
                fontSize: TextStyles.k14FontSize,
                color: kColorTextSecondary,
              ),
            ],
            Spacing.v16,
            appButton(
              onPressed: controller.onMarkCompleted,
              buttonText: kFollowUpMarkCompletedButton,
              variant: AppButtonVariant.secondary,
            ),
            const SizedBox(height: 10),
            appButton(
              onPressed: controller.onMarkMissed,
              buttonText: kFollowUpMarkMissedButton,
              variant: AppButtonVariant.secondary,
            ),
            const SizedBox(height: 10),
            appButton(
              onPressed: controller.onEdit,
              buttonText: kFollowUpEditButton,
              variant: AppButtonVariant.secondary,
            ),
          ],
        );
      }),
    );
  }
}
