const String kAppName = 'Doctors Clinic';
const String kAppTagline = 'Patient register and appointment reminders';

const String kWelcomeTitle = 'Welcome';
const String kWelcomeSubtitle =
    'Manage your clinic patients and appointment reminders in one place.';
const String kLoginToClinicButton = 'Login To Clinic';
const String kOpenNewClinicButton = 'Open New Clinic';
const String kWelcomeFooterNote =
    'New clinic? Register in under two minutes. Already registered? Log in.';

// Login To Clinic
const String kLoginTitle = 'Login To Clinic';
const String kLoginSubtitle = 'Sign in to manage patients and appointments.';
const String kLoginEmailOrPhoneHint = 'Email or mobile number';
const String kLoginPasswordHint = 'Password';
const String kLoginButtonText = 'Login';
const String kForgotPassword = 'Forgot password?';
const String kLoginWithOtp = 'Login with OTP';
const String kLoginNoAccountPrefix = 'Need to register your clinic? ';
const String kLoginOpenNewClinicLink = 'Open New Clinic';
const String kRegisterAlreadyHaveAccountPrefix = 'Already have a clinic account? ';
const String kRegisterLoginLink = 'Login To Clinic';

// Open New Clinic
const String kOpenNewClinicTitle = 'Open New Clinic';
const String kOpenNewClinicSubtitle =
    'Create your clinic account to start managing patients.';
const String kClinicNameHint = 'Clinic name';
const String kOwnerNameHint = 'Owner or doctor name';
const String kMobileNumberHint = 'Mobile number';
const String kEmailHint = 'Email address';
const String kConfirmPasswordHint = 'Confirm password';
const String kRegisterClinicButtonText = 'Create Clinic Account';

// Forgot password
const String kForgotPasswordTitle = 'Forgot Password';
const String kForgotPasswordSubtitle =
    'Enter your registered email or mobile number. We will send you an OTP.';
const String kSendOtpButtonText = 'Send OTP';

// OTP verification
const String kOtpVerificationTitle = 'Verify OTP';
const String kOtpVerificationSubtitle =
    'Enter the 6-digit code sent to your email or mobile number.';
const String kOtpHint = 'Enter 6-digit OTP';
const String kResendOtp = 'Resend OTP';
const String kResendOtpIn = 'Resend OTP in';
const String kVerifyOtpButtonText = 'Verify & Continue';

// Reset password
const String kResetPasswordTitle = 'Reset Password';
const String kResetPasswordSubtitle = 'Create a new password for your clinic account.';
const String kNewPasswordHint = 'New password';
const String kResetPasswordButtonText = 'Update Password';

// Clinic setup
const String kClinicSetupTitle = 'Clinic Setup';
const String kClinicSetupSubtitle =
    'Add clinic details and reminder preferences. You can change these later.';
const String kAddressHint = 'Clinic address';
const String kCityHint = 'City';
const String kStateHint = 'State';
const String kPincodeHint = 'Pincode';
const String kClinicTypeHint = 'Clinic type (e.g. dental, skin, physio)';
const String kWorkingDaysHint = 'Working days (e.g. Mon–Sat)';
const String kWorkingHoursHint = 'Working hours (e.g. 9:00 AM – 6:00 PM)';
const String kDefaultReminderHint = 'Default reminder before appointment';
const String kSaveClinicSetupButtonText = 'Save & Continue';
const String kSkipClinicSetup = 'Skip for now';

// Validation
const String kValidationUsernameRequired = 'Email or mobile number is required';
const String kValidationEmailOrPhoneInvalid =
    'Enter a valid email or 10-digit mobile number';
const String kValidationPasswordRequired = 'Password is required';
const String kValidationPasswordMinLength =
    'Password must be at least 6 characters';
const String kValidationClinicNameRequired = 'Clinic name is required';
const String kValidationOwnerNameRequired = 'Owner or doctor name is required';
const String kValidationMobileRequired = 'Mobile number is required';
const String kValidationMobileInvalid = 'Enter a valid 10-digit mobile number';
const String kValidationEmailRequired = 'Email address is required';
const String kValidationEmailInvalid = 'Enter a valid email address';
const String kValidationConfirmPasswordRequired = 'Confirm password is required';
const String kValidationPasswordMismatch = 'Passwords do not match';
const String kValidationOtpRequired = 'OTP is required';
const String kValidationOtpInvalid = 'Enter a valid 6-digit OTP';

// API placeholders
const String kLoginApiPendingMessage =
    'Login API will be connected in the next release.';
const String kRegisterClinicApiPendingMessage =
    'Clinic registration API will be connected in the next release.';
const String kForgotPasswordApiPendingMessage =
    'Password reset API will be connected in the next release.';
const String kOtpApiPendingMessage =
    'OTP APIs will be connected in the next release.';
const String kClinicSetupApiPendingMessage =
    'Clinic profile API will be connected in the next release.';
const String kClinicSetupSuccessMessage =
    'Clinic setup saved. Welcome to your clinic workspace.';

// Main app — bottom navigation
const String kNavTabHome = 'Home';
const String kNavTabPatients = 'Patients';
const String kNavTabAppointments = 'Appts';
const String kNavTabMore = 'More';

// Dashboard
const String kDashboardTitle = 'Dashboard';
const String kDashboardGreetingMorning = 'Good morning';
const String kDashboardGreetingAfternoon = 'Good afternoon';
const String kDashboardGreetingEvening = 'Good evening';
const String kDashboardMockClinicName = 'Sunrise Dental Clinic';
const String kDashboardMockOwnerName = 'Dr. Parth Shah';
const String kDashboardStatToday = "Today's visits";
const String kDashboardStatUpcoming = 'Upcoming';
const String kDashboardStatPatients = 'All patients';
const String kDashboardQuickActionsTitle = 'Quick actions';
const String kDashboardAddPatientAction = 'Add patient';
const String kDashboardAddPatientSubtitle = 'Register new patient';
const String kDashboardBookAppointmentAction = 'Book visit';
const String kDashboardBookAppointmentSubtitle = 'Schedule appointment';
const String kDashboardTodayTitle = "Today's schedule";
const String kDashboardViewAll = 'View all';
const String kDashboardEmptyAppointmentsTitle = 'No appointments today';
const String kDashboardEmptyAppointmentsSubtitle =
    'Your clinic schedule is clear. Book a visit or enjoy the break.';
const String kDashboardBookFirstAppointment = 'Book appointment';
const String kDashboardStatusUpcoming = 'Upcoming';
const String kDashboardStatusInProgress = 'In progress';
const String kDashboardStatusCompleted = 'Completed';
const String kDashboardStatusCancelled = 'Cancelled';
const String kDashboardAppointmentDetailPending =
    'Appointment detail screen coming soon.';
const String kDashboardClinicOpenBadge = 'Clinic open';

// Main app — tab placeholders
const String kPatientsTitle = 'Patients';
const String kPatientsPlaceholderSubtitle =
    'Search, add, and manage patient records from this tab.';
const String kAppointmentsTitle = 'Appointments';
const String kAppointmentsPlaceholderSubtitle =
    'View and book appointments for your clinic here.';
const String kMoreTitle = 'More';
const String kMorePlaceholderSubtitle =
    'Clinic settings, profile, and account options will live here.';
const String kMoreLogoutButton = 'Log out';

// Reminder options (clinic setup dropdown labels)
const List<String> kDefaultReminderOptions = [
  '15 minutes before',
  '30 minutes before',
  '1 hour before',
  '24 hours before',
];
