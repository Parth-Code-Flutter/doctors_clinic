import 'package:doctors_clinic/app/auth/forgot_password/bindings/forgot_password_binding.dart';
import 'package:doctors_clinic/app/auth/forgot_password/views/forgot_password_view.dart';
import 'package:doctors_clinic/constants/string_constants.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';

void main() {
  setUp(() => Get.testMode = true);
  tearDown(Get.reset);

  testWidgets('Forgot password screen shows contact field', (
    WidgetTester tester,
  ) async {
    ForgotPasswordBinding().dependencies();
    await tester.pumpWidget(const GetMaterialApp(home: ForgotPasswordView()));

    expect(find.text(kForgotPasswordTitle), findsOneWidget);
    expect(find.text(kSendOtpButtonText), findsOneWidget);
  });
}
