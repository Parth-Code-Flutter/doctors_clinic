// ignore_for_file: constant_identifier_names

import 'package:get/get.dart';

import '../app/auth/clinic_setup/bindings/clinic_setup_binding.dart';
import '../app/auth/clinic_setup/views/clinic_setup_view.dart';
import '../app/auth/forgot_password/bindings/forgot_password_binding.dart';
import '../app/auth/forgot_password/views/forgot_password_view.dart';
import '../app/auth/login/bindings/auth_login_binding.dart';
import '../app/auth/login/views/auth_login_view.dart';
import '../app/auth/open_new_clinic/bindings/open_new_clinic_binding.dart';
import '../app/auth/open_new_clinic/views/open_new_clinic_view.dart';
import '../app/auth/otp_verification/bindings/otp_verification_binding.dart';
import '../app/auth/otp_verification/views/otp_verification_view.dart';
import '../app/auth/reset_password/bindings/reset_password_binding.dart';
import '../app/auth/reset_password/views/reset_password_view.dart';
import '../app/auth/welcome/bindings/welcome_binding.dart';
import '../app/auth/welcome/views/welcome_view.dart';
import '../app/splash/splash/bindings/splash_binding.dart';
import '../app/splash/splash/views/splash_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.SPLASH;

  static final routes = <GetPage<dynamic>>[
    GetPage(
      name: _Paths.SPLASH,
      page: () => const SplashView(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: _Paths.WELCOME,
      page: () => const WelcomeView(),
      binding: WelcomeBinding(),
    ),
    GetPage(
      name: _Paths.AUTH_LOGIN,
      page: () => const AuthLoginView(),
      binding: AuthLoginBinding(),
      preventDuplicates: true,
    ),
    GetPage(
      name: _Paths.OPEN_NEW_CLINIC,
      page: () => const OpenNewClinicView(),
      binding: OpenNewClinicBinding(),
      preventDuplicates: true,
    ),
    GetPage(
      name: _Paths.AUTH_FORGOT_PASSWORD,
      page: () => const ForgotPasswordView(),
      binding: ForgotPasswordBinding(),
      preventDuplicates: true,
    ),
    GetPage(
      name: _Paths.AUTH_OTP_VERIFICATION,
      page: () => const OtpVerificationView(),
      binding: OtpVerificationBinding(),
      preventDuplicates: true,
    ),
    GetPage(
      name: _Paths.AUTH_RESET_PASSWORD,
      page: () => const ResetPasswordView(),
      binding: ResetPasswordBinding(),
      preventDuplicates: true,
    ),
    GetPage(
      name: _Paths.CLINIC_SETUP,
      page: () => const ClinicSetupView(),
      binding: ClinicSetupBinding(),
      preventDuplicates: true,
    ),
  ];
}
