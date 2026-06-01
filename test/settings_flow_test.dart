import 'package:doctors_clinic/app/main/bottom_nav/bindings/bottom_nav_binding.dart';
import 'package:doctors_clinic/app/main/settings/data/clinic_settings_repository.dart';
import 'package:doctors_clinic/constants/string_constants.dart';
import 'package:doctors_clinic/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';

void main() {
  setUp(() {
    Get.testMode = true;
    if (!Get.isRegistered<ClinicSettingsRepository>()) {
      Get.put(ClinicSettingsRepository());
    }
  });

  tearDown(Get.reset);

  Future<void> openMoreTab(WidgetTester tester) async {
    BottomNavBinding().dependencies();
    await tester.pumpWidget(
      GetMaterialApp(
        home: const SizedBox.shrink(),
        getPages: AppPages.routes,
        initialRoute: Routes.MAIN,
      ),
    );
    await tester.pumpAndSettle();
    await tester.tap(find.text(kNavTabMore).last);
    await tester.pumpAndSettle();
  }

  testWidgets('More tab shows settings hub', (WidgetTester tester) async {
    await openMoreTab(tester);

    expect(find.text(kMoreSubtitle), findsOneWidget);
    expect(find.text(kDashboardMockClinicName), findsOneWidget);
    expect(find.text(kSettingsClinicProfileTitle), findsOneWidget);
    expect(find.text(kSettingsRemindersTitle), findsOneWidget);
    expect(find.text(kSettingsAccountTitle), findsOneWidget);
  });

  testWidgets('Clinic profile settings screen shows form', (
    WidgetTester tester,
  ) async {
    await tester.binding.setSurfaceSize(const Size(800, 2400));
    addTearDown(() => tester.binding.setSurfaceSize(null));

    await tester.pumpWidget(
      GetMaterialApp(
        home: const SizedBox.shrink(),
        getPages: AppPages.routes,
        initialRoute: Routes.SETTINGS_CLINIC_PROFILE,
      ),
    );
    await tester.pumpAndSettle();

    expect(find.text(kSettingsClinicProfileScreenSubtitle), findsOneWidget);
    expect(find.text(kSettingsSaveProfileButton), findsOneWidget);
  });

  testWidgets('About settings screen shows app info', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(
      GetMaterialApp(
        home: const SizedBox.shrink(),
        getPages: AppPages.routes,
        initialRoute: Routes.SETTINGS_ABOUT,
      ),
    );
    await tester.pumpAndSettle();

    expect(find.text(kAppName), findsWidgets);
    expect(find.textContaining(kSettingsAppVersion), findsOneWidget);
    expect(find.text(kSettingsSupportEmail), findsOneWidget);
  });
}
