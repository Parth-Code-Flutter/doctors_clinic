import 'package:doctors_clinic/app/main/bottom_nav/models/bottom_nav_tab_item.dart';
import 'package:doctors_clinic/constants/color_constants.dart';
import 'package:doctors_clinic/utils/text_utils/app_text.dart';
import 'package:doctors_clinic/utils/text_utils/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

/// Floating "clinic dock" bottom navigation with a cyan active indicator.
///
/// Layout metrics are exported so tab bodies can reserve clearance above the dock.
const double kClinicBottomNavDockHeight = 68;
const double kClinicBottomNavHorizontalMargin = 16;
const double kClinicBottomNavBottomMargin = 12;

/// Total space tab content should leave at the bottom (dock + margin, excluding safe area).
const double kClinicBottomNavContentClearance =
    kClinicBottomNavDockHeight + kClinicBottomNavBottomMargin;

class ClinicBottomNavBar extends StatelessWidget {
  const ClinicBottomNavBar({
    required this.items,
    required this.selectedIndex,
    required this.onTabSelected,
    super.key,
  });

  final List<BottomNavTabItem> items;
  final int selectedIndex;
  final ValueChanged<int> onTabSelected;

  @override
  Widget build(BuildContext context) {
    final bottomInset = MediaQuery.paddingOf(context).bottom;

    return Padding(
      padding: EdgeInsets.fromLTRB(
        kClinicBottomNavHorizontalMargin,
        0,
        kClinicBottomNavHorizontalMargin,
        bottomInset + kClinicBottomNavBottomMargin,
      ),
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: kColorSurface,
          borderRadius: BorderRadius.circular(28),
          border: Border.all(color: kColorBorder),
          boxShadow: const [
            BoxShadow(
              color: kColorBottomNavShadow,
              blurRadius: 20,
              offset: Offset(0, 8),
            ),
          ],
        ),
        child: SizedBox(
          height: kClinicBottomNavDockHeight,
          child: Row(
            children: List.generate(
              items.length,
              (index) => Expanded(
                child: _ClinicBottomNavTab(
                  item: items[index],
                  selected: selectedIndex == index,
                  onTap: () {
                    HapticFeedback.selectionClick();
                    onTabSelected(index);
                  },
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _ClinicBottomNavTab extends StatelessWidget {
  const _ClinicBottomNavTab({
    required this.item,
    required this.selected,
    required this.onTap,
  });

  final BottomNavTabItem item;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final iconColor = selected ? kColorPrimary : kColorTextSecondary;
    final labelColor = selected ? kColorPrimary : kColorTextSecondary;

    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedScale(
              scale: selected ? 1.08 : 1,
              duration: const Duration(milliseconds: 180),
              curve: Curves.easeOutCubic,
              child: Icon(
                selected ? item.selectedIcon : item.icon,
                size: 22,
                color: iconColor,
              ),
            ),
            const SizedBox(height: 2),
            SemiBoldText(
              text: item.label,
              fontSize: TextStyles.k12FontSize,
              color: labelColor,
            ),
            const SizedBox(height: 4),
            AnimatedContainer(
              duration: const Duration(milliseconds: 220),
              curve: Curves.easeOutCubic,
              height: 3,
              width: selected ? 20 : 0,
              decoration: BoxDecoration(
                color: kColorLogoIcon,
                borderRadius: BorderRadius.circular(2),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
