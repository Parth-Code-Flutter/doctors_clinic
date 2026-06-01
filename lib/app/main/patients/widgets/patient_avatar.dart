import 'package:doctors_clinic/utils/text_utils/app_text.dart';
import 'package:flutter/material.dart';

class PatientAvatar extends StatelessWidget {
  const PatientAvatar({
    required this.initials,
    required this.colorIndex,
    this.size = 48,
    super.key,
  });

  final String initials;
  final int colorIndex;
  final double size;

  static const List<Color> _palette = [
    Color(0xFF0891B2),
    Color(0xFF0F172A),
    Color(0xFF16A34A),
    Color(0xFFF59E0B),
    Color(0xFF7C3AED),
  ];

  static const List<Color> _backgrounds = [
    Color(0xFFCFFAFE),
    Color(0xFFE2E8F0),
    Color(0xFFDCFCE7),
    Color(0xFFFEF3C7),
    Color(0xFFEDE9FE),
  ];

  @override
  Widget build(BuildContext context) {
    final index = colorIndex.abs() % _palette.length;
    return Container(
      width: size,
      height: size,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: _backgrounds[index],
        borderRadius: BorderRadius.circular(size * 0.32),
      ),
      child: SemiBoldText(
        text: initials,
        fontSize: size * 0.36,
        color: _palette[index],
      ),
    );
  }
}
