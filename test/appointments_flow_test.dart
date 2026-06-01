import 'package:doctors_clinic/app/main/appointments/bindings/add_appointment_binding.dart';
import 'package:doctors_clinic/app/main/appointments/data/appointment_repository.dart';
import 'package:doctors_clinic/app/main/appointments/views/add_appointment_view.dart';
import 'package:doctors_clinic/app/main/bottom_nav/bindings/bottom_nav_binding.dart';
import 'package:doctors_clinic/app/main/patients/data/patient_repository.dart';
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
  });

  tearDown(Get.reset);

  testWidgets('Appointments tab shows today summary', (WidgetTester tester) async {
    BottomNavBinding().dependencies();
    await tester.pumpWidget(
      GetMaterialApp(
        home: const SizedBox.shrink(),
        getPages: AppPages.routes,
        initialRoute: Routes.MAIN,
      ),
    );
    await tester.pumpAndSettle();

    await tester.tap(find.text(kNavTabAppointments).last);
    await tester.pumpAndSettle();

    expect(find.byTooltip(kAppointmentsAddFab), findsOneWidget);
    expect(find.text('Riya Sharma'), findsWidgets);
  });

  testWidgets('Book visit wizard shows patient step', (WidgetTester tester) async {
    AddAppointmentBinding().dependencies();
    await tester.pumpWidget(const GetMaterialApp(home: AddAppointmentView()));

    expect(find.text(kAddAppointmentStepPatientTitle), findsOneWidget);
    expect(find.text(kAddAppointmentContinue), findsOneWidget);
  });
}
