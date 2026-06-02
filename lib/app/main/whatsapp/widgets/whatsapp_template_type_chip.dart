import 'package:doctors_clinic/app/main/whatsapp/models/whatsapp_template_type.dart';
import 'package:doctors_clinic/constants/color_constants.dart';
import 'package:doctors_clinic/constants/string_constants.dart';
import 'package:doctors_clinic/utils/text_utils/app_text.dart';
import 'package:doctors_clinic/utils/text_utils/text_styles.dart';
import 'package:flutter/material.dart';

class WhatsAppTemplateTypeChip extends StatelessWidget {
  const WhatsAppTemplateTypeChip({required this.type, super.key});

  final WhatsAppTemplateType type;

  String get _label {
    switch (type) {
      case WhatsAppTemplateType.reminder:
        return kWhatsAppTypeReminder;
      case WhatsAppTemplateType.followUp:
        return kWhatsAppTypeFollowUp;
      case WhatsAppTemplateType.receipt:
        return kWhatsAppTypeReceipt;
      case WhatsAppTemplateType.custom:
        return kWhatsAppTypeCustom;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: kColorSecondaryButtonBackground,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: const Color(0xFFA5F3FC)),
      ),
      child: SemiBoldText(
        text: _label,
        fontSize: TextStyles.k12FontSize,
        color: kColorLink,
      ),
    );
  }
}
