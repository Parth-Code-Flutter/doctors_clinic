import 'package:doctors_clinic/app/main/patients/controllers/patients_tab_controller.dart';
import 'package:doctors_clinic/app/main/patients/widgets/patient_list_tile.dart';
import 'package:doctors_clinic/constants/color_constants.dart';
import 'package:doctors_clinic/constants/string_constants.dart';
import 'package:doctors_clinic/utils/app_widgets/app_text_field.dart';
import 'package:doctors_clinic/utils/app_widgets/tab_header_action_button.dart';
import 'package:doctors_clinic/utils/text_utils/app_text.dart';
import 'package:doctors_clinic/utils/text_utils/text_styles.dart';
import 'package:doctors_clinic/utils/ui_utils/app_ui_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PatientsTabView extends GetView<PatientsTabController> {
  const PatientsTabView({super.key});

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
              padding: AppUIUtils.horizontalPadding.copyWith(top: 8, bottom: 4),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const BoldText(
                          text: kPatientsTitle,
                          fontSize: TextStyles.k24FontSize,
                          color: kColorTitle,
                        ),
                        const SizedBox(height: 4),
                        Obx(
                          () => AppText(
                            text:
                                '${controller.totalCount} $kPatientsCountLabel · $kPatientsListSubtitle',
                            fontSize: TextStyles.k12FontSize,
                            color: kColorTextSecondary,
                            maxLines: 2,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 12),
                  TabHeaderActionButton(
                    icon: Icons.person_add_alt_1_rounded,
                    tooltip: kPatientsAddFab,
                    onPressed: controller.onAddPatient,
                  ),
                ],
              ),
            ),
            Padding(
              padding: AppUIUtils.horizontalPadding.copyWith(bottom: 12),
              child: AppTextField(
                controller: controller.searchController,
                hintText: kPatientsSearchHint,
                textInputType: TextInputType.text,
                textInputAction: TextInputAction.search,
                prefix: AppTextField.fieldIcon(Icons.search_rounded),
              ),
            ),
            _FilterRow(controller: controller),
            Expanded(
              child: Obx(() {
                final patients = controller.filteredPatients;
                if (patients.isEmpty) {
                  return _EmptyState(
                    isSearch: controller.searchQuery.value.isNotEmpty ||
                        controller.activeFilter.value !=
                            PatientListFilter.all,
                  );
                }
                return ListView.separated(
                  padding: AppUIUtils.horizontalPadding.copyWith(
                    top: 8,
                    bottom: 24,
                  ),
                  itemCount: patients.length,
                  separatorBuilder: (_, __) => const SizedBox(height: 10),
                  itemBuilder: (context, index) {
                    final patient = patients[index];
                    return PatientListTileCard(
                      patient: patient,
                      isNew: controller.isNewPatient(patient),
                      onTap: () => controller.onPatientTap(patient),
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

  final PatientsTabController controller;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        padding: AppUIUtils.horizontalPadding,
        child: Row(
          children: [
            _FilterChip(
              label: kPatientsFilterAll,
              selected: controller.activeFilter.value == PatientListFilter.all,
              onTap: () => controller.onFilterSelected(PatientListFilter.all),
            ),
            const SizedBox(width: 8),
            _FilterChip(
              label: kPatientsFilterRecent,
              selected:
                  controller.activeFilter.value == PatientListFilter.recent,
              onTap: () => controller.onFilterSelected(PatientListFilter.recent),
            ),
            const SizedBox(width: 8),
            _FilterChip(
              label: kPatientsFilterUpcoming,
              selected:
                  controller.activeFilter.value == PatientListFilter.upcoming,
              onTap: () =>
                  controller.onFilterSelected(PatientListFilter.upcoming),
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
      selectedColor: kColorSecondaryButtonBackground,
      backgroundColor: kColorSurface,
      side: BorderSide(color: selected ? kColorLink : kColorBorder),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
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
                isSearch ? Icons.search_off_rounded : Icons.groups_outlined,
                size: 36,
                color: kColorLink,
              ),
            ),
            const SizedBox(height: 16),
            BoldText(
              text: isSearch ? kPatientsEmptySearchTitle : kPatientsEmptyTitle,
              fontSize: TextStyles.k18FontSize,
              color: kColorTitle,
              align: TextAlign.center,
            ),
            const SizedBox(height: 8),
            AppText(
              text:
                  isSearch ? kPatientsEmptySearchSubtitle : kPatientsEmptySubtitle,
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
