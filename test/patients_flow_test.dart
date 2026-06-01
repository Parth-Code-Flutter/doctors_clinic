import 'package:doctors_clinic/app/main/bottom_nav/bindings/bottom_nav_binding.dart';
import 'package:doctors_clinic/app/main/patients/bindings/add_patient_binding.dart';
import 'package:doctors_clinic/app/main/patients/data/patient_repository.dart';
import 'package:doctors_clinic/app/main/patients/views/add_patient_view.dart';
import 'package:doctors_clinic/constants/string_constants.dart';
import 'package:doctors_clinic/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';

void main() {
  setUp(() {
    Get.testMode = true;
    Get.put(PatientRepository());
  });

  tearDown(Get.reset);

  testWidgets('Patients tab shows list and search', (WidgetTester tester) async {
    BottomNavBinding().dependencies();
    await tester.pumpWidget(
      GetMaterialApp(
        home: const SizedBox.shrink(),
        getPages: AppPages.routes,
        initialRoute: Routes.MAIN,
      ),
    );
    await tester.pumpAndSettle();

    await tester.tap(find.text(kNavTabPatients).last);
    await tester.pumpAndSettle();

    expect(find.text('Riya Sharma'), findsOneWidget);
    expect(find.byTooltip(kPatientsAddFab), findsOneWidget);
  });

  testWidgets('Add patient wizard shows step one', (WidgetTester tester) async {
    AddPatientBinding().dependencies();
    await tester.pumpWidget(
      const GetMaterialApp(home: AddPatientView()),
    );

    expect(find.text(kAddPatientStepBasicsTitle), findsOneWidget);
    expect(find.text(kAddPatientContinue), findsOneWidget);
  });
}
