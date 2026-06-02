import 'package:doctors_clinic/constants/color_constants.dart';
import 'package:doctors_clinic/constants/image_constants.dart';
import 'package:flutter/material.dart';

/// Shared clinic logo mark using latest app icon.
class AppClinicLogo extends StatelessWidget {
  const AppClinicLogo({
    super.key,
    this.size = 96,
    this.iconSize = 46,
    this.borderRadius = 28,
    this.useWhiteIcon = false,
    this.showShadow = true,
  });

  final double size;
  final double iconSize;
  final double borderRadius;
  final bool showShadow;

  /// When true, uses white icon instead of cyan on the dark logo background.
  final bool useWhiteIcon;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(borderRadius),
        boxShadow: showShadow
            ? [
                BoxShadow(
                  color: kColorLogoBackground.withValues(alpha: 0.22),
                  blurRadius: size * 0.28,
                  offset: Offset(0, size * 0.16),
                ),
              ]
            : null,
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(borderRadius),
        child: Image.asset(
          kImgAppIcon,
          width: size,
          height: size,
          fit: BoxFit.cover,
          errorBuilder: (_, __, ___) => Container(
            width: size,
            height: size,
            color: kColorLogoBackground,
            alignment: Alignment.center,
            child: Icon(
              Icons.local_hospital_rounded,
              color: useWhiteIcon ? kColorLogoIconOnDark : kColorLogoIcon,
              size: iconSize,
            ),
          ),
        ),
      ),
    );
  }
}
