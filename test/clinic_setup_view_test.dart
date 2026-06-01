import 'package:doctors_clinic/app/auth/clinic_setup/bindings/clinic_setup_binding.dart';
import 'package:doctors_clinic/app/auth/clinic_setup/views/clinic_setup_view.dart';
import 'package:doctors_clinic/constants/string_constants.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';

void main() {
  setUp(() => Get.testMode = true);
  tearDown(Get.reset);

  testWidgets('Clinic setup screen shows save button', (
    WidgetTester tester,
  ) async {
    ClinicSetupBinding().dependencies();
    await tester.pumpWidget(const GetMaterialApp(home: ClinicSetupView()));

    expect(find.text(kClinicSetupTitle), findsOneWidget);
    expect(find.text(kSaveClinicSetupButtonText), findsOneWidget);
  });
}
