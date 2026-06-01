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

// Patients
const String kPatientsTitle = 'Patients';
const String kPatientsListSubtitle = 'Find patients in seconds — search by name or mobile.';
const String kPatientsSearchHint = 'Search name or mobile number';
const String kPatientsFilterAll = 'All';
const String kPatientsFilterRecent = 'New this week';
const String kPatientsFilterUpcoming = 'Has visit';
const String kPatientsCountLabel = 'registered';
const String kPatientsEmptyTitle = 'No patients yet';
const String kPatientsEmptySubtitle =
    'Add your first patient — it takes less than a minute.';
const String kPatientsEmptySearchTitle = 'No matches found';
const String kPatientsEmptySearchSubtitle = 'Try another name or mobile number.';
const String kPatientsAddFab = 'New patient';
const String kPatientsLastVisit = 'Last visit';
const String kPatientsNextVisit = 'Next visit';
const String kPatientsNewBadge = 'New';

const String kAddPatientTitle = 'New patient';
const String kEditPatientTitle = 'Edit patient';
const String kPatientProfileTitle = 'Patient profile';
const String kAddPatientStepBasics = 'Basics';
const String kAddPatientStepPersonal = 'Personal';
const String kAddPatientStepOptional = 'Extra';
const String kAddPatientStepBasicsTitle = "Let's start with the essentials";
const String kAddPatientStepBasicsSubtitle =
    'Name and mobile are enough to register — you can add more later.';
const String kAddPatientStepPersonalTitle = 'A few personal details';
const String kAddPatientStepPersonalSubtitle =
    'Tap a gender and age — quick picks save time at the desk.';
const String kAddPatientStepOptionalTitle = 'Anything else to note?';
const String kAddPatientStepOptionalSubtitle =
    'Address and notes are optional. Skip if the patient is in a hurry.';
const String kAddPatientTipName = 'Tip: Use the name exactly as on their ID or bill.';
const String kAddPatientTipPhone =
    'Tip: Double-check the mobile — reminders go to this number.';
const String kAddPatientTipGender = 'Tip: Gender helps doctors personalize care.';
const String kAddPatientTipAge = 'Tip: Tap a quick age or type a custom number.';
const String kAddPatientTipNotes = 'Tip: Allergies, language, or preferred doctor fit here.';
const String kAddPatientFullNameHint = 'Patient full name';
const String kAddPatientPhoneHint = 'Mobile number (10 digits)';
const String kAddPatientAgeHint = 'Age (years)';
const String kAddPatientAddressHint = 'Address (optional)';
const String kAddPatientNotesHint = 'Notes for reception / doctor (optional)';
const String kAddPatientGenderLabel = 'Gender';
const String kAddPatientQuickAgeLabel = 'Quick age';
const String kAddPatientContinue = 'Continue';
const String kAddPatientBack = 'Back';
const String kAddPatientSave = 'Save patient';
const String kAddPatientUpdate = 'Update patient';
const String kAddPatientSkipOptional = 'Skip & save';
const String kAddPatientSuccess = 'Patient saved successfully';
const String kAddPatientUpdateSuccess = 'Patient updated successfully';

const String kPatientGenderMale = 'Male';
const String kPatientGenderFemale = 'Female';
const String kPatientGenderOther = 'Other';
const String kPatientGenderNotSpecified = 'Prefer not to say';

const String kPatientQuickAgeChild = 'Child';
const String kPatientQuickAgeYoung = '20s';
const String kPatientQuickAgeMid = '30s';
const String kPatientQuickAgeSenior = '50+';

const String kPatientProfileCall = 'Call';
const String kPatientProfileBookVisit = 'Book visit';
const String kPatientProfileEdit = 'Edit details';
const String kPatientProfileVisitsTitle = 'Visit history';
const String kPatientProfileNoVisits = 'No visits recorded yet';
const String kPatientProfileAgeLabel = 'Age';
const String kPatientProfilePhoneLabel = 'Mobile';
const String kPatientProfileAddressLabel = 'Address';
const String kPatientProfileNotesLabel = 'Notes';
const String kPatientProfileRegistered = 'Registered';
const String kPatientProfileBookPending =
    'Appointment booking screen is coming next.';

const String kValidationPatientNameRequired = 'Patient name is required';
const String kValidationPatientNameTooShort = 'Enter at least 2 characters';
const String kValidationPatientAgeInvalid = 'Enter a valid age (0–120)';
const String kValidationPatientGenderRequired = 'Please select a gender';

// Appointments
const String kAppointmentsTitle = 'Appointments';
const String kAppointmentsListSubtitle =
    'Clear schedule view — filter by day or status in one tap.';
const String kAppointmentsSearchHint = 'Search patient, mobile, or reason';
const String kAppointmentsAddFab = 'Book visit';
const String kAppointmentsSummaryToday = 'Today';
const String kAppointmentsSummaryUpcoming = 'Upcoming';
const String kAppointmentsFilterAll = 'All';
const String kAppointmentsFilterToday = 'Today';
const String kAppointmentsFilterUpcoming = 'Upcoming';
const String kAppointmentsFilterCompleted = 'Done';
const String kAppointmentsFilterCancelled = 'Cancelled';
const String kAppointmentsFilterMissed = 'Missed';
const String kAppointmentsEmptyTitle = 'No appointments here';
const String kAppointmentsEmptySubtitle =
    'Book a visit to fill your clinic schedule.';
const String kAppointmentsEmptySearchTitle = 'No matching appointments';
const String kAppointmentsEmptySearchSubtitle =
    'Try another filter or search term.';

const String kAddAppointmentTitle = 'Book visit';
const String kAppointmentDetailTitle = 'Visit details';
const String kAddAppointmentStepPatient = 'Patient';
const String kAddAppointmentStepSchedule = 'Schedule';
const String kAddAppointmentStepPatientTitle = 'Who is visiting today?';
const String kAddAppointmentStepPatientSubtitle =
    'Search and tap a patient — only name and mobile are required on file.';
const String kAddAppointmentStepScheduleTitle = 'When is the visit?';
const String kAddAppointmentStepScheduleSubtitle =
    'Pick a date, tap a time slot, and add a short reason if needed.';
const String kAddAppointmentTipPatient =
    'Tip: Can’t find them? Add a new patient first, then book.';
const String kAddAppointmentTipSchedule =
    'Tip: Morning slots fill fast — confirm time with the patient aloud.';
const String kAddAppointmentSelectPatient = 'Select patient';
const String kAddAppointmentSelectedPatient = 'Selected patient';
const String kAddAppointmentChangePatient = 'Change';
const String kAddAppointmentDateLabel = 'Appointment date';
const String kAddAppointmentTimeLabel = 'Quick time slots';
const String kAddAppointmentReasonHint = 'Visit reason (e.g. follow-up, cleaning)';
const String kAddAppointmentNotesHint = 'Internal notes (optional)';
const String kAddAppointmentReminderLabel = 'Reminder';
const String kAddAppointmentContinue = 'Continue';
const String kAddAppointmentBack = 'Back';
const String kAddAppointmentSave = 'Confirm booking';
const String kAddAppointmentSuccess = 'Appointment booked successfully';
const String kAddAppointmentPickDate = 'Choose date';
const String kValidationPatientSelectRequired = 'Please select a patient';
const String kValidationAppointmentDateRequired = 'Please choose a date';
const String kValidationAppointmentTimeRequired = 'Please choose a time';

const String kAppointmentStatusUpcoming = 'Upcoming';
const String kAppointmentStatusCompleted = 'Completed';
const String kAppointmentStatusCancelled = 'Cancelled';
const String kAppointmentStatusMissed = 'Missed';
const String kAppointmentDetailCall = 'Call patient';
const String kAppointmentDetailSendReminder = 'Send reminder';
const String kAppointmentDetailMarkComplete = 'Mark completed';
const String kAppointmentDetailMarkMissed = 'Mark missed';
const String kAppointmentDetailCancel = 'Cancel visit';
const String kAppointmentDetailReminderSent = 'Reminder marked as sent';
const String kAppointmentDetailStatusUpdated = 'Appointment status updated';
const String kAppointmentDetailReminderPending =
    'Automated reminders will connect in the next release.';

// Main app — tab placeholders
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
