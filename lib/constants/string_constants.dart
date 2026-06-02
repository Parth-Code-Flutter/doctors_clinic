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
const String kRegisterAlreadyHaveAccountPrefix =
    'Already have a clinic account? ';
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
const String kResetPasswordSubtitle =
    'Create a new password for your clinic account.';
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
const String kValidationConfirmPasswordRequired =
    'Confirm password is required';
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
const String kPatientsListSubtitle =
    'Find patients in seconds — search by name or mobile.';
const String kPatientsSearchHint = 'Search name or mobile number';
const String kPatientsFilterAll = 'All';
const String kPatientsFilterRecent = 'New this week';
const String kPatientsFilterUpcoming = 'Has visit';
const String kPatientsCountLabel = 'registered';
const String kPatientsEmptyTitle = 'No patients yet';
const String kPatientsEmptySubtitle =
    'Add your first patient — it takes less than a minute.';
const String kPatientsEmptySearchTitle = 'No matches found';
const String kPatientsEmptySearchSubtitle =
    'Try another name or mobile number.';
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
const String kAddPatientTipName =
    'Tip: Use the name exactly as on their ID or bill.';
const String kAddPatientTipPhone =
    'Tip: Double-check the mobile — reminders go to this number.';
const String kAddPatientTipGender =
    'Tip: Gender helps doctors personalize care.';
const String kAddPatientTipAge =
    'Tip: Tap a quick age or type a custom number.';
const String kAddPatientTipNotes =
    'Tip: Allergies, language, or preferred doctor fit here.';
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
const String kAddAppointmentReasonHint =
    'Visit reason (e.g. follow-up, cleaning)';
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

// Main app — More / Settings hub
const String kMoreTitle = 'More';
const String kMoreSubtitle = 'Clinic profile, reminders, and account';
const String kMoreLogoutButton = 'Log out';
const String kSettingsSectionClinic = 'CLINIC';
const String kSettingsSectionReminders = 'REMINDERS & ACCOUNT';
const String kSettingsSectionSupport = 'SUPPORT';
const String kSettingsClinicProfileTitle = 'Clinic profile';
const String kSettingsClinicProfileSubtitle =
    'Name, contact, hours, and address';
const String kSettingsRemindersTitle = 'Reminder settings';
const String kSettingsRemindersSubtitle = 'Default timing and delivery channel';
const String kSettingsAccountTitle = 'Account';
const String kSettingsAccountSubtitle = 'Password and sign-in';
const String kSettingsAboutTitle = 'About';
const String kSettingsAboutSubtitle = 'App version and support';

// Settings — mock clinic defaults (until API v0.2)
const String kSettingsMockMobile = '9876543210';
const String kSettingsMockEmail = 'hello@sunrisedental.com';
const String kSettingsMockAddress = '12 MG Road, Near City Mall';
const String kSettingsMockCity = 'Ahmedabad';
const String kSettingsMockState = 'Gujarat';
const String kSettingsMockPincode = '380015';
const String kSettingsMockClinicType = 'Dental';
const String kSettingsMockWorkingDays = 'Mon – Sat';
const String kSettingsMockWorkingHours = '9:00 AM – 6:00 PM';

// Settings — clinic profile screen
const String kSettingsClinicProfileScreenTitle = 'Clinic profile';
const String kSettingsClinicProfileScreenSubtitle =
    'Keep your clinic details accurate for staff and patient reminders.';
const String kSettingsSaveProfileButton = 'Save changes';
const String kSettingsProfileSavedMessage = 'Clinic profile updated';

// Settings — reminder screen
const String kSettingsRemindersScreenTitle = 'Reminder settings';
const String kSettingsRemindersScreenSubtitle =
    'Defaults apply when booking visits. Per-visit overrides still work.';
const String kSettingsReminderChannelHint = 'Send reminders via';
const String kSettingsAutoRemindersTitle = 'Automatic reminders';
const String kSettingsAutoRemindersSubtitle =
    'Send default reminders before each visit when enabled.';
const String kSettingsSaveRemindersButton = 'Save reminder settings';
const String kSettingsRemindersSavedMessage = 'Reminder settings updated';
const String kSettingsRemindersApiNote =
    'SMS and WhatsApp delivery will connect in the next release.';

// Settings — account screen
const String kSettingsAccountScreenTitle = 'Account';
const String kSettingsAccountScreenSubtitle =
    'Manage how you sign in to this clinic workspace.';
const String kSettingsSignedInAs = 'Signed in as';
const String kSettingsChangePassword = 'Change password';
const String kSettingsChangePasswordSubtitle =
    'Update your clinic account password';
const String kSettingsLogoutTitle = 'Log out';
const String kSettingsLogoutSubtitle = 'Sign out on this device';

// Settings — about screen
const String kSettingsAboutScreenTitle = 'About';
const String kSettingsAppVersionLabel = 'Version';
const String kSettingsAppVersion = '1.0.0 (UI preview)';
const String kSettingsSupportTitle = 'Help & support';
const String kSettingsSupportEmail = 'support@doctorsclinic.app';
const String kSettingsPrivacyTitle = 'Privacy policy';
const String kSettingsTermsTitle = 'Terms of use';
const String kSettingsLegalPendingMessage =
    'Legal pages will be available before public launch.';

// Settings — API placeholders
const String kSettingsProfileApiPendingMessage =
    'Clinic profile API will be connected in v0.2.';
const String kSettingsRemindersApiPendingMessage =
    'Reminder settings API will be connected in v0.4.';

// Reminder options (clinic setup & settings dropdown labels)
const List<String> kDefaultReminderOptions = [
  '15 minutes before',
  '30 minutes before',
  '1 hour before',
  '24 hours before',
];

const List<String> kReminderChannelOptions = [
  'SMS only',
  'WhatsApp only',
  'SMS & WhatsApp',
];

// Reminders list screen
const String kRemindersTitle = 'Reminders';
const String kRemindersSubtitle =
    'Scheduled and sent patient reminders for upcoming visits.';
const String kRemindersListMenuTitle = 'Reminders log';
const String kRemindersListMenuSubtitle =
    'View scheduled, sent, and failed messages';
const String kRemindersSearchHint = 'Search patient, mobile, or channel';
const String kRemindersFilterAll = 'All';
const String kRemindersFilterToday = 'Today';
const String kRemindersFilterScheduled = 'Scheduled';
const String kRemindersFilterSent = 'Sent';
const String kRemindersFilterFailed = 'Failed';
const String kRemindersSummaryScheduled = 'Scheduled';
const String kRemindersSummarySentToday = 'Sent today';
const String kRemindersSummaryFailed = 'Failed';
const String kRemindersStatusScheduled = 'Scheduled';
const String kRemindersStatusSent = 'Sent';
const String kRemindersStatusFailed = 'Failed';
const String kRemindersDeliverLabel = 'Remind at';
const String kRemindersVisitLabel = 'Visit';
const String kRemindersChannelPrefix = 'via';
const String kRemindersRetryButton = 'Retry';
const String kRemindersRetriedMessage = 'Reminder queued to send again';
const String kRemindersEmptyTitle = 'No reminders here';
const String kRemindersEmptySearchSubtitle =
    'Try another search or filter to find reminders.';
const String kRemindersEmptyFilterSubtitle =
    'Reminders appear when visits are booked or messages are sent.';
const String kRemindersMockFailureDelivery =
    'Could not deliver — patient number unreachable';
const String kRemindersManualSentNote =
    'Delivery APIs connect in the next release. Status updated locally.';

// Queue / token management
const String kQueueTitle = 'Queue';
const String kQueueSubtitle =
    'Manage walk-ins and live token flow for faster front desk operations.';
const String kQueueMenuTitle = 'Queue and token';
const String kQueueMenuSubtitle = 'Walk-in queue, token board, and statuses';
const String kQueueAddTitle = 'Add to queue';
const String kQueueAddSubtitle =
    'Pick a patient and create a queue token for consultation.';
const String kQueueDetailTitle = 'Queue token details';
const String kQueueBoardTitle = 'Live queue board';
const String kQueueNowServingLabel = 'Now serving';
const String kQueueNowServingEmpty = 'Waiting for next patient';
const String kQueueBoardEmpty = 'No active tokens right now.';
const String kQueueTokenShort = 'Token';
const String kQueuePriorityLabel = 'Priority token';
const String kQueuePrioritySwitchTitle = 'Mark as priority';
const String kQueuePrioritySwitchSubtitle =
    'Priority tokens are highlighted at the top of queue.';
const String kQueuePatientHint = 'Select patient';
const String kQueueReasonHint = 'Reason for visit';
const String kQueueNotesHint = 'Queue notes (optional)';
const String kQueueCreateButton = 'Create token';
const String kQueueSaveNotesButton = 'Save notes';
const String kQueueSearchHint = 'Search token, patient, or reason';
const String kQueueFilterAll = 'All';
const String kQueueFilterWaiting = 'Waiting';
const String kQueueFilterWithDoctor = 'In consultation';
const String kQueueFilterCompleted = 'Completed';
const String kQueueFilterSkipped = 'Skipped';
const String kQueueFilterPriority = 'Priority';
const String kQueueSummaryWaiting = 'Waiting';
const String kQueueSummaryInConsultation = 'In consult';
const String kQueueSummaryCompleted = 'Completed';
const String kQueueSummarySkipped = 'Skipped';
const String kQueueStatusWaiting = 'Waiting';
const String kQueueStatusWithDoctor = 'In consultation';
const String kQueueStatusCompleted = 'Completed';
const String kQueueStatusSkipped = 'Skipped';
const String kQueueActionWaiting = 'Move to waiting';
const String kQueueActionWithDoctor = 'Start consult';
const String kQueueActionCompleted = 'Mark done';
const String kQueueActionSkipped = 'Skip token';
const String kQueueActionsTitle = 'Quick actions';
const String kQueueReasonTitle = 'Visit reason';
const String kQueueEmptyTitle = 'Queue is empty';
const String kQueueEmptySearchSubtitle =
    'Try another search or filter to find tokens.';
const String kQueueEmptyFilterSubtitle =
    'Create a token to start the queue for today.';
const String kQueueValidationPatientRequired = 'Please select a patient first.';
const String kQueueTokenCreatedMessage = 'Queue token created';
const String kQueueStatusUpdatedMessage = 'Queue status updated';
const String kQueueNotesSavedMessage = 'Queue notes saved';
const String kQueueAddTooltip = 'Add queue token';
const String kQueueBoardTooltip = 'Open live board';

// WhatsApp communication (UI only)
const String kWhatsAppTitle = 'WhatsApp communication';
const String kWhatsAppSubtitle =
    'Templates, quick compose, and delivery logs for patient messaging.';
const String kWhatsAppMenuTitle = 'WhatsApp communication';
const String kWhatsAppMenuSubtitle =
    'Templates, compose flow, and delivery log';
const String kWhatsAppTemplatesTitle = 'Message templates';
const String kWhatsAppTemplatesSubtitle =
    'Manage reminder, follow-up, and receipt templates.';
const String kWhatsAppTemplatesSearchHint = 'Search template';
const String kWhatsAppTemplatesEmpty = 'No templates found.';
const String kWhatsAppTemplateReminderTitle = 'Visit reminder';
const String kWhatsAppTemplateFollowUpTitle = 'Follow-up check-in';
const String kWhatsAppTemplateReceiptTitle = 'Receipt shared';
const String kWhatsAppTemplateReminderBody =
    'Hello {{patientName}}, reminder for your appointment at {{clinicName}} on {{date}} at {{time}}.';
const String kWhatsAppTemplateFollowUpBody =
    'Hello {{patientName}}, hope you are doing well. Reply to book a follow-up visit.';
const String kWhatsAppTemplateReceiptBody =
    'Hello {{patientName}}, your consultation receipt is shared. Contact {{clinicPhone}} for any help.';
const String kWhatsAppTypeReminder = 'Reminder';
const String kWhatsAppTypeFollowUp = 'Follow-up';
const String kWhatsAppTypeReceipt = 'Receipt';
const String kWhatsAppTypeCustom = 'Custom';
const String kWhatsAppTemplateDefaultBadge = 'Default';
const String kWhatsAppTemplateInactiveBadge = 'Inactive';
const String kWhatsAppEditTemplate = 'Edit';
const String kWhatsAppComposeTitle = 'Compose message';
const String kWhatsAppComposeSubtitle =
    'Pick patient and template, then preview before sending.';
const String kWhatsAppPatientHint = 'Select patient';
const String kWhatsAppTemplateHint = 'Select template';
const String kWhatsAppMessageHint = 'Message preview';
const String kWhatsAppComposeNote =
    'UI-only mode: messages are queued locally and shown in logs.';
const String kWhatsAppSendButton = 'Queue message';
const String kWhatsAppMessageQueued = 'Message queued in WhatsApp logs';
const String kWhatsAppLogsTitle = 'Delivery logs';
const String kWhatsAppLogsSubtitle =
    'Track queued, sent, and failed WhatsApp messages.';
const String kWhatsAppLogsSearchHint = 'Search patient or template';
const String kWhatsAppLogsEmpty = 'No delivery logs yet.';
const String kWhatsAppLogQueued = 'Queued';
const String kWhatsAppLogSent = 'Sent';
const String kWhatsAppLogFailed = 'Failed';
const String kWhatsAppSummaryTemplates = 'Templates';
const String kWhatsAppSummaryQueued = 'Queued';
const String kWhatsAppSummarySentToday = 'Sent today';
const String kWhatsAppSummaryFailed = 'Failed';
const String kWhatsAppRetryButton = 'Retry';
const String kWhatsAppRetryQueued = 'Message re-queued';
const String kWhatsAppTemplateEditorTitle = 'Edit template';
const String kWhatsAppTemplateEditorSubtitle =
    'Tune copy and placeholders before enabling for staff use.';
const String kWhatsAppTemplateTitleHint = 'Template title';
const String kWhatsAppTemplateBodyHint = 'Template body';
const String kWhatsAppVariableLabel = 'Insert variable';
const String kWhatsAppTemplateActiveTitle = 'Template active';
const String kWhatsAppTemplateActiveSubtitle = 'Show in compose template list.';
const String kWhatsAppTemplateDefaultTitle = 'Mark as default';
const String kWhatsAppTemplateDefaultSubtitle =
    'Preselect this template in compose flow.';
const String kWhatsAppTemplateSaveButton = 'Save template';
const String kWhatsAppTemplateSaved = 'Template updated';
const String kWhatsAppValidationSelectionRequired =
    'Please select patient and template.';
const String kWhatsAppValidationMessageRequired = 'Message cannot be empty.';
const String kWhatsAppValidationTemplateRequired =
    'Template title and body are required.';
const String kWhatsAppMockFailureReason =
    'Delivery failed: recipient blocked business account';
const List<String> kWhatsAppTemplateVariables = [
  '{{patientName}}',
  '{{clinicName}}',
  '{{date}}',
  '{{time}}',
  '{{clinicPhone}}',
];

// Visit notes / basic prescription
const String kVisitEditorTitle = 'Visit notes';
const String kVisitEditorSubtitle =
    'Capture complaint, diagnosis, and a lightweight prescription.';
const String kVisitDetailTitle = 'Visit summary';
const String kVisitPatientHint = 'Select patient';
const String kVisitComplaintHint = 'Chief complaint';
const String kVisitClinicalNotesHint = 'Clinical notes';
const String kVisitDiagnosisHint = 'Diagnosis';
const String kVisitFollowUpHint = 'Follow-up advice';
const String kVisitPrescriptionSectionTitle = 'Prescription';
const String kVisitMedicineNameHint = 'Medicine name';
const String kVisitMedicineDosageHint = 'Dosage';
const String kVisitMedicineFrequencyHint = 'Frequency';
const String kVisitMedicineDurationHint = 'Duration';
const String kVisitMedicineInstructionHint = 'Instructions';
const String kVisitAddMedicineButton = 'Add medicine';
const String kVisitPrescriptionEmpty = 'No medicines added yet.';
const String kVisitSaveButton = 'Save visit note';
const String kVisitEditButton = 'Edit visit note';
const String kVisitComplaintSectionTitle = 'Chief complaint';
const String kVisitClinicalNotesSectionTitle = 'Clinical notes';
const String kVisitDiagnosisSectionTitle = 'Diagnosis';
const String kVisitFollowUpSectionTitle = 'Follow-up advice';
const String kVisitSavedMessage = 'Visit note saved';
const String kVisitValidationPatientRequired = 'Please select a patient.';
const String kVisitValidationContentRequired =
    'Add complaint, diagnosis, or medicine before saving.';
const String kVisitValidationMedicineRequired =
    'Medicine, dosage, frequency, and duration are required.';
const String kAppointmentDetailVisitNoteButton = 'Visit notes';

// Billing / receipts (UI only)
const String kBillingTitle = 'Billing & receipts';
const String kBillingSubtitle =
    'Create invoices, track paid amount, and monitor dues.';
const String kBillingMenuTitle = 'Billing & receipts';
const String kBillingMenuSubtitle =
    'Invoice builder, payments, and due tracking';
const String kBillingEditorTitle = 'Create receipt';
const String kBillingEditorSubtitle =
    'Add bill items and payment summary for a patient.';
const String kBillingDetailTitle = 'Receipt detail';
const String kBillingAddTooltip = 'Create receipt';
const String kBillingCreateFromVisitButton = 'Create receipt';
const String kBillingSearchHint = 'Search invoice, name, or phone';
const String kBillingSummaryInvoices = 'Invoices';
const String kBillingSummaryCollected = 'Collected';
const String kBillingSummaryDue = 'Due';
const String kBillingEmptyTitle = 'No receipts yet.';
const String kBillingPatientHint = 'Select patient';
const String kBillingServiceHint = 'Service / item name';
const String kBillingQtyHint = 'Qty';
const String kBillingPriceHint = 'Price';
const String kBillingAddItemButton = 'Add item';
const String kBillingItemsTitle = 'Line items';
const String kBillingNoItemsText = 'No line items added.';
const String kBillingDiscountHint = 'Discount';
const String kBillingPaidHint = 'Paid amount';
const String kBillingPaymentModeHint = 'Payment mode';
const String kBillingNoteHint = 'Note (optional)';
const String kBillingSaveButton = 'Save receipt';
const String kBillingEditButton = 'Edit receipt';
const String kBillingShareButton = 'Share receipt';
const String kBillingSavedMessage = 'Receipt saved';
const String kBillingShareMockMessage = 'Share preview opened (mock)';
const String kBillingValidationPatientRequired = 'Please select a patient.';
const String kBillingValidationNoItems = 'Add at least one line item.';
const String kBillingValidationLineRequired =
    'Item name, quantity, and price are required.';
const String kBillingSubtotalLabel = 'Subtotal';
const String kBillingDiscountLabel = 'Discount';
const String kBillingTotalLabel = 'Total';
const String kBillingCollectedLabel = 'Collected';
const String kBillingDueLabel = 'Due';
const String kBillingPaymentModeLabel = 'Payment mode';
const String kBillingQtyLabel = 'Qty';
const String kBillingPriceLabel = 'Price';
const String kBillingNoteLabel = 'Note';
const List<String> kBillingPaymentModes = ['Cash', 'UPI', 'Card', 'Bank'];

// Follow-up reminders (UI only)
const String kFollowUpTitle = 'Follow-up reminders';
const String kFollowUpSubtitle =
    'Track due patients and convert follow-ups into completed outcomes.';
const String kFollowUpMenuTitle = 'Follow-up reminders';
const String kFollowUpMenuSubtitle =
    'Due list, quick reschedule, and completion tracking';
const String kFollowUpEditorTitle = 'Create follow-up';
const String kFollowUpEditorSubtitle =
    'Schedule a follow-up linked to visit, billing, or general patient care.';
const String kFollowUpDetailTitle = 'Follow-up detail';
const String kFollowUpCreateFromVisitButton = 'Create follow-up';
const String kFollowUpCreateFromBillingButton = 'Create follow-up';
const String kFollowUpAddTooltip = 'Add follow-up';
const String kFollowUpSummaryToday = 'Today';
const String kFollowUpSummaryUpcoming = 'Upcoming';
const String kFollowUpSummaryCompleted = 'Completed';
const String kFollowUpSearchHint = 'Search patient name or phone';
const String kFollowUpFilterToday = 'Today';
const String kFollowUpFilterUpcoming = 'Upcoming';
const String kFollowUpFilterCompleted = 'Completed';
const String kFollowUpFilterMissed = 'Missed';
const String kFollowUpFilterAll = 'All';
const String kFollowUpEmptyTitle = 'No follow-ups found.';
const String kFollowUpNoReason = 'No reason added';
const String kFollowUpMarkDoneShort = 'Done';
const String kFollowUpPatientHint = 'Select patient';
const String kFollowUpReasonHint = 'Follow-up reason';
const String kFollowUpNotesHint = 'Notes (optional)';
const String kFollowUpSaveButton = 'Save follow-up';
const String kFollowUpSavedMessage = 'Follow-up saved';
const String kFollowUpValidationPatientRequired = 'Please select a patient.';
const String kFollowUpValidationReasonRequired =
    'Please add follow-up reason before saving.';
const String kFollowUpReasonSectionTitle = 'Reason';
const String kFollowUpNotesSectionTitle = 'Notes';
const String kFollowUpMarkCompletedButton = 'Mark completed';
const String kFollowUpMarkMissedButton = 'Mark missed';
const String kFollowUpEditButton = 'Edit follow-up';
const String kFollowUpMarkedCompletedMessage = 'Follow-up marked completed';
const String kFollowUpMarkedMissedMessage = 'Follow-up marked missed';

// Staff management (UI only)
const String kStaffTitle = 'Staff management';
const String kStaffSubtitle =
    'Manage clinic staff roles, shift status, and access actions.';
const String kStaffMenuTitle = 'Staff management';
const String kStaffMenuSubtitle = 'Team directory, roles, and access controls';
const String kStaffEditorTitle = 'Add / edit staff';
const String kStaffEditorSubtitle =
    'Configure role, status, and shift details for non-doctor staff members.';
const String kStaffDetailTitle = 'Staff detail';
const String kStaffAddTooltip = 'Add staff';
const String kStaffSummaryTotal = 'Total';
const String kStaffSummaryActive = 'Active';
const String kStaffSummaryLeave = 'On leave';
const String kStaffSearchHint = 'Search by name, role, or phone';
const String kStaffFilterActive = 'Active';
const String kStaffFilterOnLeave = 'On leave';
const String kStaffFilterInactive = 'Inactive';
const String kStaffFilterAll = 'All';
const String kStaffEmptyTitle = 'No staff records found.';
const String kStaffDeactivateShort = 'Deactivate';
const String kStaffNameHint = 'Staff full name';
const String kStaffPhoneHint = 'Mobile number';
const String kStaffEmailHint = 'Email (optional)';
const String kStaffRoleHint = 'Select role';
const String kStaffStatusHint = 'Select status';
const String kStaffShiftHint = 'Shift label (optional)';
const String kStaffPermissionsHint = 'Permissions summary';
const String kStaffNotesHint = 'Notes (optional)';
const String kStaffSaveButton = 'Save staff member';
const String kStaffSavedMessage = 'Staff profile saved';
const String kStaffValidationNamePhoneRequired = 'Name and phone are required.';
const String kStaffValidationPhoneInvalid =
    'Enter a valid 10-digit phone number.';
const String kStaffJoinedLabel = 'Joined';
const String kStaffShiftLabel = 'Shift';
const String kStaffPermissionsLabel = 'Permissions';
const String kStaffNotesLabel = 'Notes';
const String kStaffMarkActiveButton = 'Mark active';
const String kStaffMarkOnLeaveButton = 'Mark on leave';
const String kStaffMarkInactiveButton = 'Mark inactive';
const String kStaffEditButton = 'Edit staff profile';
const String kStaffResetAccessButton = 'Reset access';
const String kStaffMarkedActiveMessage = 'Staff marked active';
const String kStaffMarkedOnLeaveMessage = 'Staff marked on leave';
const String kStaffMarkedInactiveMessage = 'Staff marked inactive';
const String kStaffResetAccessMessage = 'Access reset link shared (mock)';

// Doctor management (UI only)
const String kDoctorTitle = 'Doctor management';
const String kDoctorSubtitle =
    'Manage available doctors, specializations, and OPD schedules.';
const String kDoctorMenuTitle = 'Doctor management';
const String kDoctorMenuSubtitle = 'Doctor roster, status, and OPD schedules';
const String kDoctorEditorTitle = 'Add / edit doctor';
const String kDoctorEditorSubtitle =
    'Configure profile, specialization, and current duty status.';
const String kDoctorDetailTitle = 'Doctor detail';
const String kDoctorAddTooltip = 'Add doctor';
const String kDoctorSummaryTotal = 'Total';
const String kDoctorSummaryAvailable = 'Available';
const String kDoctorSummaryBusy = 'Busy';
const String kDoctorSearchHint = 'Search by doctor name or specialization';
const String kDoctorFilterAvailable = 'Available';
const String kDoctorFilterBusy = 'Busy';
const String kDoctorFilterOffDuty = 'Off duty';
const String kDoctorFilterAll = 'All';
const String kDoctorEmptyTitle = 'No doctors found.';
const String kDoctorOffDutyShort = 'Off duty';
const String kDoctorNameHint = 'Doctor full name';
const String kDoctorSpecializationHint = 'Specialization';
const String kDoctorPhoneHint = 'Mobile number';
const String kDoctorEmailHint = 'Email (optional)';
const String kDoctorStatusHint = 'Select status';
const String kDoctorExperienceHint = 'Experience (e.g. 8 years)';
const String kDoctorOpdHint = 'OPD timings';
const String kDoctorNotesHint = 'Notes (optional)';
const String kDoctorSaveButton = 'Save doctor profile';
const String kDoctorSavedMessage = 'Doctor profile saved';
const String kDoctorValidationRequired =
    'Name, specialization, and phone are required.';
const String kDoctorValidationPhoneInvalid =
    'Enter a valid 10-digit phone number.';
const String kDoctorExperienceLabel = 'Experience';
const String kDoctorOpdLabel = 'OPD timings';
const String kDoctorNotesLabel = 'Notes';
const String kDoctorMarkAvailableButton = 'Mark available';
const String kDoctorMarkBusyButton = 'Mark busy';
const String kDoctorMarkOffDutyButton = 'Mark off duty';
const String kDoctorEditButton = 'Edit doctor profile';
const String kDoctorMarkedAvailableMessage = 'Doctor marked available';
const String kDoctorMarkedBusyMessage = 'Doctor marked busy';
const String kDoctorMarkedOffDutyMessage = 'Doctor marked off duty';
const String kAddAppointmentDoctorLabel = 'Doctor';
const String kAddAppointmentDoctorHint = 'Assign doctor (optional)';
const String kAppointmentDetailDoctorLabel = 'Doctor';

// Reports dashboard (UI only)
const String kReportsTitle = 'Reports dashboard';
const String kReportsSubtitle =
    'Track visits, revenue, no-shows, and conversion trends.';
const String kReportsMenuTitle = 'Reports dashboard';
const String kReportsMenuSubtitle = 'KPIs, trends, and quick insights';
const String kReportsKpiVisits = 'Total visits';
const String kReportsKpiRevenue = 'Revenue';
const String kReportsKpiNoShows = 'No-shows';
const String kReportsKpiFollowUpConversion = 'Follow-up conversion';
const String kReportsTrendTitle = 'Trend breakdown';
const String kReportsActionBilling = 'Open billing details';
const String kReportsActionFollowUp = 'Open follow-up outcomes';
