import 'package:doctors_clinic/app/main/dashboard/models/dashboard_stat_item.dart';
import 'package:doctors_clinic/constants/color_constants.dart';
import 'package:doctors_clinic/utils/text_utils/app_text.dart';
import 'package:doctors_clinic/utils/text_utils/text_styles.dart';
import 'package:flutter/material.dart';

class DashboardStatCard extends StatelessWidget {
  const DashboardStatCard({required this.item, super.key});

  final DashboardStatItem item;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 124,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: kColorSurface,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: kColorBorder),
        boxShadow: const [
          BoxShadow(
            color: kColorCardShadow,
            blurRadius: 16,
            offset: Offset(0, 6),
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 36,
            height: 36,
            decoration: BoxDecoration(
              color: item.iconBackground,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Icon(item.icon, size: 20, color: item.iconColor),
          ),
          const SizedBox(height: 10),
          BoldText(
            text: item.value,
            fontSize: TextStyles.k20FontSize,
            color: kColorTitle,
          ),
          const SizedBox(height: 2),
          AppText(
            text: item.label,
            fontSize: TextStyles.k12FontSize,
            color: kColorTextSecondary,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}
