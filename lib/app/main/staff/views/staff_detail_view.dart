import 'package:doctors_clinic/app/main/appointments/utils/appointment_format_utils.dart';
import 'package:doctors_clinic/app/main/staff/controllers/staff_detail_controller.dart';
import 'package:doctors_clinic/app/main/staff/models/staff_role.dart';
import 'package:doctors_clinic/app/main/staff/models/staff_status.dart';
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

class StaffDetailView extends GetView<StaffDetailController> {
  const StaffDetailView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kColorBackground,
      appBar: const CommonAppBarWidget(title: kStaffDetailTitle),
      body: Obx(() {
        final member = controller.member.value;
        if (member == null) {
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
                    text: member.fullName,
                    fontSize: TextStyles.k18FontSize,
                    color: kColorTitle,
                  ),
                  const SizedBox(height: 4),
                  AppText(
                    text: '${member.role.label} · ${member.status.label}',
                    fontSize: TextStyles.k12FontSize,
                    color: kColorTextSecondary,
                  ),
                  const SizedBox(height: 4),
                  AppText(
                    text: member.phone,
                    fontSize: TextStyles.k14FontSize,
                    color: kColorTextSecondary,
                  ),
                  if (member.email != null && member.email!.isNotEmpty) ...[
                    const SizedBox(height: 2),
                    AppText(
                      text: member.email!,
                      fontSize: TextStyles.k12FontSize,
                      color: kColorTextSecondary,
                    ),
                  ],
                  const SizedBox(height: 8),
                  AppText(
                    text:
                        '$kStaffJoinedLabel: ${AppointmentFormatUtils.formatDateLong(member.joinedAt)}',
                    fontSize: TextStyles.k12FontSize,
                    color: kColorTextSecondary,
                  ),
                ],
              ),
            ),
            if (member.shiftLabel != null && member.shiftLabel!.isNotEmpty) ...[
              Spacing.v16,
              AppText(
                text: '$kStaffShiftLabel: ${member.shiftLabel!}',
                fontSize: TextStyles.k14FontSize,
                color: kColorTextSecondary,
              ),
            ],
            if (member.permissionsSummary != null &&
                member.permissionsSummary!.isNotEmpty) ...[
              Spacing.v12,
              AppText(
                text: '$kStaffPermissionsLabel: ${member.permissionsSummary!}',
                fontSize: TextStyles.k14FontSize,
                color: kColorTextSecondary,
              ),
            ],
            if (member.notes != null && member.notes!.isNotEmpty) ...[
              Spacing.v12,
              AppText(
                text: '$kStaffNotesLabel: ${member.notes!}',
                fontSize: TextStyles.k14FontSize,
                color: kColorTextSecondary,
              ),
            ],
            Spacing.v16,
            appButton(
              onPressed: controller.onMarkActive,
              buttonText: kStaffMarkActiveButton,
              variant: AppButtonVariant.secondary,
            ),
            const SizedBox(height: 10),
            appButton(
              onPressed: controller.onMarkOnLeave,
              buttonText: kStaffMarkOnLeaveButton,
              variant: AppButtonVariant.secondary,
            ),
            const SizedBox(height: 10),
            appButton(
              onPressed: controller.onMarkInactive,
              buttonText: kStaffMarkInactiveButton,
              variant: AppButtonVariant.secondary,
            ),
            const SizedBox(height: 10),
            appButton(
              onPressed: controller.onResetAccess,
              buttonText: kStaffResetAccessButton,
              variant: AppButtonVariant.secondary,
            ),
            const SizedBox(height: 10),
            appButton(
              onPressed: controller.onEdit,
              buttonText: kStaffEditButton,
              variant: AppButtonVariant.secondary,
            ),
          ],
        );
      }),
    );
  }
}
