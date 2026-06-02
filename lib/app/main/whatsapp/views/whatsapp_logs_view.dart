import 'package:doctors_clinic/app/main/whatsapp/controllers/whatsapp_logs_controller.dart';
import 'package:doctors_clinic/app/main/whatsapp/models/whatsapp_log_status.dart';
import 'package:doctors_clinic/app/main/whatsapp/widgets/whatsapp_log_status_chip.dart';
import 'package:doctors_clinic/constants/color_constants.dart';
import 'package:doctors_clinic/constants/string_constants.dart';
import 'package:doctors_clinic/utils/app_widgets/app_text_field.dart';
import 'package:doctors_clinic/utils/app_widgets/common_app_bar_widget.dart';
import 'package:doctors_clinic/utils/text_utils/app_text.dart';
import 'package:doctors_clinic/utils/text_utils/text_styles.dart';
import 'package:doctors_clinic/utils/ui_utils/app_ui_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WhatsAppLogsView extends GetView<WhatsAppLogsController> {
  const WhatsAppLogsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kColorBackground,
      appBar: const CommonAppBarWidget(title: kWhatsAppLogsTitle),
      body: Column(
        children: [
          Padding(
            padding: AppUIUtils.horizontalPadding.copyWith(top: 8, bottom: 8),
            child: const AppText(
              text: kWhatsAppLogsSubtitle,
              fontSize: TextStyles.k14FontSize,
              color: kColorTextSecondary,
            ),
          ),
          Padding(
            padding: AppUIUtils.horizontalPadding.copyWith(bottom: 10),
            child: Obx(
              () => Row(
                children: [
                  Expanded(
                    child: _Summary(
                      label: kWhatsAppSummaryQueued,
                      value: controller.queuedCount.toString(),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: _Summary(
                      label: kWhatsAppSummarySentToday,
                      value: controller.sentTodayCount.toString(),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: _Summary(
                      label: kWhatsAppSummaryFailed,
                      value: controller.failedCount.toString(),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: AppUIUtils.horizontalPadding.copyWith(bottom: 12),
            child: AppTextField(
              controller: controller.searchController,
              hintText: kWhatsAppLogsSearchHint,
              textInputAction: TextInputAction.search,
              prefix: AppTextField.fieldIcon(Icons.search_rounded),
            ),
          ),
          Expanded(
            child: Obx(() {
              final logs = controller.filteredLogs;
              if (logs.isEmpty) {
                return const Center(
                  child: AppText(
                    text: kWhatsAppLogsEmpty,
                    fontSize: TextStyles.k14FontSize,
                    color: kColorTextSecondary,
                  ),
                );
              }
              return ListView.separated(
                padding: AppUIUtils.horizontalPadding.copyWith(bottom: 24),
                itemCount: logs.length,
                separatorBuilder: (_, __) => const SizedBox(height: 10),
                itemBuilder: (_, index) {
                  final log = logs[index];
                  return Container(
                    padding: const EdgeInsets.all(14),
                    decoration: BoxDecoration(
                      color: kColorSurface,
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(color: kColorBorder),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: SemiBoldText(
                                text: log.patientName,
                                fontSize: TextStyles.k14FontSize,
                                color: kColorTitle,
                              ),
                            ),
                            WhatsAppLogStatusChip(status: log.status),
                          ],
                        ),
                        const SizedBox(height: 4),
                        AppText(
                          text: '${log.patientPhone} · ${log.templateTitle}',
                          fontSize: TextStyles.k12FontSize,
                          color: kColorTextSecondary,
                        ),
                        const SizedBox(height: 8),
                        AppText(
                          text: log.preview,
                          fontSize: TextStyles.k12FontSize,
                          color: kColorTextSecondary,
                          maxLines: 2,
                        ),
                        if (log.failureReason != null &&
                            log.failureReason!.isNotEmpty) ...[
                          const SizedBox(height: 8),
                          AppText(
                            text: log.failureReason!,
                            fontSize: TextStyles.k12FontSize,
                            color: kColorAppointmentMissed,
                            maxLines: 2,
                          ),
                        ],
                        if (log.status == WhatsAppLogStatus.failed) ...[
                          const SizedBox(height: 8),
                          Align(
                            alignment: Alignment.centerRight,
                            child: TextButton.icon(
                              onPressed: () => controller.onRetry(log),
                              icon: const Icon(Icons.refresh_rounded, size: 18),
                              label: const Text(kWhatsAppRetryButton),
                            ),
                          ),
                        ],
                      ],
                    ),
                  );
                },
              );
            }),
          ),
        ],
      ),
    );
  }
}

class _Summary extends StatelessWidget {
  const _Summary({required this.label, required this.value});
  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: kColorSurface,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: kColorBorder),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          BoldText(
            text: value,
            fontSize: TextStyles.k18FontSize,
            color: kColorTitle,
          ),
          AppText(
            text: label,
            fontSize: TextStyles.k12FontSize,
            color: kColorTextSecondary,
          ),
        ],
      ),
    );
  }
}
