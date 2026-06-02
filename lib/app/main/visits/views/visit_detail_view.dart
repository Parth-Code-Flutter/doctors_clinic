import 'package:doctors_clinic/app/main/appointments/utils/appointment_format_utils.dart';
import 'package:doctors_clinic/app/main/visits/controllers/visit_detail_controller.dart';
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

class VisitDetailView extends GetView<VisitDetailController> {
  const VisitDetailView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kColorBackground,
      appBar: const CommonAppBarWidget(title: kVisitDetailTitle),
      body: Obx(() {
        final visit = controller.visit.value;
        if (visit == null) {
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
                    text: visit.patientName,
                    fontSize: TextStyles.k18FontSize,
                    color: kColorTitle,
                  ),
                  const SizedBox(height: 4),
                  AppText(
                    text: visit.patientPhone,
                    fontSize: TextStyles.k14FontSize,
                    color: kColorTextSecondary,
                  ),
                  const SizedBox(height: 8),
                  AppText(
                    text: AppointmentFormatUtils.formatDateLong(visit.visitAt),
                    fontSize: TextStyles.k12FontSize,
                    color: kColorTextSecondary,
                  ),
                ],
              ),
            ),
            Spacing.v16,
            _Section(
              title: kVisitComplaintSectionTitle,
              value: visit.chiefComplaint,
            ),
            _Section(
              title: kVisitClinicalNotesSectionTitle,
              value: visit.clinicalNotes,
            ),
            _Section(
              title: kVisitDiagnosisSectionTitle,
              value: visit.diagnosis,
            ),
            _Section(
              title: kVisitFollowUpSectionTitle,
              value: visit.followUpAdvice,
            ),
            if (visit.prescription.isNotEmpty) ...[
              const SemiBoldText(
                text: kVisitPrescriptionSectionTitle,
                fontSize: TextStyles.k16FontSize,
                color: kColorTitle,
              ),
              const SizedBox(height: 10),
              ...visit.prescription.map(
                (item) => Container(
                  margin: const EdgeInsets.only(bottom: 8),
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: kColorSurface,
                    borderRadius: BorderRadius.circular(14),
                    border: Border.all(color: kColorBorder),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SemiBoldText(
                        text: item.medicine,
                        fontSize: TextStyles.k14FontSize,
                        color: kColorTitle,
                      ),
                      const SizedBox(height: 3),
                      AppText(
                        text:
                            '${item.dosage} · ${item.frequency} · ${item.duration}',
                        fontSize: TextStyles.k12FontSize,
                        color: kColorTextSecondary,
                      ),
                      if (item.instructions != null &&
                          item.instructions!.isNotEmpty) ...[
                        const SizedBox(height: 3),
                        AppText(
                          text: item.instructions!,
                          fontSize: TextStyles.k12FontSize,
                          color: kColorTextSecondary,
                        ),
                      ],
                    ],
                  ),
                ),
              ),
            ],
            Spacing.v12,
            appButton(
              onPressed: controller.onCreateReceipt,
              buttonText: kBillingCreateFromVisitButton,
              variant: AppButtonVariant.secondary,
            ),
            const SizedBox(height: 10),
            appButton(
              onPressed: controller.onCreateFollowUp,
              buttonText: kFollowUpCreateFromVisitButton,
              variant: AppButtonVariant.secondary,
            ),
            const SizedBox(height: 10),
            appButton(
              onPressed: controller.onEdit,
              buttonText: kVisitEditButton,
              variant: AppButtonVariant.secondary,
            ),
          ],
        );
      }),
    );
  }
}

class _Section extends StatelessWidget {
  const _Section({required this.title, required this.value});

  final String title;
  final String? value;

  @override
  Widget build(BuildContext context) {
    if (value == null || value!.trim().isEmpty) {
      return const SizedBox.shrink();
    }
    return Padding(
      padding: const EdgeInsets.only(bottom: 14),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SemiBoldText(
            text: title,
            fontSize: TextStyles.k14FontSize,
            color: kColorTitle,
          ),
          const SizedBox(height: 6),
          AppText(
            text: value!,
            fontSize: TextStyles.k14FontSize,
            color: kColorTextSecondary,
          ),
        ],
      ),
    );
  }
}
