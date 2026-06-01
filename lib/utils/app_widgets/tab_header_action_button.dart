import 'package:doctors_clinic/constants/color_constants.dart';
import 'package:flutter/material.dart';

/// Compact primary action in tab screen headers (replaces wide FAB).
class TabHeaderActionButton extends StatelessWidget {
  const TabHeaderActionButton({
    required this.icon,
    required this.tooltip,
    required this.onPressed,
    super.key,
  });

  final IconData icon;
  final String tooltip;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Tooltip(
      message: tooltip,
      child: Material(
        color: kColorPrimary,
        borderRadius: BorderRadius.circular(14),
        child: InkWell(
          onTap: onPressed,
          borderRadius: BorderRadius.circular(14),
          child: SizedBox(
            width: 48,
            height: 48,
            child: Icon(icon, color: kColorOnPrimary, size: 24),
          ),
        ),
      ),
    );
  }
}
