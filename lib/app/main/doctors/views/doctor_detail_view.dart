import 'package:doctors_clinic/app/main/doctors/controllers/doctor_detail_controller.dart';
import 'package:doctors_clinic/app/main/doctors/models/doctor_status.dart';
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

class DoctorDetailView extends GetView<DoctorDetailController> {
  const DoctorDetailView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kColorBackground,
      appBar: const CommonAppBarWidget(title: kDoctorDetailTitle),
      body: Obx(() {
        final doctor = controller.doctor.value;
        if (doctor == null) {
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
                    text: doctor.fullName,
                    fontSize: TextStyles.k18FontSize,
                    color: kColorTitle,
                  ),
                  const SizedBox(height: 4),
                  AppText(
                    text: '${doctor.specialization} · ${doctor.status.label}',
                    fontSize: TextStyles.k12FontSize,
                    color: kColorTextSecondary,
                  ),
                  const SizedBox(height: 4),
                  AppText(
                    text: doctor.phone,
                    fontSize: TextStyles.k14FontSize,
                    color: kColorTextSecondary,
                  ),
                  if (doctor.email != null && doctor.email!.isNotEmpty) ...[
                    const SizedBox(height: 2),
                    AppText(
                      text: doctor.email!,
                      fontSize: TextStyles.k12FontSize,
                      color: kColorTextSecondary,
                    ),
                  ],
                ],
              ),
            ),
            if (doctor.experienceLabel != null && doctor.experienceLabel!.isNotEmpty) ...[
              Spacing.v16,
              AppText(
                text: '$kDoctorExperienceLabel: ${doctor.experienceLabel!}',
                fontSize: TextStyles.k14FontSize,
                color: kColorTextSecondary,
              ),
            ],
            if (doctor.opdTimings != null && doctor.opdTimings!.isNotEmpty) ...[
              Spacing.v12,
              AppText(
                text: '$kDoctorOpdLabel: ${doctor.opdTimings!}',
                fontSize: TextStyles.k14FontSize,
                color: kColorTextSecondary,
              ),
            ],
            if (doctor.notes != null && doctor.notes!.isNotEmpty) ...[
              Spacing.v12,
              AppText(
                text: '$kDoctorNotesLabel: ${doctor.notes!}',
                fontSize: TextStyles.k14FontSize,
                color: kColorTextSecondary,
              ),
            ],
            Spacing.v16,
            appButton(
              onPressed: controller.onMarkAvailable,
              buttonText: kDoctorMarkAvailableButton,
              variant: AppButtonVariant.secondary,
            ),
            const SizedBox(height: 10),
            appButton(
              onPressed: controller.onMarkBusy,
              buttonText: kDoctorMarkBusyButton,
              variant: AppButtonVariant.secondary,
            ),
            const SizedBox(height: 10),
            appButton(
              onPressed: controller.onMarkOffDuty,
              buttonText: kDoctorMarkOffDutyButton,
              variant: AppButtonVariant.secondary,
            ),
            const SizedBox(height: 10),
            appButton(
              onPressed: controller.onEdit,
              buttonText: kDoctorEditButton,
              variant: AppButtonVariant.secondary,
            ),
          ],
        );
      }),
    );
  }
}
