import 'package:doctors_clinic/app/main/dashboard/widgets/dashboard_appointment_card.dart';
import 'package:doctors_clinic/app/main/dashboard/widgets/dashboard_hero_header.dart';
import 'package:doctors_clinic/app/main/dashboard/widgets/dashboard_quick_action_tile.dart';
import 'package:doctors_clinic/app/main/dashboard/widgets/dashboard_section_header.dart';
import 'package:doctors_clinic/app/main/dashboard/widgets/dashboard_stat_card.dart';
import 'package:doctors_clinic/constants/color_constants.dart';
import 'package:doctors_clinic/constants/string_constants.dart';
import 'package:doctors_clinic/utils/text_utils/app_text.dart';
import 'package:doctors_clinic/utils/text_utils/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/dashboard_controller.dart';

class DashboardView extends GetView<DashboardController> {
  const DashboardView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kColorBackground,
      body: SafeArea(
        bottom: false,
        child: RefreshIndicator(
          color: kColorLink,
          onRefresh: controller.onRefresh,
          child: CustomScrollView(
            physics: const AlwaysScrollableScrollPhysics(
              parent: BouncingScrollPhysics(),
            ),
            slivers: [
              SliverToBoxAdapter(
                child: Obx(
                  () => DashboardHeroHeader(
                    greeting: controller.greeting,
                    ownerName: controller.ownerName.value,
                    clinicName: controller.clinicName.value,
                    dateLabel: controller.formattedDate,
                  ),
                ),
              ),
              SliverToBoxAdapter(child: _buildStatsRow()),
              SliverToBoxAdapter(child: _buildQuickActions()),
              SliverToBoxAdapter(
                child: DashboardSectionHeader(
                  title: kDashboardTodayTitle,
                  actionLabel: controller.hasAppointmentsToday
                      ? kDashboardViewAll
                      : null,
                  onActionTap: controller.hasAppointmentsToday
                      ? controller.onViewAllAppointments
                      : null,
                ),
              ),
              _buildAppointmentsSliver(),
              const SliverToBoxAdapter(child: SizedBox(height: 24)),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildStatsRow() {
    return Obx(
      () => SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
        child: Row(
          children: [
            for (var i = 0; i < controller.stats.length; i++) ...[
              if (i > 0) const SizedBox(width: 12),
              DashboardStatCard(item: controller.stats[i]),
            ],
          ],
        ),
      ),
    );
  }

  Widget _buildQuickActions() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 8, 20, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.only(top: 8, bottom: 12),
            child: BoldText(
              text: kDashboardQuickActionsTitle,
              fontSize: TextStyles.k18FontSize,
              color: kColorTitle,
            ),
          ),
          Row(
            children: [
              Expanded(
                child: DashboardQuickActionTile(
                  title: kDashboardAddPatientAction,
                  subtitle: kDashboardAddPatientSubtitle,
                  icon: Icons.person_add_alt_1_rounded,
                  backgroundColor: kColorSecondaryButtonBackground,
                  iconColor: kColorLink,
                  borderColor: const Color(0xFFA5F3FC),
                  onTap: controller.onAddPatient,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: DashboardQuickActionTile(
                  title: kDashboardBookAppointmentAction,
                  subtitle: kDashboardBookAppointmentSubtitle,
                  icon: Icons.event_available_rounded,
                  backgroundColor: kColorSurface,
                  iconColor: kColorPrimary,
                  borderColor: kColorBorder,
                  onTap: controller.onBookAppointment,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildAppointmentsSliver() {
    return Obx(() {
      if (!controller.hasAppointmentsToday) {
        return SliverToBoxAdapter(
          child: DashboardEmptySchedule(
            onBookTap: controller.onBookAppointment,
          ),
        );
      }

      return SliverPadding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        sliver: SliverList.separated(
          itemCount: controller.todayAppointments.length,
          separatorBuilder: (_, __) => const SizedBox(height: 10),
          itemBuilder: (context, index) {
            final item = controller.todayAppointments[index];
            return DashboardAppointmentCard(
              item: item,
              onTap: () => controller.onAppointmentTap(item),
            );
          },
        ),
      );
    });
  }
}
