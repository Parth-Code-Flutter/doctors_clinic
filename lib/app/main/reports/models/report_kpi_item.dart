import 'package:flutter/material.dart';

class ReportKpiItem {
  const ReportKpiItem({
    required this.title,
    required this.value,
    required this.icon,
    required this.color,
  });

  final String title;
  final String value;
  final IconData icon;
  final Color color;
}
