import 'package:doctors_clinic/app/auth/open_new_clinic/bindings/open_new_clinic_binding.dart';
import 'package:doctors_clinic/app/auth/open_new_clinic/views/open_new_clinic_view.dart';
import 'package:doctors_clinic/constants/string_constants.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';

void main() {
  setUp(() {
    Get.testMode = true;
  });

  tearDown(Get.reset);

  testWidgets('Open New Clinic screen shows registration form', (
    WidgetTester tester,
  ) async {
    OpenNewClinicBinding().dependencies();

    await tester.pumpWidget(const GetMaterialApp(home: OpenNewClinicView()));

    expect(find.text(kOpenNewClinicTitle), findsOneWidget);
    expect(find.text(kClinicNameHint), findsOneWidget);
    expect(find.text(kOwnerNameHint), findsOneWidget);
    expect(find.text(kMobileNumberHint), findsOneWidget);
    expect(find.text(kEmailHint), findsOneWidget);
    expect(find.text(kRegisterClinicButtonText), findsOneWidget);
  });
}
