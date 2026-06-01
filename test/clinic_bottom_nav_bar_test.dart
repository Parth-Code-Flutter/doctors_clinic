import 'package:doctors_clinic/app/main/bottom_nav/controllers/bottom_nav_controller.dart';
import 'package:doctors_clinic/constants/string_constants.dart';
import 'package:doctors_clinic/utils/app_widgets/clinic_bottom_nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('ClinicBottomNavBar highlights selected tab', (
    WidgetTester tester,
  ) async {
    var selected = 0;

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: ClinicBottomNavBar(
            items: BottomNavController.tabs,
            selectedIndex: selected,
            onTabSelected: (index) => selected = index,
          ),
        ),
      ),
    );

    expect(find.text(kNavTabHome), findsOneWidget);

    await tester.tap(find.text(kNavTabMore));
    await tester.pump();

    expect(selected, 3);
  });
}
