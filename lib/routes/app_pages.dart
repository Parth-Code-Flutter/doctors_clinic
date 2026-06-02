// ignore_for_file: constant_identifier_names

import 'package:get/get.dart';

import '../app/auth/clinic_setup/bindings/clinic_setup_binding.dart';
import '../app/main/bottom_nav/bindings/bottom_nav_binding.dart';
import '../app/main/bottom_nav/views/bottom_nav_view.dart';
import '../app/main/patients/bindings/add_patient_binding.dart';
import '../app/main/patients/bindings/edit_patient_binding.dart';
import '../app/main/patients/bindings/patient_profile_binding.dart';
import '../app/main/patients/views/add_patient_view.dart';
import '../app/main/patients/views/edit_patient_view.dart';
import '../app/main/patients/views/patient_profile_view.dart';
import '../app/main/appointments/bindings/add_appointment_binding.dart';
import '../app/main/appointments/bindings/appointment_detail_binding.dart';
import '../app/main/appointments/views/add_appointment_view.dart';
import '../app/main/appointments/views/appointment_detail_view.dart';
import '../app/main/settings/bindings/about_settings_binding.dart';
import '../app/main/settings/bindings/account_settings_binding.dart';
import '../app/main/settings/bindings/clinic_profile_settings_binding.dart';
import '../app/main/settings/bindings/reminder_settings_binding.dart';
import '../app/main/settings/views/about_settings_view.dart';
import '../app/main/settings/views/account_settings_view.dart';
import '../app/main/settings/views/clinic_profile_settings_view.dart';
import '../app/main/settings/views/reminder_settings_view.dart';
import '../app/main/reminders/bindings/reminders_list_binding.dart';
import '../app/main/reminders/views/reminders_list_view.dart';
import '../app/main/queue/bindings/add_queue_token_binding.dart';
import '../app/main/queue/bindings/queue_board_binding.dart';
import '../app/main/queue/bindings/queue_list_binding.dart';
import '../app/main/queue/bindings/queue_token_detail_binding.dart';
import '../app/main/queue/views/add_queue_token_view.dart';
import '../app/main/queue/views/queue_board_view.dart';
import '../app/main/queue/views/queue_list_view.dart';
import '../app/main/queue/views/queue_token_detail_view.dart';
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
    GetPage(
      name: _Paths.MAIN,
      page: () => const BottomNavView(),
      binding: BottomNavBinding(),
      preventDuplicates: true,
    ),
    GetPage(
      name: _Paths.PATIENT_ADD,
      page: () => const AddPatientView(),
      binding: AddPatientBinding(),
      preventDuplicates: true,
    ),
    GetPage(
      name: _Paths.PATIENT_PROFILE,
      page: () => const PatientProfileView(),
      binding: PatientProfileBinding(),
      preventDuplicates: true,
    ),
    GetPage(
      name: _Paths.PATIENT_EDIT,
      page: () => const EditPatientView(),
      binding: EditPatientBinding(),
      preventDuplicates: true,
    ),
    GetPage(
      name: _Paths.APPOINTMENT_ADD,
      page: () => const AddAppointmentView(),
      binding: AddAppointmentBinding(),
      preventDuplicates: true,
    ),
    GetPage(
      name: _Paths.APPOINTMENT_DETAIL,
      page: () => const AppointmentDetailView(),
      binding: AppointmentDetailBinding(),
      preventDuplicates: true,
    ),
    GetPage(
      name: _Paths.SETTINGS_CLINIC_PROFILE,
      page: () => const ClinicProfileSettingsView(),
      binding: ClinicProfileSettingsBinding(),
      preventDuplicates: true,
    ),
    GetPage(
      name: _Paths.SETTINGS_REMINDERS,
      page: () => const ReminderSettingsView(),
      binding: ReminderSettingsBinding(),
      preventDuplicates: true,
    ),
    GetPage(
      name: _Paths.SETTINGS_ACCOUNT,
      page: () => const AccountSettingsView(),
      binding: AccountSettingsBinding(),
      preventDuplicates: true,
    ),
    GetPage(
      name: _Paths.SETTINGS_ABOUT,
      page: () => const AboutSettingsView(),
      binding: AboutSettingsBinding(),
      preventDuplicates: true,
    ),
    GetPage(
      name: _Paths.REMINDERS_LIST,
      page: () => const RemindersListView(),
      binding: RemindersListBinding(),
      preventDuplicates: true,
    ),
    GetPage(
      name: _Paths.QUEUE_LIST,
      page: () => const QueueListView(),
      binding: QueueListBinding(),
      preventDuplicates: true,
    ),
    GetPage(
      name: _Paths.QUEUE_ADD,
      page: () => const AddQueueTokenView(),
      binding: AddQueueTokenBinding(),
      preventDuplicates: true,
    ),
    GetPage(
      name: _Paths.QUEUE_DETAIL,
      page: () => const QueueTokenDetailView(),
      binding: QueueTokenDetailBinding(),
      preventDuplicates: true,
    ),
    GetPage(
      name: _Paths.QUEUE_BOARD,
      page: () => const QueueBoardView(),
      binding: QueueBoardBinding(),
      preventDuplicates: true,
    ),
  ];
}
