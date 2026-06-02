import 'package:doctors_clinic/app/main/queue/controllers/queue_board_controller.dart';
import 'package:doctors_clinic/app/main/queue/models/queue_token_status.dart';
import 'package:doctors_clinic/constants/color_constants.dart';
import 'package:doctors_clinic/constants/string_constants.dart';
import 'package:doctors_clinic/utils/app_widgets/common_app_bar_widget.dart';
import 'package:doctors_clinic/utils/text_utils/app_text.dart';
import 'package:doctors_clinic/utils/text_utils/text_styles.dart';
import 'package:doctors_clinic/utils/ui_utils/app_ui_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class QueueBoardView extends GetView<QueueBoardController> {
  const QueueBoardView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kColorBackground,
      appBar: const CommonAppBarWidget(title: kQueueBoardTitle),
      body: Obx(() {
        final tokens = controller.activeTokens;
        final serving = controller.nowServing;
        return ListView(
          padding: AppUIUtils.horizontalPadding.copyWith(top: 8, bottom: 24),
          children: [
            Container(
              padding: const EdgeInsets.all(18),
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [kColorPrimary, kColorDashboardGradientEnd],
                ),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const AppText(
                    text: kQueueNowServingLabel,
                    fontSize: TextStyles.k12FontSize,
                    color: kColorOnPrimary,
                  ),
                  const SizedBox(height: 6),
                  BoldText(
                    text: serving == null
                        ? kQueueNowServingEmpty
                        : '$kQueueTokenShort ${serving.tokenNumber}',
                    fontSize: TextStyles.k28FontSize,
                    color: kColorOnPrimary,
                  ),
                  if (serving != null) ...[
                    const SizedBox(height: 4),
                    AppText(
                      text: serving.patientName,
                      fontSize: TextStyles.k16FontSize,
                      color: kColorOnPrimary,
                    ),
                  ],
                ],
              ),
            ),
            const SizedBox(height: 16),
            if (tokens.isEmpty)
              const Center(
                child: AppText(
                  text: kQueueBoardEmpty,
                  fontSize: TextStyles.k14FontSize,
                  color: kColorTextSecondary,
                ),
              )
            else
              ...tokens.map(
                (token) => Container(
                  margin: const EdgeInsets.only(bottom: 10),
                  padding: const EdgeInsets.all(14),
                  decoration: BoxDecoration(
                    color: kColorSurface,
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(color: kColorBorder),
                  ),
                  child: Row(
                    children: [
                      Container(
                        width: 56,
                        height: 56,
                        decoration: BoxDecoration(
                          color: kColorSecondaryButtonBackground,
                          borderRadius: BorderRadius.circular(14),
                        ),
                        child: Center(
                          child: BoldText(
                            text: token.tokenNumber.toString(),
                            fontSize: TextStyles.k20FontSize,
                            color: kColorTitle,
                          ),
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SemiBoldText(
                              text: token.patientName,
                              fontSize: TextStyles.k16FontSize,
                              color: kColorTitle,
                            ),
                            const SizedBox(height: 3),
                            AppText(
                              text: token.status.label,
                              fontSize: TextStyles.k12FontSize,
                              color: token.status.color,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
          ],
        );
      }),
    );
  }
}
