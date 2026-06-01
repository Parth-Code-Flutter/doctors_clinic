import 'package:doctors_clinic/app/main/patients/controllers/patient_profile_controller.dart';
import 'package:doctors_clinic/app/main/patients/models/patient_gender.dart';
import 'package:doctors_clinic/app/main/patients/models/patient_model.dart';
import 'package:doctors_clinic/app/main/patients/models/patient_visit_item.dart';
import 'package:doctors_clinic/app/main/patients/widgets/patient_avatar.dart';
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

class PatientProfileView extends GetView<PatientProfileController> {
  const PatientProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kColorBackground,
      appBar: const CommonAppBarWidget(title: kPatientProfileTitle),
      body: Obx(() {
        final patient = controller.patient.value;
        if (patient == null) {
          return const Center(child: CircularProgressIndicator());
        }

        return ListView(
          padding: AppUIUtils.horizontalPadding.copyWith(top: 8, bottom: 24),
          children: [
            _ProfileHero(patient: patient),
            Spacing.v16,
            Row(
              children: [
                Expanded(
                  child: appButton(
                    onPressed: controller.onCall,
                    buttonText: kPatientProfileCall,
                    variant: AppButtonVariant.secondary,
                    buttonIcon: const Icon(Icons.call_rounded, size: 20),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: appButton(
                    onPressed: controller.onBookVisit,
                    buttonText: kPatientProfileBookVisit,
                    buttonIcon: const Icon(
                      Icons.event_available_rounded,
                      size: 20,
                      color: kColorOnPrimary,
                    ),
                  ),
                ),
              ],
            ),
            Spacing.v12,
            appButton(
              onPressed: controller.onEdit,
              buttonText: kPatientProfileEdit,
              variant: AppButtonVariant.secondary,
            ),
            Spacing.v20,
            _InfoSection(patient: patient),
            Spacing.v20,
            const BoldText(
              text: kPatientProfileVisitsTitle,
              fontSize: TextStyles.k18FontSize,
              color: kColorTitle,
            ),
            Spacing.v12,
            if (controller.visits.isEmpty)
              const AppText(
                text: kPatientProfileNoVisits,
                fontSize: TextStyles.k14FontSize,
                color: kColorTextSecondary,
              )
            else
              ...controller.visits.map(
                (visit) => Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: _VisitCard(visit: visit),
                ),
              ),
          ],
        );
      }),
    );
  }
}

class _ProfileHero extends StatelessWidget {
  const _ProfileHero({required this.patient});

  final PatientModel patient;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [kColorPrimary, kColorDashboardGradientEnd],
        ),
        borderRadius: BorderRadius.circular(24),
        boxShadow: const [
          BoxShadow(
            color: kColorCardShadow,
            blurRadius: 20,
            offset: Offset(0, 10),
          ),
        ],
      ),
      child: Row(
        children: [
          PatientAvatar(
            initials: patient.initials,
            colorIndex: patient.avatarColorIndex,
            size: 64,
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                BoldText(
                  text: patient.fullName,
                  fontSize: TextStyles.k20FontSize,
                  color: kColorOnPrimary,
                ),
                const SizedBox(height: 4),
                AppText(
                  text: patient.phone,
                  fontSize: TextStyles.k14FontSize,
                  color: Colors.white.withValues(alpha: 0.85),
                ),
                const SizedBox(height: 8),
                Wrap(
                  spacing: 6,
                  children: [
                    _HeroChip(label: patient.gender.label),
                    if (patient.age != null)
                      _HeroChip(label: '${patient.age} yrs'),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _HeroChip extends StatelessWidget {
  const _HeroChip({required this.label});

  final String label;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.16),
        borderRadius: BorderRadius.circular(20),
      ),
      child: AppText(
        text: label,
        fontSize: TextStyles.k12FontSize,
        color: kColorOnPrimary,
      ),
    );
  }
}

class _InfoSection extends StatelessWidget {
  const _InfoSection({required this.patient});

  final PatientModel patient;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: kColorSurface,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: kColorBorder),
      ),
      child: Column(
        children: [
          if (patient.address != null && patient.address!.isNotEmpty)
            _InfoRow(
              icon: Icons.location_on_outlined,
              label: kPatientProfileAddressLabel,
              value: patient.address!,
            ),
          if (patient.notes != null && patient.notes!.isNotEmpty) ...[
            if (patient.address != null && patient.address!.isNotEmpty)
              const Divider(height: 20),
            _InfoRow(
              icon: Icons.sticky_note_2_outlined,
              label: kPatientProfileNotesLabel,
              value: patient.notes!,
            ),
          ],
        ],
      ),
    );
  }
}

class _InfoRow extends StatelessWidget {
  const _InfoRow({
    required this.icon,
    required this.label,
    required this.value,
  });

  final IconData icon;
  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(icon, size: 20, color: kColorLink),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppText(
                text: label,
                fontSize: TextStyles.k12FontSize,
                color: kColorTextSecondary,
              ),
              const SizedBox(height: 2),
              AppText(
                text: value,
                fontSize: TextStyles.k14FontSize,
                color: kColorTitle,
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _VisitCard extends StatelessWidget {
  const _VisitCard({required this.visit});

  final PatientVisitItem visit;

  @override
  Widget build(BuildContext context) {
    final statusColor =
        visit.isUpcoming ? kColorAppointmentPending : kColorAppointmentSuccess;

    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: kColorSurface,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: kColorBorder),
      ),
      child: Row(
        children: [
          Container(
            width: 48,
            padding: const EdgeInsets.symmetric(vertical: 8),
            decoration: BoxDecoration(
              color: kColorBackground,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              children: [
                Icon(
                  visit.isUpcoming
                      ? Icons.event_rounded
                      : Icons.check_circle_outline_rounded,
                  size: 18,
                  color: statusColor,
                ),
                const SizedBox(height: 4),
                SemiBoldText(
                  text: visit.timeLabel,
                  fontSize: TextStyles.k12FontSize,
                  color: kColorTitle,
                  align: TextAlign.center,
                ),
              ],
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SemiBoldText(
                  text: visit.dateLabel,
                  fontSize: TextStyles.k14FontSize,
                  color: kColorTitle,
                ),
                const SizedBox(height: 4),
                AppText(
                  text: visit.reason,
                  fontSize: TextStyles.k12FontSize,
                  color: kColorTextSecondary,
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            decoration: BoxDecoration(
              color: statusColor.withValues(alpha: 0.12),
              borderRadius: BorderRadius.circular(8),
            ),
            child: AppText(
              text: visit.statusLabel,
              fontSize: TextStyles.k12FontSize,
              color: statusColor,
            ),
          ),
        ],
      ),
    );
  }
}
