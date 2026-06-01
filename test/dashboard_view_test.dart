import 'package:doctors_clinic/app/main/bottom_nav/bindings/bottom_nav_binding.dart';
import 'package:doctors_clinic/app/main/bottom_nav/views/bottom_nav_view.dart';
import 'package:doctors_clinic/constants/string_constants.dart';
import 'package:doctors_clinic/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';

void main() {
  setUp(() => Get.testMode = true);
  tearDown(Get.reset);

  testWidgets('Dashboard shows hero, stats, and schedule', (
    WidgetTester tester,
  ) async {
    BottomNavBinding().dependencies();
    await tester.pumpWidget(const GetMaterialApp(home: BottomNavView()));
    await tester.pumpAndSettle();

    expect(find.text(kDashboardMockOwnerName), findsOneWidget);
    expect(find.text(kDashboardStatToday), findsOneWidget);
    expect(find.text(kDashboardTodayTitle), findsOneWidget);
    expect(find.text(kDashboardAddPatientAction), findsOneWidget);

    await tester.drag(find.byType(CustomScrollView), const Offset(0, -320));
    await tester.pumpAndSettle();
    expect(find.text('Riya Sharma'), findsOneWidget);
  });

  testWidgets('Add patient quick action opens wizard', (
    WidgetTester tester,
  ) async {
    BottomNavBinding().dependencies();
    await tester.pumpWidget(
      GetMaterialApp(
        home: const BottomNavView(),
        getPages: AppPages.routes,
      ),
    );
    await tester.pumpAndSettle();

    await tester.tap(find.text(kDashboardAddPatientAction));
    await tester.pumpAndSettle();

    expect(find.text(kAddPatientStepBasicsTitle), findsOneWidget);
  });
}
