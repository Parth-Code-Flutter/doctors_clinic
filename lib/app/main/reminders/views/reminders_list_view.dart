import 'package:doctors_clinic/app/main/reminders/controllers/reminders_list_controller.dart';
import 'package:doctors_clinic/app/main/reminders/data/reminder_repository.dart';
import 'package:doctors_clinic/app/main/reminders/models/reminder_status.dart';
import 'package:doctors_clinic/app/main/reminders/widgets/reminder_list_tile.dart';
import 'package:doctors_clinic/app/main/reminders/widgets/reminder_summary_strip.dart';
import 'package:doctors_clinic/constants/color_constants.dart';
import 'package:doctors_clinic/constants/string_constants.dart';
import 'package:doctors_clinic/utils/app_widgets/app_text_field.dart';
import 'package:doctors_clinic/utils/app_widgets/common_app_bar_widget.dart';
import 'package:doctors_clinic/utils/text_utils/app_text.dart';
import 'package:doctors_clinic/utils/text_utils/text_styles.dart';
import 'package:doctors_clinic/utils/ui_utils/app_ui_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RemindersListView extends GetView<RemindersListController> {
  const RemindersListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kColorBackground,
      appBar: const CommonAppBarWidget(title: kRemindersTitle),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: AppUIUtils.horizontalPadding.copyWith(top: 4, bottom: 8),
            child: const AppText(
              text: kRemindersSubtitle,
              fontSize: TextStyles.k14FontSize,
              color: kColorTextSecondary,
            ),
          ),
          Padding(
            padding: AppUIUtils.horizontalPadding.copyWith(bottom: 12),
            child: Obx(
              () => ReminderSummaryStrip(
                scheduledCount: controller.scheduledCount,
                sentTodayCount: controller.sentTodayCount,
                failedCount: controller.failedCount,
              ),
            ),
          ),
          Padding(
            padding: AppUIUtils.horizontalPadding.copyWith(bottom: 12),
            child: AppTextField(
              controller: controller.searchController,
              hintText: kRemindersSearchHint,
              textInputAction: TextInputAction.search,
              prefix: AppTextField.fieldIcon(Icons.search_rounded),
            ),
          ),
          _FilterRow(controller: controller),
          Expanded(
            child: Obx(() {
              final reminders = controller.filteredReminders;
              if (reminders.isEmpty) {
                return _EmptyState(
                  isSearch:
                      controller.searchQuery.value.isNotEmpty ||
                      controller.activeFilter.value != ReminderListFilter.all,
                );
              }

              return ListView.separated(
                padding: AppUIUtils.horizontalPadding.copyWith(
                  top: 8,
                  bottom: 24,
                ),
                itemCount: reminders.length,
                separatorBuilder: (_, __) => const SizedBox(height: 10),
                itemBuilder: (context, index) {
                  final reminder = reminders[index];
                  return ReminderListTileCard(
                    reminder: reminder,
                    onTap: () => controller.onReminderTap(reminder),
                    onRetry: reminder.status == ReminderStatus.failed
                        ? () => controller.onRetry(reminder)
                        : null,
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

  final RemindersListController controller;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        padding: AppUIUtils.horizontalPadding,
        child: Row(
          children: [
            _FilterChip(
              label: kRemindersFilterToday,
              selected:
                  controller.activeFilter.value == ReminderListFilter.today,
              onTap: () =>
                  controller.onFilterSelected(ReminderListFilter.today),
            ),
            const SizedBox(width: 8),
            _FilterChip(
              label: kRemindersFilterScheduled,
              selected:
                  controller.activeFilter.value == ReminderListFilter.scheduled,
              onTap: () =>
                  controller.onFilterSelected(ReminderListFilter.scheduled),
            ),
            const SizedBox(width: 8),
            _FilterChip(
              label: kRemindersFilterSent,
              selected:
                  controller.activeFilter.value == ReminderListFilter.sent,
              onTap: () => controller.onFilterSelected(ReminderListFilter.sent),
            ),
            const SizedBox(width: 8),
            _FilterChip(
              label: kRemindersFilterFailed,
              selected:
                  controller.activeFilter.value == ReminderListFilter.failed,
              onTap: () =>
                  controller.onFilterSelected(ReminderListFilter.failed),
            ),
            const SizedBox(width: 8),
            _FilterChip(
              label: kRemindersFilterAll,
              selected: controller.activeFilter.value == ReminderListFilter.all,
              onTap: () => controller.onFilterSelected(ReminderListFilter.all),
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
              Icons.notifications_off_outlined,
              size: 48,
              color: kColorTextSecondary.withValues(alpha: 0.6),
            ),
            const SizedBox(height: 12),
            const BoldText(
              text: kRemindersEmptyTitle,
              fontSize: TextStyles.k16FontSize,
              color: kColorTitle,
              align: TextAlign.center,
            ),
            const SizedBox(height: 6),
            AppText(
              text: isSearch
                  ? kRemindersEmptySearchSubtitle
                  : kRemindersEmptyFilterSubtitle,
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
