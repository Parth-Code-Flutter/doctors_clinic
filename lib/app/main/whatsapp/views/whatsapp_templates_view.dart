import 'package:doctors_clinic/app/main/whatsapp/controllers/whatsapp_templates_controller.dart';
import 'package:doctors_clinic/app/main/whatsapp/widgets/whatsapp_template_type_chip.dart';
import 'package:doctors_clinic/constants/color_constants.dart';
import 'package:doctors_clinic/constants/string_constants.dart';
import 'package:doctors_clinic/utils/app_widgets/app_button.dart';
import 'package:doctors_clinic/utils/app_widgets/app_text_field.dart';
import 'package:doctors_clinic/utils/app_widgets/common_app_bar_widget.dart';
import 'package:doctors_clinic/utils/text_utils/app_text.dart';
import 'package:doctors_clinic/utils/text_utils/text_styles.dart';
import 'package:doctors_clinic/utils/ui_utils/app_ui_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WhatsAppTemplatesView extends GetView<WhatsAppTemplatesController> {
  const WhatsAppTemplatesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kColorBackground,
      appBar: const CommonAppBarWidget(title: kWhatsAppTemplatesTitle),
      body: Column(
        children: [
          Padding(
            padding: AppUIUtils.horizontalPadding.copyWith(top: 8, bottom: 8),
            child: const AppText(
              text: kWhatsAppTemplatesSubtitle,
              fontSize: TextStyles.k14FontSize,
              color: kColorTextSecondary,
            ),
          ),
          Padding(
            padding: AppUIUtils.horizontalPadding.copyWith(bottom: 12),
            child: AppTextField(
              controller: controller.searchController,
              hintText: kWhatsAppTemplatesSearchHint,
              textInputAction: TextInputAction.search,
              prefix: AppTextField.fieldIcon(Icons.search_rounded),
            ),
          ),
          Expanded(
            child: Obx(() {
              final items = controller.filteredTemplates;
              if (items.isEmpty) {
                return const Center(
                  child: AppText(
                    text: kWhatsAppTemplatesEmpty,
                    fontSize: TextStyles.k14FontSize,
                    color: kColorTextSecondary,
                  ),
                );
              }
              return ListView.separated(
                padding: AppUIUtils.horizontalPadding.copyWith(bottom: 24),
                itemCount: items.length,
                separatorBuilder: (_, __) => const SizedBox(height: 10),
                itemBuilder: (_, index) {
                  final t = items[index];
                  return Container(
                    padding: const EdgeInsets.all(14),
                    decoration: BoxDecoration(
                      color: kColorSurface,
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(color: kColorBorder),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: SemiBoldText(
                                text: t.title,
                                fontSize: TextStyles.k14FontSize,
                                color: kColorTitle,
                              ),
                            ),
                            WhatsAppTemplateTypeChip(type: t.type),
                          ],
                        ),
                        const SizedBox(height: 8),
                        AppText(
                          text: t.body,
                          maxLines: 3,
                          fontSize: TextStyles.k12FontSize,
                          color: kColorTextSecondary,
                        ),
                        const SizedBox(height: 10),
                        Row(
                          children: [
                            if (t.isDefault)
                              const _Badge(text: kWhatsAppTemplateDefaultBadge),
                            if (!t.isActive) ...[
                              if (t.isDefault) const SizedBox(width: 6),
                              const _Badge(
                                text: kWhatsAppTemplateInactiveBadge,
                              ),
                            ],
                            const Spacer(),
                            SizedBox(
                              height: 34,
                              child: appButton(
                                onPressed: () => controller.onEditTemplate(t),
                                buttonText: kWhatsAppEditTemplate,
                                variant: AppButtonVariant.secondary,
                                buttonWidth: 112,
                                buttonHeight: 34,
                              ),
                            ),
                          ],
                        ),
                      ],
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

class _Badge extends StatelessWidget {
  const _Badge({required this.text});
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: kColorSecondaryButtonBackground,
        borderRadius: BorderRadius.circular(14),
      ),
      child: AppText(
        text: text,
        fontSize: TextStyles.k12FontSize,
        color: kColorLink,
      ),
    );
  }
}
