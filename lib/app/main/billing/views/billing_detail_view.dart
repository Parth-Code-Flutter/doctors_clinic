import 'package:doctors_clinic/app/main/appointments/utils/appointment_format_utils.dart';
import 'package:doctors_clinic/app/main/billing/controllers/billing_detail_controller.dart';
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

class BillingDetailView extends GetView<BillingDetailController> {
  const BillingDetailView({super.key});

  String _inr(double value) => 'INR ${value.toStringAsFixed(0)}';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kColorBackground,
      appBar: const CommonAppBarWidget(title: kBillingDetailTitle),
      body: Obx(() {
        final receipt = controller.receipt.value;
        if (receipt == null) {
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
                    text: receipt.invoiceNumber,
                    fontSize: TextStyles.k16FontSize,
                    color: kColorTitle,
                  ),
                  const SizedBox(height: 4),
                  AppText(
                    text:
                        '${receipt.patientName} · ${receipt.patientPhone} · ${AppointmentFormatUtils.formatDateLong(receipt.createdAt)}',
                    fontSize: TextStyles.k12FontSize,
                    color: kColorTextSecondary,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 14),
            const SemiBoldText(
              text: kBillingItemsTitle,
              fontSize: TextStyles.k14FontSize,
              color: kColorTitle,
            ),
            const SizedBox(height: 8),
            ...receipt.items.map(
              (item) => Container(
                margin: const EdgeInsets.only(bottom: 8),
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: kColorSurface,
                  borderRadius: BorderRadius.circular(14),
                  border: Border.all(color: kColorBorder),
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: AppText(
                        text:
                            '${item.label} · ${item.qty} x ${_inr(item.price)}',
                        fontSize: TextStyles.k12FontSize,
                        color: kColorTextSecondary,
                      ),
                    ),
                    SemiBoldText(
                      text: _inr(item.total),
                      fontSize: TextStyles.k14FontSize,
                      color: kColorTitle,
                    ),
                  ],
                ),
              ),
            ),
            Spacing.v12,
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: kColorSurface,
                borderRadius: BorderRadius.circular(14),
                border: Border.all(color: kColorBorder),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppText(
                    text: '$kBillingSubtotalLabel: ${_inr(receipt.subTotal)}',
                    fontSize: TextStyles.k12FontSize,
                    color: kColorTextSecondary,
                  ),
                  const SizedBox(height: 3),
                  AppText(
                    text:
                        '$kBillingDiscountLabel: ${_inr(receipt.discountAmount)}',
                    fontSize: TextStyles.k12FontSize,
                    color: kColorTextSecondary,
                  ),
                  const SizedBox(height: 3),
                  AppText(
                    text: '$kBillingTotalLabel: ${_inr(receipt.total)}',
                    fontSize: TextStyles.k12FontSize,
                    color: kColorTitle,
                  ),
                  const SizedBox(height: 3),
                  AppText(
                    text:
                        '$kBillingCollectedLabel: ${_inr(receipt.paidAmount)}',
                    fontSize: TextStyles.k12FontSize,
                    color: kColorAppointmentSuccess,
                  ),
                  const SizedBox(height: 3),
                  AppText(
                    text: '$kBillingDueLabel: ${_inr(receipt.dueAmount)}',
                    fontSize: TextStyles.k12FontSize,
                    color: kColorAppointmentMissed,
                  ),
                  const SizedBox(height: 3),
                  AppText(
                    text: '$kBillingPaymentModeLabel: ${receipt.paymentMode}',
                    fontSize: TextStyles.k12FontSize,
                    color: kColorTextSecondary,
                  ),
                ],
              ),
            ),
            if (receipt.note != null && receipt.note!.isNotEmpty) ...[
              Spacing.v12,
              AppText(
                text: '$kBillingNoteLabel: ${receipt.note!}',
                fontSize: TextStyles.k12FontSize,
                color: kColorTextSecondary,
              ),
            ],
            Spacing.v16,
            appButton(
              onPressed: controller.onShare,
              buttonText: kBillingShareButton,
              variant: AppButtonVariant.secondary,
            ),
            const SizedBox(height: 10),
            appButton(
              onPressed: controller.onEdit,
              buttonText: kBillingEditButton,
              variant: AppButtonVariant.secondary,
            ),
          ],
        );
      }),
    );
  }
}
