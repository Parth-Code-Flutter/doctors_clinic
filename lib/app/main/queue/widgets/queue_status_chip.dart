import 'package:doctors_clinic/app/main/queue/models/queue_token_status.dart';
import 'package:doctors_clinic/utils/text_utils/app_text.dart';
import 'package:doctors_clinic/utils/text_utils/text_styles.dart';
import 'package:flutter/material.dart';

class QueueStatusChip extends StatelessWidget {
  const QueueStatusChip({required this.status, super.key});

  final QueueTokenStatus status;

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
        text: status.label,
        fontSize: TextStyles.k12FontSize,
        color: color,
      ),
    );
  }
}
