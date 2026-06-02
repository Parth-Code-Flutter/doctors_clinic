import 'package:doctors_clinic/app/main/followups/controllers/follow_up_list_controller.dart';
import 'package:doctors_clinic/app/main/followups/data/follow_up_repository.dart';
import 'package:doctors_clinic/app/main/followups/models/follow_up_status.dart';
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

class FollowUpListView extends GetView<FollowUpListController> {
  const FollowUpListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kColorBackground,
      appBar: const CommonAppBarWidget(title: kFollowUpTitle),
      body: Column(
        children: [
          Padding(
            padding: AppUIUtils.horizontalPadding.copyWith(top: 4, bottom: 10),
            child: Row(
              children: [
                const Expanded(
                  child: AppText(
                    text: kFollowUpSubtitle,
                    fontSize: TextStyles.k14FontSize,
                    color: kColorTextSecondary,
                  ),
                ),
                TabHeaderActionButton(
                  icon: Icons.add_rounded,
                  tooltip: kFollowUpAddTooltip,
                  onPressed: controller.onCreate,
                ),
              ],
            ),
          ),
          Padding(
            padding: AppUIUtils.horizontalPadding.copyWith(bottom: 10),
            child: Obx(
              () => Row(
                children: [
                  Expanded(
                    child: _SummaryCard(
                      title: kFollowUpSummaryToday,
                      value: controller.todayCount.toString(),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: _SummaryCard(
                      title: kFollowUpSummaryUpcoming,
                      value: controller.upcomingCount.toString(),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: _SummaryCard(
                      title: kFollowUpSummaryCompleted,
                      value: controller.completedCount.toString(),
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
              hintText: kFollowUpSearchHint,
              textInputAction: TextInputAction.search,
              prefix: AppTextField.fieldIcon(Icons.search_rounded),
            ),
          ),
          _FilterRow(controller: controller),
          Expanded(
            child: Obx(() {
              final list = controller.filteredItems;
              if (list.isEmpty) {
                return const Center(
                  child: AppText(
                    text: kFollowUpEmptyTitle,
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
                  final item = list[index];
                  return Material(
                    color: kColorSurface,
                    borderRadius: BorderRadius.circular(16),
                    child: InkWell(
                      onTap: () => controller.onTap(item),
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
                              child: const Icon(
                                Icons.event_repeat_rounded,
                                color: kColorLink,
                              ),
                            ),
                            const SizedBox(width: 12),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SemiBoldText(
                                    text: item.patientName,
                                    fontSize: TextStyles.k14FontSize,
                                    color: kColorTitle,
                                  ),
                                  const SizedBox(height: 2),
                                  AppText(
                                    text: item.reason ?? kFollowUpNoReason,
                                    fontSize: TextStyles.k12FontSize,
                                    color: kColorTextSecondary,
                                  ),
                                  const SizedBox(height: 3),
                                  AppText(
                                    text: item.status.label,
                                    fontSize: TextStyles.k12FontSize,
                                    color: kColorTextSecondary,
                                  ),
                                ],
                              ),
                            ),
                            if (item.status.name == 'scheduled')
                              TextButton(
                                onPressed: () =>
                                    controller.onMarkCompleted(item),
                                child: const AppText(
                                  text: kFollowUpMarkDoneShort,
                                  fontSize: TextStyles.k12FontSize,
                                  color: kColorLink,
                                ),
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
  const _SummaryCard({required this.title, required this.value});

  final String title;
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
          SemiBoldText(
            text: value,
            fontSize: TextStyles.k16FontSize,
            color: kColorTitle,
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

class _FilterRow extends StatelessWidget {
  const _FilterRow({required this.controller});
  final FollowUpListController controller;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        padding: AppUIUtils.horizontalPadding,
        child: Row(
          children: [
            _chip(
              kFollowUpFilterToday,
              controller.activeFilter.value == FollowUpListFilter.today,
              () => controller.onFilterSelected(FollowUpListFilter.today),
            ),
            _gap(),
            _chip(
              kFollowUpFilterUpcoming,
              controller.activeFilter.value == FollowUpListFilter.upcoming,
              () => controller.onFilterSelected(FollowUpListFilter.upcoming),
            ),
            _gap(),
            _chip(
              kFollowUpFilterCompleted,
              controller.activeFilter.value == FollowUpListFilter.completed,
              () => controller.onFilterSelected(FollowUpListFilter.completed),
            ),
            _gap(),
            _chip(
              kFollowUpFilterMissed,
              controller.activeFilter.value == FollowUpListFilter.missed,
              () => controller.onFilterSelected(FollowUpListFilter.missed),
            ),
            _gap(),
            _chip(
              kFollowUpFilterAll,
              controller.activeFilter.value == FollowUpListFilter.all,
              () => controller.onFilterSelected(FollowUpListFilter.all),
            ),
          ],
        ),
      ),
    );
  }

  Widget _gap() => const SizedBox(width: 8);

  Widget _chip(String label, bool selected, VoidCallback onTap) {
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
