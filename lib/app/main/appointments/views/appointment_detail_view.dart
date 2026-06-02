import 'package:doctors_clinic/app/main/appointments/controllers/appointment_detail_controller.dart';
import 'package:doctors_clinic/app/main/appointments/models/appointment_status.dart';
import 'package:doctors_clinic/app/main/appointments/utils/appointment_format_utils.dart';
import 'package:doctors_clinic/app/main/appointments/widgets/appointment_status_chip.dart';
import 'package:doctors_clinic/app/main/patients/widgets/patient_avatar.dart';
import 'package:doctors_clinic/constants/color_constants.dart';
import 'package:doctors_clinic/constants/string_constants.dart';
import 'package:doctors_clinic/utils/app_widgets/app_button.dart'
    show AppButtonVariant, appButton;
import 'package:doctors_clinic/utils/app_widgets/app_spaces.dart';
import 'package:doctors_clinic/utils/app_widgets/common_app_bar_widget.dart';
import 'package:doctors_clinic/utils/text_utils/app_text.dart';
import 'package:doctors_clinic/utils/text_utils/text_styles.dart';
import 'package:doctors_clinic/utils/ui_utils/app_ui_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppointmentDetailView extends GetView<AppointmentDetailController> {
  const AppointmentDetailView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kColorBackground,
      appBar: const CommonAppBarWidget(title: kAppointmentDetailTitle),
      body: Obx(() {
        final item = controller.appointment.value;
        if (item == null) {
          return const Center(child: CircularProgressIndicator());
        }

        final initials = item.patientName.trim().isNotEmpty
            ? item.patientName.trim().split(' ').map((p) => p[0]).take(2).join()
            : '?';

        return ListView(
          padding: AppUIUtils.horizontalPadding.copyWith(top: 8, bottom: 24),
          children: [
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [kColorPrimary, kColorDashboardGradientEnd],
                ),
                borderRadius: BorderRadius.circular(24),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      PatientAvatar(
                        initials: initials.toUpperCase(),
                        colorIndex: item.patientName.hashCode,
                        size: 56,
                      ),
                      const SizedBox(width: 14),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            BoldText(
                              text: item.patientName,
                              fontSize: TextStyles.k20FontSize,
                              color: kColorOnPrimary,
                            ),
                            AppText(
                              text: item.patientPhone,
                              fontSize: TextStyles.k14FontSize,
                              color: Colors.white.withValues(alpha: 0.85),
                            ),
                          ],
                        ),
                      ),
                      AppointmentStatusChip(status: item.status),
                    ],
                  ),
                  const SizedBox(height: 16),
                  _HeroRow(
                    icon: Icons.calendar_month_rounded,
                    label: AppointmentFormatUtils.formatDateLong(
                      item.scheduledAt,
                    ),
                  ),
                  const SizedBox(height: 8),
                  _HeroRow(
                    icon: Icons.schedule_rounded,
                    label: AppointmentFormatUtils.formatTime(item.scheduledAt),
                  ),
                  if (item.doctorName != null && item.doctorName!.isNotEmpty) ...[
                    const SizedBox(height: 8),
                    _HeroRow(
                      icon: Icons.medical_services_outlined,
                      label: '$kAppointmentDetailDoctorLabel: ${item.doctorName!}',
                    ),
                  ],
                  if (item.reason != null && item.reason!.isNotEmpty) ...[
                    const SizedBox(height: 8),
                    _HeroRow(
                      icon: Icons.medical_services_outlined,
                      label: item.reason!,
                    ),
                  ],
                ],
              ),
            ),
            Spacing.v16,
            Row(
              children: [
                Expanded(
                  child: appButton(
                    onPressed: controller.onCallPatient,
                    buttonText: kAppointmentDetailCall,
                    variant: AppButtonVariant.secondary,
                    buttonIcon: const Icon(Icons.call_rounded, size: 20),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: appButton(
                    onPressed: controller.onSendReminder,
                    buttonText: kAppointmentDetailSendReminder,
                    variant: AppButtonVariant.secondary,
                    buttonIcon: Icon(
                      item.reminderSent
                          ? Icons.mark_email_read_outlined
                          : Icons.notifications_active_outlined,
                      size: 20,
                      color: kColorLink,
                    ),
                  ),
                ),
              ],
            ),
            Spacing.v12,
            appButton(
              onPressed: controller.onVisitNotes,
              buttonText: kAppointmentDetailVisitNoteButton,
              variant: AppButtonVariant.secondary,
              buttonIcon: const Icon(Icons.note_alt_outlined, size: 20),
            ),
            Spacing.v16,
            if (item.status == AppointmentStatus.upcoming ||
                item.status == AppointmentStatus.inProgress) ...[
              appButton(
                onPressed: controller.onMarkCompleted,
                buttonText: kAppointmentDetailMarkComplete,
              ),
              Spacing.v12,
              appButton(
                onPressed: controller.onMarkMissed,
                buttonText: kAppointmentDetailMarkMissed,
                variant: AppButtonVariant.secondary,
              ),
              Spacing.v12,
              appButton(
                onPressed: controller.onCancel,
                buttonText: kAppointmentDetailCancel,
                variant: AppButtonVariant.secondary,
              ),
            ],
            if (item.notes != null && item.notes!.isNotEmpty) ...[
              Spacing.v8,
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(14),
                decoration: BoxDecoration(
                  color: kColorSurface,
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: kColorBorder),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SemiBoldText(
                      text: kAddAppointmentNotesHint,
                      fontSize: TextStyles.k12FontSize,
                      color: kColorTextSecondary,
                    ),
                    const SizedBox(height: 6),
                    AppText(
                      text: item.notes!,
                      fontSize: TextStyles.k14FontSize,
                      color: kColorTitle,
                    ),
                  ],
                ),
              ),
            ],
          ],
        );
      }),
    );
  }
}

class _HeroRow extends StatelessWidget {
  const _HeroRow({required this.icon, required this.label});

  final IconData icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, size: 18, color: kColorLogoIcon),
        const SizedBox(width: 10),
        Expanded(
          child: SemiBoldText(
            text: label,
            fontSize: TextStyles.k14FontSize,
            color: kColorOnPrimary,
          ),
        ),
      ],
    );
  }
}
