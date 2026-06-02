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
import '../app/main/whatsapp/bindings/whatsapp_compose_binding.dart';
import '../app/main/whatsapp/bindings/whatsapp_hub_binding.dart';
import '../app/main/whatsapp/bindings/whatsapp_logs_binding.dart';
import '../app/main/whatsapp/bindings/whatsapp_template_editor_binding.dart';
import '../app/main/whatsapp/bindings/whatsapp_templates_binding.dart';
import '../app/main/whatsapp/views/whatsapp_compose_view.dart';
import '../app/main/whatsapp/views/whatsapp_hub_view.dart';
import '../app/main/whatsapp/views/whatsapp_logs_view.dart';
import '../app/main/whatsapp/views/whatsapp_template_editor_view.dart';
import '../app/main/whatsapp/views/whatsapp_templates_view.dart';
import '../app/main/visits/bindings/visit_detail_binding.dart';
import '../app/main/visits/bindings/visit_editor_binding.dart';
import '../app/main/visits/views/visit_detail_view.dart';
import '../app/main/visits/views/visit_editor_view.dart';
import '../app/main/billing/bindings/billing_detail_binding.dart';
import '../app/main/billing/bindings/billing_editor_binding.dart';
import '../app/main/billing/bindings/billing_list_binding.dart';
import '../app/main/billing/views/billing_detail_view.dart';
import '../app/main/billing/views/billing_editor_view.dart';
import '../app/main/billing/views/billing_list_view.dart';
import '../app/main/followups/bindings/follow_up_detail_binding.dart';
import '../app/main/followups/bindings/follow_up_editor_binding.dart';
import '../app/main/followups/bindings/follow_up_list_binding.dart';
import '../app/main/followups/views/follow_up_detail_view.dart';
import '../app/main/followups/views/follow_up_editor_view.dart';
import '../app/main/followups/views/follow_up_list_view.dart';
import '../app/main/staff/bindings/staff_detail_binding.dart';
import '../app/main/staff/bindings/staff_editor_binding.dart';
import '../app/main/staff/bindings/staff_list_binding.dart';
import '../app/main/staff/views/staff_detail_view.dart';
import '../app/main/staff/views/staff_editor_view.dart';
import '../app/main/staff/views/staff_list_view.dart';
import '../app/main/doctors/bindings/doctor_detail_binding.dart';
import '../app/main/doctors/bindings/doctor_editor_binding.dart';
import '../app/main/doctors/bindings/doctor_list_binding.dart';
import '../app/main/doctors/views/doctor_detail_view.dart';
import '../app/main/doctors/views/doctor_editor_view.dart';
import '../app/main/doctors/views/doctor_list_view.dart';
import '../app/main/reports/bindings/reports_dashboard_binding.dart';
import '../app/main/reports/views/reports_dashboard_view.dart';
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
    GetPage(
      name: _Paths.WHATSAPP_HUB,
      page: () => const WhatsAppHubView(),
      binding: WhatsAppHubBinding(),
      preventDuplicates: true,
    ),
    GetPage(
      name: _Paths.WHATSAPP_TEMPLATES,
      page: () => const WhatsAppTemplatesView(),
      binding: WhatsAppTemplatesBinding(),
      preventDuplicates: true,
    ),
    GetPage(
      name: _Paths.WHATSAPP_COMPOSE,
      page: () => const WhatsAppComposeView(),
      binding: WhatsAppComposeBinding(),
      preventDuplicates: true,
    ),
    GetPage(
      name: _Paths.WHATSAPP_LOGS,
      page: () => const WhatsAppLogsView(),
      binding: WhatsAppLogsBinding(),
      preventDuplicates: true,
    ),
    GetPage(
      name: _Paths.WHATSAPP_TEMPLATE_EDITOR,
      page: () => const WhatsAppTemplateEditorView(),
      binding: WhatsAppTemplateEditorBinding(),
      preventDuplicates: true,
    ),
    GetPage(
      name: _Paths.VISIT_EDITOR,
      page: () => const VisitEditorView(),
      binding: VisitEditorBinding(),
      preventDuplicates: true,
    ),
    GetPage(
      name: _Paths.VISIT_DETAIL,
      page: () => const VisitDetailView(),
      binding: VisitDetailBinding(),
      preventDuplicates: true,
    ),
    GetPage(
      name: _Paths.BILLING_LIST,
      page: () => const BillingListView(),
      binding: BillingListBinding(),
      preventDuplicates: true,
    ),
    GetPage(
      name: _Paths.BILLING_EDITOR,
      page: () => const BillingEditorView(),
      binding: BillingEditorBinding(),
      preventDuplicates: true,
    ),
    GetPage(
      name: _Paths.BILLING_DETAIL,
      page: () => const BillingDetailView(),
      binding: BillingDetailBinding(),
      preventDuplicates: true,
    ),
    GetPage(
      name: _Paths.FOLLOW_UP_LIST,
      page: () => const FollowUpListView(),
      binding: FollowUpListBinding(),
      preventDuplicates: true,
    ),
    GetPage(
      name: _Paths.FOLLOW_UP_EDITOR,
      page: () => const FollowUpEditorView(),
      binding: FollowUpEditorBinding(),
      preventDuplicates: true,
    ),
    GetPage(
      name: _Paths.FOLLOW_UP_DETAIL,
      page: () => const FollowUpDetailView(),
      binding: FollowUpDetailBinding(),
      preventDuplicates: true,
    ),
    GetPage(
      name: _Paths.STAFF_LIST,
      page: () => const StaffListView(),
      binding: StaffListBinding(),
      preventDuplicates: true,
    ),
    GetPage(
      name: _Paths.STAFF_EDITOR,
      page: () => const StaffEditorView(),
      binding: StaffEditorBinding(),
      preventDuplicates: true,
    ),
    GetPage(
      name: _Paths.STAFF_DETAIL,
      page: () => const StaffDetailView(),
      binding: StaffDetailBinding(),
      preventDuplicates: true,
    ),
    GetPage(
      name: _Paths.DOCTOR_LIST,
      page: () => const DoctorListView(),
      binding: DoctorListBinding(),
      preventDuplicates: true,
    ),
    GetPage(
      name: _Paths.DOCTOR_EDITOR,
      page: () => const DoctorEditorView(),
      binding: DoctorEditorBinding(),
      preventDuplicates: true,
    ),
    GetPage(
      name: _Paths.DOCTOR_DETAIL,
      page: () => const DoctorDetailView(),
      binding: DoctorDetailBinding(),
      preventDuplicates: true,
    ),
    GetPage(
      name: _Paths.REPORTS_DASHBOARD,
      page: () => const ReportsDashboardView(),
      binding: ReportsDashboardBinding(),
      preventDuplicates: true,
    ),
  ];
}
