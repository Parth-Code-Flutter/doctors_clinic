import 'package:doctors_clinic/app/main/staff/controllers/staff_list_controller.dart';
import 'package:doctors_clinic/app/main/staff/data/staff_repository.dart';
import 'package:doctors_clinic/app/main/staff/models/staff_role.dart';
import 'package:doctors_clinic/app/main/staff/models/staff_status.dart';
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

class StaffListView extends GetView<StaffListController> {
  const StaffListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kColorBackground,
      appBar: const CommonAppBarWidget(title: kStaffTitle),
      body: Column(
        children: [
          Padding(
            padding: AppUIUtils.horizontalPadding.copyWith(top: 4, bottom: 10),
            child: Row(
              children: [
                const Expanded(
                  child: AppText(
                    text: kStaffSubtitle,
                    fontSize: TextStyles.k14FontSize,
                    color: kColorTextSecondary,
                  ),
                ),
                TabHeaderActionButton(
                  icon: Icons.add_rounded,
                  tooltip: kStaffAddTooltip,
                  onPressed: controller.onAddStaff,
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
                      title: kStaffSummaryTotal,
                      value: controller.totalCount.toString(),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: _SummaryCard(
                      title: kStaffSummaryActive,
                      value: controller.activeCount.toString(),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: _SummaryCard(
                      title: kStaffSummaryLeave,
                      value: controller.onLeaveCount.toString(),
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
              hintText: kStaffSearchHint,
              textInputAction: TextInputAction.search,
              prefix: AppTextField.fieldIcon(Icons.search_rounded),
            ),
          ),
          _FilterRow(controller: controller),
          Expanded(
            child: Obx(() {
              final list = controller.filteredMembers;
              if (list.isEmpty) {
                return const Center(
                  child: AppText(
                    text: kStaffEmptyTitle,
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
                  final member = list[index];
                  return Material(
                    color: kColorSurface,
                    borderRadius: BorderRadius.circular(16),
                    child: InkWell(
                      borderRadius: BorderRadius.circular(16),
                      onTap: () => controller.onMemberTap(member),
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
                                Icons.badge_outlined,
                                color: kColorLink,
                              ),
                            ),
                            const SizedBox(width: 12),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SemiBoldText(
                                    text: member.fullName,
                                    fontSize: TextStyles.k14FontSize,
                                    color: kColorTitle,
                                  ),
                                  const SizedBox(height: 2),
                                  AppText(
                                    text:
                                        '${member.role.label} · ${member.status.label}',
                                    fontSize: TextStyles.k12FontSize,
                                    color: kColorTextSecondary,
                                  ),
                                  const SizedBox(height: 2),
                                  AppText(
                                    text: member.phone,
                                    fontSize: TextStyles.k12FontSize,
                                    color: kColorTextSecondary,
                                  ),
                                ],
                              ),
                            ),
                            if (member.status != StaffStatus.inactive)
                              TextButton(
                                onPressed: () =>
                                    controller.onQuickDeactivate(member),
                                child: const AppText(
                                  text: kStaffDeactivateShort,
                                  fontSize: TextStyles.k12FontSize,
                                  color: kColorAppointmentMissed,
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
  final StaffListController controller;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        padding: AppUIUtils.horizontalPadding,
        child: Row(
          children: [
            _chip(
              kStaffFilterActive,
              controller.activeFilter.value == StaffListFilter.active,
              () => controller.onFilterSelected(StaffListFilter.active),
            ),
            const SizedBox(width: 8),
            _chip(
              kStaffFilterOnLeave,
              controller.activeFilter.value == StaffListFilter.onLeave,
              () => controller.onFilterSelected(StaffListFilter.onLeave),
            ),
            const SizedBox(width: 8),
            _chip(
              kStaffFilterInactive,
              controller.activeFilter.value == StaffListFilter.inactive,
              () => controller.onFilterSelected(StaffListFilter.inactive),
            ),
            const SizedBox(width: 8),
            _chip(
              kStaffFilterAll,
              controller.activeFilter.value == StaffListFilter.all,
              () => controller.onFilterSelected(StaffListFilter.all),
            ),
          ],
        ),
      ),
    );
  }

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
