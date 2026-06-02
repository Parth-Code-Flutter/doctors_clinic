import 'package:doctors_clinic/app/main/patients/controllers/add_patient_controller.dart';
import 'package:doctors_clinic/app/main/patients/widgets/add_patient_step_header.dart';
import 'package:doctors_clinic/app/main/patients/widgets/gender_selector.dart';
import 'package:doctors_clinic/app/main/patients/widgets/patient_tip_banner.dart';
import 'package:doctors_clinic/app/main/patients/widgets/quick_age_chips.dart';
import 'package:doctors_clinic/constants/color_constants.dart';
import 'package:doctors_clinic/constants/string_constants.dart';
import 'package:doctors_clinic/utils/app_widgets/app_button.dart'
    show AppButtonVariant, appButton;
import 'package:doctors_clinic/utils/app_widgets/app_spaces.dart';
import 'package:doctors_clinic/utils/app_widgets/app_text_field.dart';
import 'package:doctors_clinic/utils/app_widgets/common_app_bar_widget.dart';
import 'package:doctors_clinic/utils/text_utils/app_text.dart';
import 'package:doctors_clinic/utils/text_utils/text_styles.dart';
import 'package:doctors_clinic/utils/ui_utils/app_ui_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class AddPatientView extends GetView<AddPatientController> {
  const AddPatientView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kColorBackground,
      appBar: const CommonAppBarWidget(title: kAddPatientTitle),
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Column(
          children: [
            Expanded(
              child: Obx(
                () => Padding(
                  padding: AppUIUtils.horizontalPadding.copyWith(top: 8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      AddPatientStepHeader(
                        currentStep: controller.currentStep.value,
                        totalSteps: AddPatientController.totalSteps,
                        title: controller.stepTitle,
                        subtitle: controller.stepSubtitle,
                        tip: controller.currentTip,
                      ),
                      Spacing.v12,
                      PatientTipBanner(message: controller.currentTip),
                      Spacing.v16,
                      Expanded(
                        child: PageView(
                          controller: controller.pageController,
                          physics: const NeverScrollableScrollPhysics(),
                          children: [
                            _BasicsStep(controller: controller),
                            _PersonalStep(controller: controller),
                            _OptionalStep(controller: controller),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            _BottomBar(controller: controller),
          ],
        ),
      ),
    );
  }
}

class _BasicsStep extends StatelessWidget {
  const _BasicsStep({required this.controller});

  final AddPatientController controller;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: controller.stepFormKeys[0],
      autovalidateMode: AutovalidateMode.onUserInteraction,
      child: ListView(
        children: [
          AppTextField(
            controller: controller.nameController,
            validator: controller.validateName,
            hintText: kAddPatientFullNameHint,
            textCapitalization: TextCapitalization.words,
            textInputAction: TextInputAction.next,
            prefix: AppTextField.fieldIcon(Icons.badge_outlined),
          ),
          Spacing.v16,
          AppTextField(
            controller: controller.phoneController,
            validator: controller.validatePhone,
            hintText: kAddPatientPhoneHint,
            textInputType: TextInputType.phone,
            textInputAction: TextInputAction.done,
            inputFormatters: [
              FilteringTextInputFormatter.digitsOnly,
              LengthLimitingTextInputFormatter(10),
            ],
            prefix: AppTextField.fieldIcon(Icons.phone_android_rounded),
          ),
        ],
      ),
    );
  }
}

class _PersonalStep extends StatelessWidget {
  const _PersonalStep({required this.controller});

  final AddPatientController controller;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: controller.stepFormKeys[1],
      autovalidateMode: AutovalidateMode.onUserInteraction,
      child: ListView(
        children: [
          const SemiBoldText(
            text: kAddPatientGenderLabel,
            fontSize: TextStyles.k14FontSize,
            color: kColorTitle,
          ),
          Spacing.v8,
          Obx(
            () => GenderSelector(
              selected: controller.selectedGender.value,
              onSelected: controller.onGenderSelected,
            ),
          ),
          Spacing.v20,
          const SemiBoldText(
            text: kAddPatientQuickAgeLabel,
            fontSize: TextStyles.k14FontSize,
            color: kColorTitle,
          ),
          Spacing.v8,
          Obx(
            () => QuickAgeChips(
              chips: QuickAgeChips.defaults,
              selectedAge: controller.selectedQuickAge.value,
              onSelected: controller.onQuickAgeSelected,
            ),
          ),
          Spacing.v12,
          AppTextField(
            controller: controller.ageController,
            validator: controller.validateAge,
            onChanged: controller.onAgeChanged,
            hintText: kAddPatientAgeHint,
            textInputType: TextInputType.number,
            inputFormatters: [FilteringTextInputFormatter.digitsOnly],
            prefix: AppTextField.fieldIcon(Icons.cake_outlined),
          ),
        ],
      ),
    );
  }
}

class _OptionalStep extends StatelessWidget {
  const _OptionalStep({required this.controller});

  final AddPatientController controller;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: controller.stepFormKeys[2],
      child: ListView(
        children: [
          AppTextField(
            controller: controller.addressController,
            hintText: kAddPatientAddressHint,
            textCapitalization: TextCapitalization.sentences,
            maxLines: 2,
            minLines: 2,
            prefix: AppTextField.fieldIcon(Icons.location_on_outlined),
          ),
          Spacing.v16,
          AppTextField(
            controller: controller.notesController,
            hintText: kAddPatientNotesHint,
            textCapitalization: TextCapitalization.sentences,
            maxLines: 4,
            minLines: 3,
            prefix: AppTextField.fieldIcon(Icons.sticky_note_2_outlined),
          ),
        ],
      ),
    );
  }
}

class _BottomBar extends StatelessWidget {
  const _BottomBar({required this.controller});

  final AddPatientController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: AppUIUtils.horizontalPadding.copyWith(
        top: 12,
        bottom: MediaQuery.paddingOf(context).bottom + 16,
      ),
      decoration: const BoxDecoration(
        color: kColorSurface,
        border: Border(top: BorderSide(color: kColorBorder)),
      ),
      child: Obx(
        () => Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (controller.currentStep.value ==
                AddPatientController.totalSteps - 1)
              Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: TextButton(
                  onPressed: controller.isSaving.value
                      ? null
                      : controller.onSkipAndSave,
                  child: const SemiBoldText(
                    text: kAddPatientSkipOptional,
                    fontSize: TextStyles.k14FontSize,
                    color: kColorLink,
                  ),
                ),
              ),
            Row(
              children: [
                if (controller.canGoBack)
                  Expanded(
                    child: appButton(
                      onPressed: controller.onBack,
                      buttonText: kAddPatientBack,
                      variant: AppButtonVariant.secondary,
                    ),
                  ),
                if (controller.canGoBack) const SizedBox(width: 12),
                Expanded(
                  flex: controller.canGoBack ? 2 : 1,
                  child: appButton(
                    onPressed: controller.onPrimaryAction,
                    buttonText: controller.primaryButtonLabel,
                    isLoading: controller.isSaving.value,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
