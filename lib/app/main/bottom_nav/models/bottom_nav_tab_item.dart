import 'package:flutter/material.dart';

/// One tab in the clinic bottom navigation dock.
class BottomNavTabItem {
  const BottomNavTabItem({
    required this.label,
    required this.icon,
    required this.selectedIcon,
  });

  final String label;
  final IconData icon;
  final IconData selectedIcon;
}
