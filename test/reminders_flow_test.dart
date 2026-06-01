import 'package:doctors_clinic/app/main/appointments/data/appointment_repository.dart';
import 'package:doctors_clinic/app/main/bottom_nav/bindings/bottom_nav_binding.dart';
import 'package:doctors_clinic/app/main/patients/data/patient_repository.dart';
import 'package:doctors_clinic/app/main/reminders/data/reminder_repository.dart';
import 'package:doctors_clinic/constants/string_constants.dart';
import 'package:doctors_clinic/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';

void main() {
  setUp(() {
    Get.testMode = true;
    Get.put(PatientRepository());
    Get.put(AppointmentRepository());
    Get.put(ReminderRepository());
  });

  tearDown(Get.reset);

  testWidgets('Reminders list screen shows summary and filters', (
    WidgetTester tester,
  ) async {
    await tester.binding.setSurfaceSize(const Size(800, 2000));
    addTearDown(() => tester.binding.setSurfaceSize(null));

    await tester.pumpWidget(
      GetMaterialApp(
        home: const SizedBox.shrink(),
        getPages: AppPages.routes,
        initialRoute: Routes.REMINDERS_LIST,
      ),
    );
    await tester.pumpAndSettle();

    expect(find.text(kRemindersTitle), findsOneWidget);
    expect(find.text(kRemindersSummarySentToday), findsOneWidget);
    expect(find.text(kRemindersSearchHint), findsOneWidget);
    expect(find.byType(TextField), findsOneWidget);
  });

  testWidgets('More tab opens reminders log entry', (WidgetTester tester) async {
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

    expect(find.text(kRemindersListMenuTitle), findsOneWidget);
  });
}
