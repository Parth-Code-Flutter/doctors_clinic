import 'package:doctors_clinic/app/main/appointments/controllers/appointments_tab_controller.dart';
import 'package:doctors_clinic/app/main/appointments/data/appointment_repository.dart';
import 'package:doctors_clinic/app/main/appointments/widgets/appointment_list_tile.dart';
import 'package:doctors_clinic/app/main/appointments/widgets/appointment_summary_strip.dart';
import 'package:doctors_clinic/constants/color_constants.dart';
import 'package:doctors_clinic/constants/string_constants.dart';
import 'package:doctors_clinic/utils/app_widgets/app_text_field.dart';
import 'package:doctors_clinic/utils/app_widgets/tab_header_action_button.dart';
import 'package:doctors_clinic/utils/text_utils/app_text.dart';
import 'package:doctors_clinic/utils/text_utils/text_styles.dart';
import 'package:doctors_clinic/utils/ui_utils/app_ui_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppointmentsTabView extends GetView<AppointmentsTabController> {
  const AppointmentsTabView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kColorBackground,
      body: SafeArea(
        bottom: false,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: AppUIUtils.horizontalPadding.copyWith(top: 8, bottom: 8),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Expanded(
                    child: BoldText(
                      text: kAppointmentsTitle,
                      fontSize: TextStyles.k24FontSize,
                      color: kColorTitle,
                    ),
                  ),
                  TabHeaderActionButton(
                    icon: Icons.event_available_rounded,
                    tooltip: kAppointmentsAddFab,
                    onPressed: controller.onBookAppointment,
                  ),
                ],
              ),
            ),
            Padding(
              padding: AppUIUtils.horizontalPadding.copyWith(bottom: 12),
              child: Obx(
                () => AppointmentSummaryStrip(
                  todayCount: controller.todayCount,
                  upcomingCount: controller.upcomingCount,
                ),
              ),
            ),
            Padding(
              padding: AppUIUtils.horizontalPadding.copyWith(bottom: 12),
              child: AppTextField(
                controller: controller.searchController,
                hintText: kAppointmentsSearchHint,
                textInputAction: TextInputAction.search,
                prefix: AppTextField.fieldIcon(Icons.search_rounded),
              ),
            ),
            _FilterRow(controller: controller),
            Expanded(
              child: Obx(() {
                final keys = controller.sortedDayKeys;
                if (keys.isEmpty) {
                  return _EmptyState(
                    isSearch:
                        controller.searchQuery.value.isNotEmpty ||
                        controller.activeFilter.value !=
                            AppointmentListFilter.all,
                  );
                }

                return ListView.builder(
                  padding: AppUIUtils.horizontalPadding.copyWith(
                    top: 8,
                    bottom: 24,
                  ),
                  itemCount: keys.length,
                  itemBuilder: (context, index) {
                    final key = keys[index];
                    final items = controller.groupedAppointments[key]!;
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(bottom: 10, top: 4),
                          child: SemiBoldText(
                            text: controller.sectionTitleForKey(key),
                            fontSize: TextStyles.k14FontSize,
                            color: kColorLink,
                          ),
                        ),
                        ...items.map(
                          (appointment) => Padding(
                            padding: const EdgeInsets.only(bottom: 10),
                            child: AppointmentListTileCard(
                              appointment: appointment,
                              onTap: () =>
                                  controller.onAppointmentTap(appointment),
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                );
              }),
            ),
          ],
        ),
      ),
    );
  }
}

class _FilterRow extends StatelessWidget {
  const _FilterRow({required this.controller});

  final AppointmentsTabController controller;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        padding: AppUIUtils.horizontalPadding,
        child: Row(
          children: [
            _chip(kAppointmentsFilterToday, AppointmentListFilter.today),
            _chip(kAppointmentsFilterUpcoming, AppointmentListFilter.upcoming),
            _chip(kAppointmentsFilterAll, AppointmentListFilter.all),
            _chip(
              kAppointmentsFilterCompleted,
              AppointmentListFilter.completed,
            ),
            _chip(
              kAppointmentsFilterCancelled,
              AppointmentListFilter.cancelled,
            ),
            _chip(kAppointmentsFilterMissed, AppointmentListFilter.missed),
          ],
        ),
      ),
    );
  }

  Widget _chip(String label, AppointmentListFilter filter) {
    final selected = controller.activeFilter.value == filter;
    return Padding(
      padding: const EdgeInsets.only(right: 8),
      child: FilterChip(
        label: SemiBoldText(
          text: label,
          fontSize: TextStyles.k12FontSize,
          color: selected ? kColorLink : kColorTitle,
        ),
        selected: selected,
        onSelected: (_) => controller.onFilterSelected(filter),
        showCheckmark: false,
        selectedColor: kColorSecondaryButtonBackground,
        backgroundColor: kColorSurface,
        side: BorderSide(color: selected ? kColorLink : kColorBorder),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      ),
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
            Container(
              width: 72,
              height: 72,
              decoration: const BoxDecoration(
                color: kColorSecondaryButtonBackground,
                shape: BoxShape.circle,
              ),
              child: Icon(
                isSearch ? Icons.event_busy_rounded : Icons.event_outlined,
                size: 36,
                color: kColorLink,
              ),
            ),
            const SizedBox(height: 16),
            BoldText(
              text: isSearch
                  ? kAppointmentsEmptySearchTitle
                  : kAppointmentsEmptyTitle,
              fontSize: TextStyles.k18FontSize,
              color: kColorTitle,
              align: TextAlign.center,
            ),
            const SizedBox(height: 8),
            AppText(
              text: isSearch
                  ? kAppointmentsEmptySearchSubtitle
                  : kAppointmentsEmptySubtitle,
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
