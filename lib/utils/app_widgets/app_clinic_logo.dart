import 'package:doctors_clinic/constants/color_constants.dart';
import 'package:flutter/material.dart';

/// Shared clinic logo mark (dark tile + hospital icon).
class AppClinicLogo extends StatelessWidget {
  const AppClinicLogo({
    super.key,
    this.size = 96,
    this.iconSize = 46,
    this.borderRadius = 28,
    this.useWhiteIcon = false,
  });

  final double size;
  final double iconSize;
  final double borderRadius;

  /// When true, uses white icon instead of cyan on the dark logo background.
  final bool useWhiteIcon;

  @override
  Widget build(BuildContext context) {
    final iconColor =
        useWhiteIcon ? kColorLogoIconOnDark : kColorLogoIcon;

    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: kColorLogoBackground,
        borderRadius: BorderRadius.circular(borderRadius),
        boxShadow: [
          BoxShadow(
            color: kColorLogoBackground.withValues(alpha: 0.22),
            blurRadius: size * 0.28,
            offset: Offset(0, size * 0.16),
          ),
        ],
      ),
      child: Icon(
        Icons.local_hospital_rounded,
        color: iconColor,
        size: iconSize,
      ),
    );
  }
}
