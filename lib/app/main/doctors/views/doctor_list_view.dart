import 'package:doctors_clinic/app/main/doctors/controllers/doctor_list_controller.dart';
import 'package:doctors_clinic/app/main/doctors/data/doctor_repository.dart';
import 'package:doctors_clinic/app/main/doctors/models/doctor_status.dart';
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

class DoctorListView extends GetView<DoctorListController> {
  const DoctorListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kColorBackground,
      appBar: const CommonAppBarWidget(title: kDoctorTitle),
      body: Column(
        children: [
          Padding(
            padding: AppUIUtils.horizontalPadding.copyWith(top: 4, bottom: 10),
            child: Row(
              children: [
                const Expanded(
                  child: AppText(
                    text: kDoctorSubtitle,
                    fontSize: TextStyles.k14FontSize,
                    color: kColorTextSecondary,
                  ),
                ),
                TabHeaderActionButton(
                  icon: Icons.add_rounded,
                  tooltip: kDoctorAddTooltip,
                  onPressed: controller.onAddDoctor,
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
                      title: kDoctorSummaryTotal,
                      value: controller.totalCount.toString(),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: _SummaryCard(
                      title: kDoctorSummaryAvailable,
                      value: controller.availableCount.toString(),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: _SummaryCard(
                      title: kDoctorSummaryBusy,
                      value: controller.busyCount.toString(),
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
              hintText: kDoctorSearchHint,
              textInputAction: TextInputAction.search,
              prefix: AppTextField.fieldIcon(Icons.search_rounded),
            ),
          ),
          _FilterRow(controller: controller),
          Expanded(
            child: Obx(() {
              final list = controller.filteredDoctors;
              if (list.isEmpty) {
                return const Center(
                  child: AppText(
                    text: kDoctorEmptyTitle,
                    fontSize: TextStyles.k14FontSize,
                    color: kColorTextSecondary,
                  ),
                );
              }
              return ListView.separated(
                padding: AppUIUtils.horizontalPadding.copyWith(top: 8, bottom: 24),
                itemCount: list.length,
                separatorBuilder: (_, __) => const SizedBox(height: 10),
                itemBuilder: (context, index) {
                  final doctor = list[index];
                  return Material(
                    color: kColorSurface,
                    borderRadius: BorderRadius.circular(16),
                    child: InkWell(
                      borderRadius: BorderRadius.circular(16),
                      onTap: () => controller.onDoctorTap(doctor),
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
                              child: const Icon(Icons.medical_services_outlined, color: kColorLink),
                            ),
                            const SizedBox(width: 12),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SemiBoldText(
                                    text: doctor.fullName,
                                    fontSize: TextStyles.k14FontSize,
                                    color: kColorTitle,
                                  ),
                                  const SizedBox(height: 2),
                                  AppText(
                                    text:
                                        '${doctor.specialization} · ${doctor.status.label}',
                                    fontSize: TextStyles.k12FontSize,
                                    color: kColorTextSecondary,
                                  ),
                                ],
                              ),
                            ),
                            if (doctor.status != DoctorStatus.offDuty)
                              TextButton(
                                onPressed: () => controller.onQuickOffDuty(doctor),
                                child: const AppText(
                                  text: kDoctorOffDutyShort,
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
  final DoctorListController controller;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        padding: AppUIUtils.horizontalPadding,
        child: Row(
          children: [
            _chip(
              kDoctorFilterAvailable,
              controller.activeFilter.value == DoctorListFilter.available,
              () => controller.onFilterSelected(DoctorListFilter.available),
            ),
            const SizedBox(width: 8),
            _chip(
              kDoctorFilterBusy,
              controller.activeFilter.value == DoctorListFilter.busy,
              () => controller.onFilterSelected(DoctorListFilter.busy),
            ),
            const SizedBox(width: 8),
            _chip(
              kDoctorFilterOffDuty,
              controller.activeFilter.value == DoctorListFilter.offDuty,
              () => controller.onFilterSelected(DoctorListFilter.offDuty),
            ),
            const SizedBox(width: 8),
            _chip(
              kDoctorFilterAll,
              controller.activeFilter.value == DoctorListFilter.all,
              () => controller.onFilterSelected(DoctorListFilter.all),
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
