import 'package:doctors_clinic/app/main/whatsapp/models/whatsapp_log_status.dart';
import 'package:doctors_clinic/constants/string_constants.dart';
import 'package:doctors_clinic/utils/text_utils/app_text.dart';
import 'package:doctors_clinic/utils/text_utils/text_styles.dart';
import 'package:flutter/material.dart';

class WhatsAppLogStatusChip extends StatelessWidget {
  const WhatsAppLogStatusChip({required this.status, super.key});

  final WhatsAppLogStatus status;

  String get _label {
    switch (status) {
      case WhatsAppLogStatus.queued:
        return kWhatsAppLogQueued;
      case WhatsAppLogStatus.sent:
        return kWhatsAppLogSent;
      case WhatsAppLogStatus.failed:
        return kWhatsAppLogFailed;
    }
  }

  @override
  Widget build(BuildContext context) {
    final color = status.color;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.12),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: color.withValues(alpha: 0.35)),
      ),
      child: SemiBoldText(
        text: _label,
        fontSize: TextStyles.k12FontSize,
        color: color,
      ),
    );
  }
}
