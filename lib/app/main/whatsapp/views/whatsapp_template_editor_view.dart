import 'package:doctors_clinic/app/main/whatsapp/controllers/whatsapp_template_editor_controller.dart';
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

class WhatsAppTemplateEditorView
    extends GetView<WhatsAppTemplateEditorController> {
  const WhatsAppTemplateEditorView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kColorBackground,
      appBar: const CommonAppBarWidget(title: kWhatsAppTemplateEditorTitle),
      body: ListView(
        padding: AppUIUtils.horizontalPadding.copyWith(top: 8, bottom: 24),
        children: [
          const AppText(
            text: kWhatsAppTemplateEditorSubtitle,
            fontSize: TextStyles.k14FontSize,
            color: kColorTextSecondary,
          ),
          Spacing.v16,
          AppTextField(
            controller: controller.titleController,
            hintText: kWhatsAppTemplateTitleHint,
            prefix: AppTextField.fieldIcon(Icons.title_rounded),
          ),
          Spacing.v12,
          AppTextField(
            controller: controller.bodyController,
            hintText: kWhatsAppTemplateBodyHint,
            maxLines: 6,
            minLines: 6,
            prefix: AppTextField.fieldIcon(Icons.message_outlined),
          ),
          Spacing.v12,
          const SemiBoldText(
            text: kWhatsAppVariableLabel,
            fontSize: TextStyles.k14FontSize,
            color: kColorTitle,
          ),
          const SizedBox(height: 8),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: kWhatsAppTemplateVariables
                .map(
                  (variable) => ActionChip(
                    label: Text(variable),
                    onPressed: () => controller.onInsertVariable(variable),
                    backgroundColor: kColorSecondaryButtonBackground,
                    side: const BorderSide(color: Color(0xFFA5F3FC)),
                    labelStyle: const TextStyle(
                      color: kColorLink,
                      fontSize: TextStyles.k12FontSize,
                    ),
                  ),
                )
                .toList(),
          ),
          Spacing.v16,
          Obx(
            () => Container(
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 4),
              decoration: BoxDecoration(
                color: kColorSurface,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: kColorBorder),
              ),
              child: Column(
                children: [
                  SwitchListTile(
                    value: controller.isActive.value,
                    onChanged: controller.onToggleActive,
                    title: const SemiBoldText(
                      text: kWhatsAppTemplateActiveTitle,
                      fontSize: TextStyles.k14FontSize,
                      color: kColorTitle,
                    ),
                    subtitle: const AppText(
                      text: kWhatsAppTemplateActiveSubtitle,
                      fontSize: TextStyles.k12FontSize,
                      color: kColorTextSecondary,
                    ),
                  ),
                  SwitchListTile(
                    value: controller.isDefault.value,
                    onChanged: controller.onToggleDefault,
                    title: const SemiBoldText(
                      text: kWhatsAppTemplateDefaultTitle,
                      fontSize: TextStyles.k14FontSize,
                      color: kColorTitle,
                    ),
                    subtitle: const AppText(
                      text: kWhatsAppTemplateDefaultSubtitle,
                      fontSize: TextStyles.k12FontSize,
                      color: kColorTextSecondary,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Spacing.v20,
          Obx(
            () => appButton(
              onPressed: controller.onSave,
              buttonText: kWhatsAppTemplateSaveButton,
              isLoading: controller.isSaving.value,
            ),
          ),
        ],
      ),
    );
  }
}
