import 'package:doctors_clinic/app/auth/login/bindings/auth_login_binding.dart';
import 'package:doctors_clinic/app/auth/login/views/auth_login_view.dart';
import 'package:doctors_clinic/constants/string_constants.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';

void main() {
  setUp(() {
    Get.testMode = true;
  });

  tearDown(Get.reset);

  testWidgets('Login screen shows form fields', (WidgetTester tester) async {
    AuthLoginBinding().dependencies();

    await tester.pumpWidget(const GetMaterialApp(home: AuthLoginView()));

    expect(find.text(kLoginTitle), findsOneWidget);
    expect(find.text(kLoginEmailOrPhoneHint), findsOneWidget);
    expect(find.text(kLoginPasswordHint), findsOneWidget);
    expect(find.text(kLoginButtonText), findsOneWidget);
    expect(find.text(kForgotPassword), findsOneWidget);
  });
}
