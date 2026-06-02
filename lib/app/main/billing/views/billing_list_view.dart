import 'package:doctors_clinic/app/main/billing/controllers/billing_list_controller.dart';
import 'package:doctors_clinic/constants/color_constants.dart';
import 'package:doctors_clinic/constants/string_constants.dart';
import 'package:doctors_clinic/utils/app_widgets/app_text_field.dart';
import 'package:doctors_clinic/utils/app_widgets/common_app_bar_widget.dart';
import 'package:doctors_clinic/utils/app_widgets/tab_header_action_button.dart';
import 'package:doctors_clinic/utils/text_utils/app_text.dart';
import 'package:doctors_clinic/utils/text_utils/text_styles.dart';
import 'package:doctors_clinic/utils/ui_utils/app_ui_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BillingListView extends GetView<BillingListController> {
  const BillingListView({super.key});

  String _inr(double value) => 'INR ${value.toStringAsFixed(0)}';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kColorBackground,
      appBar: const CommonAppBarWidget(title: kBillingTitle),
      body: Column(
        children: [
          Padding(
            padding: AppUIUtils.horizontalPadding.copyWith(top: 4, bottom: 10),
            child: Row(
              children: [
                const Expanded(
                  child: AppText(
                    text: kBillingSubtitle,
                    fontSize: TextStyles.k14FontSize,
                    color: kColorTextSecondary,
                  ),
                ),
                TabHeaderActionButton(
                  icon: Icons.add_rounded,
                  tooltip: kBillingAddTooltip,
                  onPressed: controller.onCreateReceipt,
                ),
              ],
            ),
          ),
          Padding(
            padding: AppUIUtils.horizontalPadding.copyWith(bottom: 12),
            child: Obx(
              () => Row(
                children: [
                  Expanded(
                    child: _SummaryCard(
                      title: kBillingSummaryInvoices,
                      value: controller.totalInvoices.toString(),
                      color: kColorLink,
                      bg: kColorSecondaryButtonBackground,
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: _SummaryCard(
                      title: kBillingSummaryCollected,
                      value: _inr(controller.totalCollected),
                      color: kColorAppointmentSuccess,
                      bg: const Color(0xFFDCFCE7),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: _SummaryCard(
                      title: kBillingSummaryDue,
                      value: _inr(controller.totalDue),
                      color: kColorAppointmentMissed,
                      bg: const Color(0xFFFEE2E2),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: AppUIUtils.horizontalPadding.copyWith(bottom: 10),
            child: AppTextField(
              controller: controller.searchController,
              hintText: kBillingSearchHint,
              textInputAction: TextInputAction.search,
              prefix: AppTextField.fieldIcon(Icons.search_rounded),
            ),
          ),
          Expanded(
            child: Obx(() {
              final list = controller.receipts;
              if (list.isEmpty) {
                return const Center(
                  child: AppText(
                    text: kBillingEmptyTitle,
                    fontSize: TextStyles.k14FontSize,
                    color: kColorTextSecondary,
                  ),
                );
              }
              return ListView.separated(
                padding: AppUIUtils.horizontalPadding.copyWith(
                  top: 8,
                  bottom: 24,
                ),
                itemCount: list.length,
                separatorBuilder: (_, __) => const SizedBox(height: 10),
                itemBuilder: (context, index) {
                  final receipt = list[index];
                  return Material(
                    color: kColorSurface,
                    borderRadius: BorderRadius.circular(16),
                    child: InkWell(
                      borderRadius: BorderRadius.circular(16),
                      onTap: () => controller.onReceiptTap(receipt),
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
                              child: const Icon(
                                Icons.receipt_long_rounded,
                                color: kColorLink,
                              ),
                            ),
                            const SizedBox(width: 12),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SemiBoldText(
                                    text:
                                        '${receipt.invoiceNumber} · ${receipt.patientName}',
                                    fontSize: TextStyles.k14FontSize,
                                    color: kColorTitle,
                                  ),
                                  const SizedBox(height: 3),
                                  AppText(
                                    text:
                                        '$kBillingCollectedLabel: ${_inr(receipt.paidAmount)} · $kBillingDueLabel: ${_inr(receipt.dueAmount)}',
                                    fontSize: TextStyles.k12FontSize,
                                    color: kColorTextSecondary,
                                  ),
                                ],
                              ),
                            ),
                            const Icon(
                              Icons.chevron_right_rounded,
                              color: kColorTextSecondary,
                            ),
                          ],
                        ),
                      ),
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

class _SummaryCard extends StatelessWidget {
  const _SummaryCard({
    required this.title,
    required this.value,
    required this.color,
    required this.bg,
  });

  final String title;
  final String value;
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
          SemiBoldText(
            text: value,
            fontSize: TextStyles.k16FontSize,
            color: color,
          ),
          const SizedBox(height: 4),
          AppText(
            text: title,
            fontSize: TextStyles.k12FontSize,
            color: kColorTextSecondary,
          ),
        ],
      ),
    );
  }
}
