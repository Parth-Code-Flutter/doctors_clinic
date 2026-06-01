import 'package:doctors_clinic/app/main/bottom_nav/bindings/bottom_nav_binding.dart';
import 'package:doctors_clinic/app/main/bottom_nav/views/bottom_nav_view.dart';
import 'package:doctors_clinic/constants/string_constants.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';

void main() {
  setUp(() => Get.testMode = true);
  tearDown(Get.reset);

  testWidgets('Main shell shows custom bottom nav tabs', (
    WidgetTester tester,
  ) async {
    BottomNavBinding().dependencies();
    await tester.pumpWidget(const GetMaterialApp(home: BottomNavView()));

    expect(find.text(kNavTabHome), findsOneWidget);
    expect(find.text(kNavTabPatients), findsOneWidget);
    expect(find.text(kNavTabAppointments), findsOneWidget);
    expect(find.text(kNavTabMore), findsOneWidget);
    expect(find.text(kDashboardPlaceholderSubtitle), findsOneWidget);
  });

  testWidgets('Tapping Patients tab shows patients placeholder', (
    WidgetTester tester,
  ) async {
    BottomNavBinding().dependencies();
    await tester.pumpWidget(const GetMaterialApp(home: BottomNavView()));

    await tester.tap(find.text(kNavTabPatients));
    await tester.pumpAndSettle();

    expect(find.text(kPatientsTitle), findsWidgets);
    expect(find.text(kPatientsPlaceholderSubtitle), findsOneWidget);
  });
}
