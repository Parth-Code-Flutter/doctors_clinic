import 'package:doctors_clinic/app/main/queue/controllers/queue_list_controller.dart';
import 'package:doctors_clinic/app/main/queue/data/queue_repository.dart';
import 'package:doctors_clinic/app/main/queue/widgets/queue_summary_strip.dart';
import 'package:doctors_clinic/app/main/queue/widgets/queue_token_tile.dart';
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

class QueueListView extends GetView<QueueListController> {
  const QueueListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kColorBackground,
      appBar: const CommonAppBarWidget(title: kQueueTitle),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: AppUIUtils.horizontalPadding.copyWith(top: 4, bottom: 10),
            child: Row(
              children: [
                const Expanded(
                  child: AppText(
                    text: kQueueSubtitle,
                    fontSize: TextStyles.k14FontSize,
                    color: kColorTextSecondary,
                  ),
                ),
                const SizedBox(width: 8),
                TabHeaderActionButton(
                  icon: Icons.tv_rounded,
                  tooltip: kQueueBoardTooltip,
                  onPressed: controller.onOpenBoard,
                ),
                const SizedBox(width: 8),
                TabHeaderActionButton(
                  icon: Icons.add_rounded,
                  tooltip: kQueueAddTooltip,
                  onPressed: controller.onAddToken,
                ),
              ],
            ),
          ),
          Padding(
            padding: AppUIUtils.horizontalPadding.copyWith(bottom: 12),
            child: Obx(
              () => QueueSummaryStrip(
                waitingCount: controller.waitingCount,
                withDoctorCount: controller.withDoctorCount,
                completedCount: controller.completedCount,
                skippedCount: controller.skippedCount,
              ),
            ),
          ),
          Padding(
            padding: AppUIUtils.horizontalPadding.copyWith(bottom: 12),
            child: AppTextField(
              controller: controller.searchController,
              hintText: kQueueSearchHint,
              textInputAction: TextInputAction.search,
              prefix: AppTextField.fieldIcon(Icons.search_rounded),
            ),
          ),
          _FilterRow(controller: controller),
          Expanded(
            child: Obx(() {
              final tokens = controller.filteredTokens;
              if (tokens.isEmpty) {
                return _EmptyState(
                  isSearch:
                      controller.searchQuery.value.isNotEmpty ||
                      controller.activeFilter.value != QueueListFilter.all,
                );
              }
              return ListView.separated(
                padding: AppUIUtils.horizontalPadding.copyWith(
                  top: 8,
                  bottom: 24,
                ),
                itemCount: tokens.length,
                separatorBuilder: (_, __) => const SizedBox(height: 10),
                itemBuilder: (context, index) {
                  final token = tokens[index];
                  return QueueTokenTile(
                    token: token,
                    onTap: () => controller.onTokenTap(token),
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

class _FilterRow extends StatelessWidget {
  const _FilterRow({required this.controller});

  final QueueListController controller;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        padding: AppUIUtils.horizontalPadding,
        child: Row(
          children: [
            _FilterChip(
              label: kQueueFilterWaiting,
              selected:
                  controller.activeFilter.value == QueueListFilter.waiting,
              onTap: () => controller.onFilterSelected(QueueListFilter.waiting),
            ),
            const SizedBox(width: 8),
            _FilterChip(
              label: kQueueFilterWithDoctor,
              selected:
                  controller.activeFilter.value == QueueListFilter.withDoctor,
              onTap: () =>
                  controller.onFilterSelected(QueueListFilter.withDoctor),
            ),
            const SizedBox(width: 8),
            _FilterChip(
              label: kQueueFilterPriority,
              selected:
                  controller.activeFilter.value == QueueListFilter.priority,
              onTap: () =>
                  controller.onFilterSelected(QueueListFilter.priority),
            ),
            const SizedBox(width: 8),
            _FilterChip(
              label: kQueueFilterCompleted,
              selected:
                  controller.activeFilter.value == QueueListFilter.completed,
              onTap: () =>
                  controller.onFilterSelected(QueueListFilter.completed),
            ),
            const SizedBox(width: 8),
            _FilterChip(
              label: kQueueFilterSkipped,
              selected:
                  controller.activeFilter.value == QueueListFilter.skipped,
              onTap: () => controller.onFilterSelected(QueueListFilter.skipped),
            ),
            const SizedBox(width: 8),
            _FilterChip(
              label: kQueueFilterAll,
              selected: controller.activeFilter.value == QueueListFilter.all,
              onTap: () => controller.onFilterSelected(QueueListFilter.all),
            ),
          ],
        ),
      ),
    );
  }
}

class _FilterChip extends StatelessWidget {
  const _FilterChip({
    required this.label,
    required this.selected,
    required this.onTap,
  });

  final String label;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return FilterChip(
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
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      padding: const EdgeInsets.symmetric(horizontal: 4),
    );
  }
}

class _EmptyState extends StatelessWidget {
  const _EmptyState({required this.isSearch});

  final bool isSearch;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: AppUIUtils.horizontalPadding,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.queue_outlined,
              size: 48,
              color: kColorTextSecondary.withValues(alpha: 0.6),
            ),
            const SizedBox(height: 12),
            const BoldText(
              text: kQueueEmptyTitle,
              fontSize: TextStyles.k16FontSize,
              color: kColorTitle,
              align: TextAlign.center,
            ),
            const SizedBox(height: 6),
            AppText(
              text: isSearch
                  ? kQueueEmptySearchSubtitle
                  : kQueueEmptyFilterSubtitle,
              fontSize: TextStyles.k14FontSize,
              color: kColorTextSecondary,
              align: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
