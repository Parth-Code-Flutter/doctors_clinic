import 'package:doctors_clinic/app/main/queue/controllers/queue_token_detail_controller.dart';
import 'package:doctors_clinic/app/main/queue/models/queue_token_status.dart';
import 'package:doctors_clinic/app/main/queue/widgets/queue_status_chip.dart';
import 'package:doctors_clinic/constants/color_constants.dart';
import 'package:doctors_clinic/constants/string_constants.dart';
import 'package:doctors_clinic/utils/app_widgets/app_button.dart';
import 'package:doctors_clinic/utils/app_widgets/app_spaces.dart';
import 'package:doctors_clinic/utils/app_widgets/app_text_field.dart';
import 'package:doctors_clinic/utils/app_widgets/common_app_bar_widget.dart';
import 'package:doctors_clinic/utils/text_utils/app_text.dart';
import 'package:doctors_clinic/utils/text_utils/text_styles.dart';
import 'package:doctors_clinic/utils/ui_utils/app_ui_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class QueueTokenDetailView extends GetView<QueueTokenDetailController> {
  const QueueTokenDetailView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kColorBackground,
      appBar: const CommonAppBarWidget(title: kQueueDetailTitle),
      body: Obx(() {
        final token = controller.token.value;
        if (token == null) {
          return const SizedBox.shrink();
        }
        return ListView(
          padding: AppUIUtils.horizontalPadding.copyWith(top: 8, bottom: 24),
          children: [
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: kColorSurface,
                borderRadius: BorderRadius.circular(18),
                border: Border.all(color: kColorBorder),
              ),
              child: Row(
                children: [
                  Container(
                    width: 68,
                    height: 68,
                    decoration: BoxDecoration(
                      color: kColorBackground,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const AppText(
                          text: kQueueTokenShort,
                          fontSize: TextStyles.k12FontSize,
                          color: kColorTextSecondary,
                        ),
                        BoldText(
                          text: token.tokenNumber.toString(),
                          fontSize: TextStyles.k24FontSize,
                          color: kColorTitle,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 14),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SemiBoldText(
                          text: token.patientName,
                          fontSize: TextStyles.k18FontSize,
                          color: kColorTitle,
                        ),
                        const SizedBox(height: 4),
                        AppText(
                          text: token.patientPhone,
                          fontSize: TextStyles.k14FontSize,
                          color: kColorTextSecondary,
                        ),
                        const SizedBox(height: 8),
                        QueueStatusChip(status: token.status),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Spacing.v16,
            if (token.reason != null && token.reason!.isNotEmpty) ...[
              const SemiBoldText(
                text: kQueueReasonTitle,
                fontSize: TextStyles.k14FontSize,
                color: kColorTitle,
              ),
              const SizedBox(height: 6),
              AppText(
                text: token.reason!,
                fontSize: TextStyles.k14FontSize,
                color: kColorTextSecondary,
              ),
              Spacing.v16,
            ],
            const SemiBoldText(
              text: kQueueActionsTitle,
              fontSize: TextStyles.k14FontSize,
              color: kColorTitle,
            ),
            const SizedBox(height: 10),
            Wrap(
              spacing: 10,
              runSpacing: 10,
              children: [
                _StatusAction(
                  label: kQueueActionWaiting,
                  selected: token.status == QueueTokenStatus.waiting,
                  onTap: controller.onMarkWaiting,
                ),
                _StatusAction(
                  label: kQueueActionWithDoctor,
                  selected: token.status == QueueTokenStatus.withDoctor,
                  onTap: controller.onMarkWithDoctor,
                ),
                _StatusAction(
                  label: kQueueActionCompleted,
                  selected: token.status == QueueTokenStatus.completed,
                  onTap: controller.onMarkCompleted,
                ),
                _StatusAction(
                  label: kQueueActionSkipped,
                  selected: token.status == QueueTokenStatus.skipped,
                  onTap: controller.onMarkSkipped,
                ),
              ],
            ),
            Spacing.v20,
            AppTextField(
              controller: controller.notesController,
              hintText: kQueueNotesHint,
              maxLines: 3,
              minLines: 3,
              prefix: AppTextField.fieldIcon(Icons.note_alt_outlined),
            ),
            Spacing.v16,
            Obx(
              () => appButton(
                onPressed: controller.onSaveNotes,
                buttonText: kQueueSaveNotesButton,
                variant: AppButtonVariant.secondary,
                isLoading: controller.isSavingNotes.value,
              ),
            ),
          ],
        );
      }),
    );
  }
}

class _StatusAction extends StatelessWidget {
  const _StatusAction({
    required this.label,
    required this.selected,
    required this.onTap,
  });

  final String label;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return ChoiceChip(
      label: SemiBoldText(
        text: label,
        fontSize: TextStyles.k12FontSize,
        color: selected ? kColorLink : kColorTitle,
      ),
      selected: selected,
      onSelected: (_) => onTap(),
      showCheckmark: false,
      backgroundColor: kColorSurface,
      selectedColor: kColorSecondaryButtonBackground,
      side: BorderSide(color: selected ? kColorLink : kColorBorder),
    );
  }
}
