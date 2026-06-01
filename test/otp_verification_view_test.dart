import 'package:doctors_clinic/app/auth/otp_verification/bindings/otp_verification_binding.dart';
import 'package:doctors_clinic/app/auth/otp_verification/views/otp_verification_view.dart';
import 'package:doctors_clinic/constants/string_constants.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';

void main() {
  setUp(() => Get.testMode = true);
  tearDown(Get.reset);

  testWidgets('OTP screen shows verify button', (WidgetTester tester) async {
    OtpVerificationBinding().dependencies();
    await tester.pumpWidget(const GetMaterialApp(home: OtpVerificationView()));

    expect(find.text(kOtpVerificationTitle), findsOneWidget);
    expect(find.text(kVerifyOtpButtonText), findsOneWidget);
  });
}
