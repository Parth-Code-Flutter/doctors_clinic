import 'package:doctors_clinic/app/main/whatsapp/controllers/whatsapp_compose_controller.dart';
import 'package:doctors_clinic/constants/color_constants.dart';
import 'package:doctors_clinic/constants/string_constants.dart';
import 'package:doctors_clinic/utils/app_widgets/app_button.dart';
import 'package:doctors_clinic/utils/app_widgets/app_drop_down.dart';
import 'package:doctors_clinic/utils/app_widgets/app_spaces.dart';
import 'package:doctors_clinic/utils/app_widgets/app_text_field.dart';
import 'package:doctors_clinic/utils/app_widgets/common_app_bar_widget.dart';
import 'package:doctors_clinic/utils/text_utils/app_text.dart';
import 'package:doctors_clinic/utils/text_utils/text_styles.dart';
import 'package:doctors_clinic/utils/ui_utils/app_ui_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WhatsAppComposeView extends GetView<WhatsAppComposeController> {
  const WhatsAppComposeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kColorBackground,
      appBar: const CommonAppBarWidget(title: kWhatsAppComposeTitle),
      body: ListView(
        padding: AppUIUtils.horizontalPadding.copyWith(top: 8, bottom: 24),
        children: [
          const AppText(
            text: kWhatsAppComposeSubtitle,
            fontSize: TextStyles.k14FontSize,
            color: kColorTextSecondary,
          ),
          Spacing.v16,
          Obx(
            () => AppDropDown<String>(
              value: controller.selectedPatientId.value,
              hint: kWhatsAppPatientHint,
              items: controller.patients
                  .map(
                    (patient) => DropdownMenuItem<String>(
                      value: patient.id,
                      child: Text('${patient.fullName} · ${patient.phone}'),
                    ),
                  )
                  .toList(),
              onChanged: controller.onPatientChanged,
            ),
          ),
          Spacing.v12,
          Obx(
            () => AppDropDown<String>(
              value: controller.selectedTemplateId.value,
              hint: kWhatsAppTemplateHint,
              items: controller.templates
                  .map(
                    (template) => DropdownMenuItem<String>(
                      value: template.id,
                      child: Text(template.title),
                    ),
                  )
                  .toList(),
              onChanged: controller.onTemplateChanged,
            ),
          ),
          Spacing.v12,
          AppTextField(
            controller: controller.messageController,
            hintText: kWhatsAppMessageHint,
            maxLines: 5,
            minLines: 5,
            prefix: AppTextField.fieldIcon(Icons.chat_bubble_outline_rounded),
          ),
          Spacing.v12,
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: kColorSecondaryButtonBackground,
              borderRadius: BorderRadius.circular(14),
              border: Border.all(color: const Color(0xFFA5F3FC)),
            ),
            child: const AppText(
              text: kWhatsAppComposeNote,
              fontSize: TextStyles.k12FontSize,
              color: kColorTextSecondary,
            ),
          ),
          Spacing.v20,
          Obx(
            () => appButton(
              onPressed: controller.onSend,
              buttonText: kWhatsAppSendButton,
              isLoading: controller.isSending.value,
            ),
          ),
        ],
      ),
    );
  }
}
