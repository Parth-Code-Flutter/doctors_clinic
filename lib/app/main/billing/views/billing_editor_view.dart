import 'package:doctors_clinic/app/main/billing/controllers/billing_editor_controller.dart';
import 'package:doctors_clinic/constants/color_constants.dart';
import 'package:doctors_clinic/constants/string_constants.dart';
import 'package:doctors_clinic/utils/app_widgets/app_button.dart';
import 'package:doctors_clinic/utils/app_widgets/app_drop_down.dart';
import 'package:doctors_clinic/utils/app_widgets/app_spaces.dart';
import 'package:doctors_clinic/utils/app_widgets/app_text_field.dart';
import 'package:doctors_clinic/utils/app_widgets/common_app_bar_widget.dart';
import 'package:doctors_clinic/utils/text_utils/app_text.dart';
import 'package:doctors_clinic/utils/text_utils/text_styles.dart';
import 'package:doctors_clinic/utils/ui_utils/app_ui_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BillingEditorView extends GetView<BillingEditorController> {
  const BillingEditorView({super.key});

  String _inr(double value) => 'INR ${value.toStringAsFixed(0)}';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kColorBackground,
      appBar: const CommonAppBarWidget(title: kBillingEditorTitle),
      body: ListView(
        padding: AppUIUtils.horizontalPadding.copyWith(top: 8, bottom: 24),
        children: [
          const AppText(
            text: kBillingEditorSubtitle,
            fontSize: TextStyles.k14FontSize,
            color: kColorTextSecondary,
          ),
          const SizedBox(height: 14),
          Obx(
            () => AppDropDown<String>(
              value: controller.selectedPatientId.value,
              hint: kBillingPatientHint,
              items: controller.patients
                  .map(
                    (patient) => DropdownMenuItem<String>(
                      value: patient.id,
                      child: Text('${patient.fullName} · ${patient.phone}'),
                    ),
                  )
                  .toList(),
              onChanged: controller.onPatientChanged,
            ),
          ),
          Spacing.v12,
          AppTextField(
            controller: controller.serviceController,
            hintText: kBillingServiceHint,
            prefix: AppTextField.fieldIcon(Icons.medical_services_outlined),
          ),
          Spacing.v8,
          Row(
            children: [
              Expanded(
                child: AppTextField(
                  controller: controller.qtyController,
                  hintText: kBillingQtyHint,
                  textInputType: TextInputType.number,
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: AppTextField(
                  controller: controller.priceController,
                  hintText: kBillingPriceHint,
                  textInputType: const TextInputType.numberWithOptions(
                    decimal: true,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          SizedBox(
            height: 38,
            child: appButton(
              onPressed: controller.onAddLineItem,
              buttonText: kBillingAddItemButton,
              variant: AppButtonVariant.secondary,
              buttonHeight: 38,
              buttonWidth: 150,
            ),
          ),
          const SizedBox(height: 14),
          const SemiBoldText(
            text: kBillingItemsTitle,
            fontSize: TextStyles.k14FontSize,
            color: kColorTitle,
          ),
          Spacing.v8,
          Obx(() {
            if (controller.lineItems.isEmpty) {
              return const AppText(
                text: kBillingNoItemsText,
                fontSize: TextStyles.k12FontSize,
                color: kColorTextSecondary,
              );
            }
            return Column(
              children: List.generate(controller.lineItems.length, (index) {
                final item = controller.lineItems[index];
                return Container(
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
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SemiBoldText(
                              text: item.label,
                              fontSize: TextStyles.k14FontSize,
                              color: kColorTitle,
                            ),
                            const SizedBox(height: 3),
                            AppText(
                              text:
                                  '$kBillingQtyLabel: ${item.qty} · $kBillingPriceLabel: ${_inr(item.price)}',
                              fontSize: TextStyles.k12FontSize,
                              color: kColorTextSecondary,
                            ),
                          ],
                        ),
                      ),
                      AppText(
                        text: _inr(item.total),
                        fontSize: TextStyles.k12FontSize,
                        color: kColorTitle,
                      ),
                      IconButton(
                        onPressed: () => controller.onRemoveLineItem(index),
                        icon: const Icon(
                          Icons.close_rounded,
                          color: kColorAppointmentMissed,
                        ),
                      ),
                    ],
                  ),
                );
              }),
            );
          }),
          Spacing.v12,
          Row(
            children: [
              Expanded(
                child: AppTextField(
                  controller: controller.discountController,
                  hintText: kBillingDiscountHint,
                  textInputType: const TextInputType.numberWithOptions(
                    decimal: true,
                  ),
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: AppTextField(
                  controller: controller.paidController,
                  hintText: kBillingPaidHint,
                  textInputType: const TextInputType.numberWithOptions(
                    decimal: true,
                  ),
                ),
              ),
            ],
          ),
          Spacing.v12,
          Obx(
            () => AppDropDown<String>(
              value: controller.selectedPaymentMode.value,
              hint: kBillingPaymentModeHint,
              items: controller.paymentModes
                  .map(
                    (mode) => DropdownMenuItem<String>(
                      value: mode,
                      child: Text(mode),
                    ),
                  )
                  .toList(),
              onChanged: controller.onPaymentModeChanged,
            ),
          ),
          Spacing.v12,
          AppTextField(
            controller: controller.noteController,
            hintText: kBillingNoteHint,
            maxLines: 2,
            minLines: 2,
            prefix: AppTextField.fieldIcon(Icons.note_alt_outlined),
          ),
          const SizedBox(height: 14),
          Obx(
            () => Container(
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
                    text:
                        '$kBillingSubtotalLabel: ${_inr(controller.subTotal)}',
                    fontSize: TextStyles.k12FontSize,
                    color: kColorTextSecondary,
                  ),
                  const SizedBox(height: 3),
                  AppText(
                    text: '$kBillingTotalLabel: ${_inr(controller.total)}',
                    fontSize: TextStyles.k12FontSize,
                    color: kColorTitle,
                  ),
                  const SizedBox(height: 3),
                  AppText(
                    text: '$kBillingDueLabel: ${_inr(controller.due)}',
                    fontSize: TextStyles.k12FontSize,
                    color: kColorAppointmentMissed,
                  ),
                ],
              ),
            ),
          ),
          Spacing.v16,
          Obx(
            () => appButton(
              onPressed: controller.onSave,
              buttonText: kBillingSaveButton,
              isLoading: controller.isSaving.value,
            ),
          ),
        ],
      ),
    );
  }
}
