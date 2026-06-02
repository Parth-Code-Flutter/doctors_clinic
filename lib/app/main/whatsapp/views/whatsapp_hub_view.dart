import 'package:doctors_clinic/app/main/whatsapp/controllers/whatsapp_hub_controller.dart';
import 'package:doctors_clinic/constants/color_constants.dart';
import 'package:doctors_clinic/constants/string_constants.dart';
import 'package:doctors_clinic/utils/app_widgets/common_app_bar_widget.dart';
import 'package:doctors_clinic/utils/text_utils/app_text.dart';
import 'package:doctors_clinic/utils/text_utils/text_styles.dart';
import 'package:doctors_clinic/utils/ui_utils/app_ui_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WhatsAppHubView extends GetView<WhatsAppHubController> {
  const WhatsAppHubView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kColorBackground,
      appBar: const CommonAppBarWidget(title: kWhatsAppTitle),
      body: ListView(
        padding: AppUIUtils.horizontalPadding.copyWith(top: 8, bottom: 24),
        children: [
          const AppText(
            text: kWhatsAppSubtitle,
            fontSize: TextStyles.k14FontSize,
            color: kColorTextSecondary,
          ),
          const SizedBox(height: 14),
          Obx(
            () => Row(
              children: [
                Expanded(
                  child: _SummaryCard(
                    title: kWhatsAppSummaryTemplates,
                    value: controller.templateCount.toString(),
                    icon: Icons.description_outlined,
                    color: kColorLink,
                    bg: kColorSecondaryButtonBackground,
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: _SummaryCard(
                    title: kWhatsAppSummaryQueued,
                    value: controller.queuedCount.toString(),
                    icon: Icons.schedule_send_rounded,
                    color: kColorAppointmentPending,
                    bg: const Color(0xFFFEF3C7),
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: _SummaryCard(
                    title: kWhatsAppSummarySentToday,
                    value: controller.sentTodayCount.toString(),
                    icon: Icons.check_circle_outline_rounded,
                    color: kColorAppointmentSuccess,
                    bg: const Color(0xFFDCFCE7),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          _ActionCard(
            icon: Icons.text_snippet_outlined,
            title: kWhatsAppTemplatesTitle,
            subtitle: kWhatsAppTemplatesSubtitle,
            onTap: controller.onTemplates,
          ),
          const SizedBox(height: 10),
          _ActionCard(
            icon: Icons.send_rounded,
            title: kWhatsAppComposeTitle,
            subtitle: kWhatsAppComposeSubtitle,
            onTap: controller.onCompose,
          ),
          const SizedBox(height: 10),
          _ActionCard(
            icon: Icons.history_rounded,
            title: kWhatsAppLogsTitle,
            subtitle: kWhatsAppLogsSubtitle,
            onTap: controller.onLogs,
          ),
        ],
      ),
    );
  }
}

class _SummaryCard extends StatelessWidget {
  const _SummaryCard({
    required this.title,
    required this.value,
    required this.icon,
    required this.color,
    required this.bg,
  });

  final String title;
  final String value;
  final IconData icon;
  final Color color;
  final Color bg;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: bg,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: kColorBorder),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, size: 20, color: color),
          const SizedBox(height: 6),
          BoldText(
            text: value,
            fontSize: TextStyles.k18FontSize,
            color: kColorTitle,
          ),
          AppText(
            text: title,
            fontSize: TextStyles.k12FontSize,
            color: kColorTextSecondary,
            maxLines: 2,
          ),
        ],
      ),
    );
  }
}

class _ActionCard extends StatelessWidget {
  const _ActionCard({
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.onTap,
  });

  final IconData icon;
  final String title;
  final String subtitle;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: kColorSurface,
      borderRadius: BorderRadius.circular(16),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(16),
        child: Container(
          padding: const EdgeInsets.all(14),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: kColorBorder),
          ),
          child: Row(
            children: [
              Container(
                width: 44,
                height: 44,
                decoration: BoxDecoration(
                  color: kColorSecondaryButtonBackground,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(icon, color: kColorLink),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SemiBoldText(
                      text: title,
                      fontSize: TextStyles.k14FontSize,
                      color: kColorTitle,
                    ),
                    const SizedBox(height: 2),
                    AppText(
                      text: subtitle,
                      fontSize: TextStyles.k12FontSize,
                      color: kColorTextSecondary,
                    ),
                  ],
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
