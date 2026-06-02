import 'package:doctors_clinic/app/main/reports/controllers/reports_dashboard_controller.dart';
import 'package:doctors_clinic/constants/color_constants.dart';
import 'package:doctors_clinic/constants/string_constants.dart';
import 'package:doctors_clinic/utils/app_widgets/app_drop_down.dart';
import 'package:doctors_clinic/utils/app_widgets/common_app_bar_widget.dart';
import 'package:doctors_clinic/utils/text_utils/app_text.dart';
import 'package:doctors_clinic/utils/text_utils/text_styles.dart';
import 'package:doctors_clinic/utils/ui_utils/app_ui_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ReportsDashboardView extends GetView<ReportsDashboardController> {
  const ReportsDashboardView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kColorBackground,
      appBar: const CommonAppBarWidget(title: kReportsTitle),
      body: Obx(
        () => ListView(
          padding: AppUIUtils.horizontalPadding.copyWith(top: 8, bottom: 24),
          children: [
            const AppText(
              text: kReportsSubtitle,
              fontSize: TextStyles.k14FontSize,
              color: kColorTextSecondary,
            ),
            const SizedBox(height: 12),
            AppDropDown<String>(
              value: controller.selectedRange.value,
              items: controller.ranges
                  .map((range) => DropdownMenuItem(value: range, child: Text(range)))
                  .toList(),
              onChanged: controller.onRangeChanged,
            ),
            const SizedBox(height: 14),
            Wrap(
              spacing: 10,
              runSpacing: 10,
              children: controller.kpis
                  .map(
                    (item) => Container(
                      width: (MediaQuery.sizeOf(context).width - 54) / 2,
                      padding: const EdgeInsets.all(14),
                      decoration: BoxDecoration(
                        color: kColorSurface,
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(color: kColorBorder),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Icon(item.icon, color: item.color),
                          const SizedBox(height: 8),
                          SemiBoldText(
                            text: item.value,
                            fontSize: TextStyles.k18FontSize,
                            color: kColorTitle,
                          ),
                          const SizedBox(height: 4),
                          AppText(
                            text: item.title,
                            fontSize: TextStyles.k12FontSize,
                            color: kColorTextSecondary,
                          ),
                        ],
                      ),
                    ),
                  )
                  .toList(),
            ),
            const SizedBox(height: 16),
            const SemiBoldText(
              text: kReportsTrendTitle,
              fontSize: TextStyles.k16FontSize,
              color: kColorTitle,
            ),
            const SizedBox(height: 10),
            ...controller.trends.map(
              (trend) => Container(
                margin: const EdgeInsets.only(bottom: 8),
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: kColorSurface,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: kColorBorder),
                ),
                child: Row(
                  children: [
                    SizedBox(
                      width: 34,
                      child: SemiBoldText(
                        text: trend.label,
                        fontSize: TextStyles.k12FontSize,
                        color: kColorTitle,
                      ),
                    ),
                    Expanded(
                      child: AppText(
                        text:
                            '${trend.visits} visits · INR ${trend.revenue} · ${trend.noShows} no-shows',
                        fontSize: TextStyles.k14FontSize,
                        color: kColorTextSecondary,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 6),
            _ActionTile(
              icon: Icons.receipt_long_outlined,
              title: kReportsActionBilling,
              onTap: controller.onOpenBilling,
            ),
            const SizedBox(height: 8),
            _ActionTile(
              icon: Icons.event_repeat_outlined,
              title: kReportsActionFollowUp,
              onTap: controller.onOpenFollowUps,
            ),
          ],
        ),
      ),
    );
  }
}

class _ActionTile extends StatelessWidget {
  const _ActionTile({required this.icon, required this.title, required this.onTap});
  final IconData icon;
  final String title;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: kColorSurface,
      borderRadius: BorderRadius.circular(12),
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: kColorBorder),
          ),
          child: Row(
            children: [
              Icon(icon, color: kColorLink),
              const SizedBox(width: 10),
              Expanded(
                child: SemiBoldText(
                  text: title,
                  fontSize: TextStyles.k14FontSize,
                  color: kColorTitle,
                ),
              ),
              const Icon(Icons.chevron_right_rounded, color: kColorTextSecondary),
            ],
          ),
        ),
      ),
    );
  }
}
