import 'package:doctors_clinic/app/auth/welcome/bindings/welcome_binding.dart';
import 'package:doctors_clinic/app/auth/welcome/views/welcome_view.dart';
import 'package:doctors_clinic/constants/string_constants.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';

void main() {
  setUp(() {
    Get.testMode = true;
  });

  tearDown(Get.reset);

  testWidgets('Welcome screen shows entry choices', (WidgetTester tester) async {
    WelcomeBinding().dependencies();

    await tester.pumpWidget(
      const GetMaterialApp(home: WelcomeView()),
    );

    expect(find.text(kWelcomeTitle), findsOneWidget);
    expect(find.text(kLoginToClinicButton), findsOneWidget);
    expect(find.text(kOpenNewClinicButton), findsOneWidget);
  });
}
