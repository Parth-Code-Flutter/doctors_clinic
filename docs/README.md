# Clinic Patient Register & Appointment Reminder SaaS

## 1. Product Summary

This project is a lightweight SaaS product for small and medium clinics in India.

The first version helps clinics:

- Create or log in to a clinic account
- Register and manage patients
- Create and track patient appointments
- Send appointment reminders
- View today's and upcoming appointments

The goal is to start with a simple, useful clinic operations tool and later grow into a more complete clinic management platform.

## 2. Target Users

Primary users:

- Small clinics
- Solo doctors
- Dental clinics
- Skin and hair clinics
- Physiotherapy clinics
- Eye clinics
- Fertility clinics
- Wellness and consultation centers

Secondary users for future versions:

- Clinic receptionists
- Multiple doctors inside one clinic
- Patients
- Clinic owners with multiple branches

## 3. Core Problem

Many clinics still manage patients and appointments through notebooks, Excel sheets, phone calls, and WhatsApp chats. This creates problems such as:

- Missed appointments
- No clean patient list
- Hard-to-find patient history
- Manual reminder work
- Poor follow-up process
- No quick view of today's clinic schedule

The MVP solves the first layer of this problem: patient registration and appointment reminders.

## 4. MVP Positioning

Simple product statement:

> A simple patient register and appointment reminder system for Indian clinics.

Do not position the first version as a full EMR, hospital management system, or Practo-style marketplace.

The MVP should feel easy, fast, and practical for small clinics.

## 5. MVP Features

### 5.1 Clinic Account

- User can open a new clinic
- User can log in to an existing clinic
- Clinic can store basic profile details
- Clinic can configure working days and hours

### 5.2 Patient Management

- Add patient
- View patient list
- Search patients
- View patient profile
- Edit patient details
- Track appointment history for each patient

### 5.3 Appointment Management

- Create appointment for a patient
- View today's appointments
- View upcoming appointments
- Mark appointment as completed
- Mark appointment as cancelled
- Mark appointment as missed

### 5.4 Reminder System

- Send appointment reminder before scheduled time
- Show reminder status
- Allow manual reminder resend

Recommended reminder channels by priority:

1. WhatsApp reminder
2. SMS reminder
3. In-app notification for clinic staff
4. Patient mobile app push notification in future

## 6. Entry Flow

When the user opens the app, show two options:

1. Login To Clinic
2. Open New Clinic

### 6.1 Login To Clinic

Use this when the clinic already has an account.

Possible login methods:

- Phone number + OTP
- Email + password
- Phone number + password

For the Indian market, phone number + OTP is recommended for future production use.

### 6.2 Open New Clinic

Use this when a doctor or clinic owner is creating a clinic account for the first time.

Required fields:

- Clinic name
- Owner or doctor name
- Mobile number
- Email address
- Password or OTP verification

Optional setup fields:

- Clinic address
- City
- State
- Pincode
- Clinic type
- Working days
- Working hours
- Default reminder time

## 7. Screen List

### 7.1 Authentication & Setup Screens

| Screen | Purpose |
| --- | --- |
| Splash Screen | Initial loading screen |
| Welcome / Entry Screen | Shows "Login To Clinic" and "Open New Clinic" |
| Login To Clinic | Login for existing clinic users |
| Open New Clinic | Register a new clinic account |
| OTP Verification | Verify mobile number |
| Forgot Password | Recover account access |
| Clinic Setup | Configure basic clinic details |

### 7.2 Main App Screens

| Screen | Purpose |
| --- | --- |
| Dashboard | Summary of today's appointments, upcoming appointments, patient count |
| Patient List | Search and view registered patients |
| Add Patient | Register a new patient |
| Patient Profile | View patient details and appointment history |
| Edit Patient | Update patient information |
| Add Appointment | Create appointment for a patient |
| Appointment List | View appointments by status and date |
| Appointment Detail | View appointment details and reminder status |
| Notifications / Reminders | View sent and scheduled reminders |
| Settings | Clinic profile, reminder settings, account options |

### 7.3 Future Screens

| Screen | Purpose |
| --- | --- |
| Staff Management | Add receptionist or staff accounts |
| Doctor Management | Add multiple doctors in one clinic |
| Branch Management | Manage multiple clinic branches |
| Patient Timeline | View visits, notes, reminders, and history |
| Billing | Create invoices and payment records |
| Reports | Revenue, appointment, and patient analytics |
| Subscription Plan | Manage SaaS billing |
| Patient Portal | Patient-facing appointment and reminder view |

## 8. Recommended MVP Navigation

Main navigation should include:

- Dashboard
- Patients
- Appointments
- Reminders
- Settings

For mobile-first design, use a bottom navigation bar.

For tablet and desktop, use a sidebar.

## 9. Data Model

### 9.1 Clinic

| Field | Type | Notes |
| --- | --- | --- |
| id | string | Unique clinic ID |
| name | string | Clinic name |
| ownerName | string | Doctor or owner name |
| phone | string | Primary clinic phone |
| email | string | Clinic email |
| address | string | Optional in MVP |
| city | string | Optional |
| state | string | Optional |
| pincode | string | Optional |
| clinicType | string | Example: dental, skin, physio |
| workingDays | array | Example: Monday to Saturday |
| workingHours | object | Opening and closing time |
| defaultReminderMinutes | number | Example: 60 or 1440 |
| createdAt | datetime | Account creation date |
| updatedAt | datetime | Last update date |

### 9.2 User

| Field | Type | Notes |
| --- | --- | --- |
| id | string | Unique user ID |
| clinicId | string | Linked clinic |
| name | string | User name |
| phone | string | Login phone |
| email | string | Optional |
| role | string | owner, doctor, receptionist |
| status | string | active, inactive |
| createdAt | datetime | User creation date |

### 9.3 Patient

| Field | Type | Notes |
| --- | --- | --- |
| id | string | Unique patient ID |
| clinicId | string | Linked clinic |
| fullName | string | Patient name |
| phone | string | Patient mobile number |
| gender | string | male, female, other, not_specified |
| age | number | Optional if dateOfBirth is used |
| dateOfBirth | date | Optional |
| address | string | Optional |
| notes | string | Basic clinic notes only |
| lastVisitAt | datetime | Auto-updated later |
| nextAppointmentAt | datetime | Auto-updated later |
| createdAt | datetime | Registration date |
| updatedAt | datetime | Last update date |

### 9.4 Appointment

| Field | Type | Notes |
| --- | --- | --- |
| id | string | Unique appointment ID |
| clinicId | string | Linked clinic |
| patientId | string | Linked patient |
| doctorId | string | Optional in MVP |
| scheduledAt | datetime | Appointment date and time |
| reason | string | Optional visit reason |
| notes | string | Internal appointment note |
| status | string | upcoming, completed, cancelled, missed |
| reminderStatus | string | pending, sent, failed, skipped |
| reminderSentAt | datetime | Last reminder sent time |
| createdAt | datetime | Appointment creation date |
| updatedAt | datetime | Last update date |

### 9.5 Reminder

| Field | Type | Notes |
| --- | --- | --- |
| id | string | Unique reminder ID |
| clinicId | string | Linked clinic |
| patientId | string | Linked patient |
| appointmentId | string | Linked appointment |
| channel | string | whatsapp, sms, push, email |
| scheduledFor | datetime | When reminder should be sent |
| sentAt | datetime | When reminder was sent |
| status | string | pending, sent, failed, cancelled |
| message | string | Reminder message |
| providerResponse | object | Optional delivery provider response |

## 10. Reminder Message Examples

### 10.1 WhatsApp / SMS Reminder

```text
Hello {{patientName}}, this is a reminder for your appointment at {{clinicName}} on {{date}} at {{time}}. Please contact {{clinicPhone}} if you need to reschedule.
```

### 10.2 Follow-up Reminder

```text
Hello {{patientName}}, this is a follow-up reminder from {{clinicName}}. Please contact us at {{clinicPhone}} if you need further assistance.
```

## 11. Suggested Tech Stack

The final stack can change, but the project should be built with future scaling in mind.

### 11.1 Frontend

Recommended:

- React / Next.js
- TypeScript
- Tailwind CSS or a component library
- Progressive Web App support

Why:

- Works on mobile, tablet, and desktop
- Faster to launch than native mobile apps
- Can later be wrapped into Android/iOS apps

### 11.2 Backend

Recommended:

- Node.js / NestJS / Express
- PostgreSQL
- Prisma ORM
- Redis or background job queue for reminders

Alternative fast MVP option:

- Supabase for auth, database, and storage
- Edge functions or serverless functions for reminder jobs

### 11.3 Notification Providers

Possible providers:

- WhatsApp Business API provider
- SMS provider such as MSG91, Gupshup, Twilio, or similar
- Firebase Cloud Messaging for push notifications

For India, WhatsApp and SMS are more practical than patient app push notifications in the first version.

## 12. Suggested Architecture

```text
Frontend App
  |
  |-- Authentication
  |-- Dashboard
  |-- Patient Module
  |-- Appointment Module
  |-- Reminder Module
  |-- Settings Module

Backend API
  |
  |-- Auth Service
  |-- Clinic Service
  |-- Patient Service
  |-- Appointment Service
  |-- Reminder Service
  |-- Notification Provider Adapter

Database
  |
  |-- clinics
  |-- users
  |-- patients
  |-- appointments
  |-- reminders
```

## 13. Reference Project Keyword

Use this keyword when asking future development work to follow the existing Flutter project structure:

```text
qobo ref project
```

Reference project path:

```text
/Users/onlymac/Documents/Projects/qobo_one_live
```

When this keyword is used, inspect the reference project before implementation and follow its Flutter structure and coding pattern where suitable.

**Coding rules:** See [`DEVELOPMENT_RULES.md`](DEVELOPMENT_RULES.md) for mandatory project conventions (common widgets, GetX structure, string constants, controllers, etc.).

Current observed reference pattern:

- GetX architecture
- Feature folders with `bindings`, `controllers`, and `views`
- Routes managed through `lib/routes/app_pages.dart` and `lib/routes/app_routes.dart`
- Shared code organized under `lib/constants`, `lib/repo`, `lib/services`, and `lib/utils`
- Controllers extend `GetxController`
- Views commonly extend `GetView<Controller>`
- Bindings use `Get.lazyPut`

### Project Folder Convention

For this Doctors Clinic app, always create normal lowercase folders in the same style as the qobo ref project unless explicitly told otherwise:

```text
lib/app/<feature_group>/<feature_name>/bindings
lib/app/<feature_group>/<feature_name>/controllers
lib/app/<feature_group>/<feature_name>/views
```

Example (same as qobo ref project):

```text
lib/app/splash/splash/bindings/splash_binding.dart
lib/app/splash/splash/controllers/splash_controller.dart
lib/app/splash/splash/views/splash_view.dart
```

Note: In Cursor/VS Code, `app` → `splash` → `splash` may display as a compact name like `app.splash.splash`. That is normal; on disk these are separate nested folders, not one dotted folder name.

Do not create package-style or dotted folders such as `App.splash`.
Create real folders using filesystem directories, matching the qobo ref project pattern.

## 14. API Planning

### 14.1 Auth APIs

- `POST /auth/register-clinic`
- `POST /auth/login`
- `POST /auth/send-otp`
- `POST /auth/verify-otp`
- `POST /auth/logout`

### 14.2 Clinic APIs

- `GET /clinic/me`
- `PATCH /clinic/me`

### 14.3 Patient APIs

- `GET /patients`
- `POST /patients`
- `GET /patients/:id`
- `PATCH /patients/:id`
- `DELETE /patients/:id`

For production, prefer soft delete instead of permanent delete.

### 14.4 Appointment APIs

- `GET /appointments`
- `POST /appointments`
- `GET /appointments/:id`
- `PATCH /appointments/:id`
- `POST /appointments/:id/complete`
- `POST /appointments/:id/cancel`
- `POST /appointments/:id/mark-missed`

### 14.5 Reminder APIs

- `GET /reminders`
- `POST /appointments/:id/send-reminder`
- `POST /reminders/:id/retry`

## 15. MVP Business Model

All pricing should be considered in Indian rupees.

Suggested plans:

| Plan | Monthly Price | Best For |
| --- | ---: | --- |
| Starter | ₹999/month | Solo doctor |
| Clinic | ₹1,999/month | Small clinic |
| Pro | ₹3,999/month | Multi-doctor clinic |

Suggested setup fee:

| Setup Type | Price |
| --- | ---: |
| Basic setup | ₹2,999 |
| Assisted setup | ₹4,999 |
| Full onboarding | ₹9,999 |

The first 5 to 10 clinics can be offered a discounted pilot price in exchange for feedback.

## 16. Cost Estimate

Early monthly operating cost estimate:

| Item | Estimated Cost |
| --- | ---: |
| Domain | ₹800-₹1,500/year |
| Hosting | ₹500-₹2,000/month |
| Database | ₹0-₹2,000/month |
| SMS / WhatsApp | ₹500-₹5,000/month |
| AI features | ₹0-₹3,000/month initially |
| Monitoring / logs | ₹0-₹1,000/month |

Expected early running cost:

```text
₹2,000 to ₹10,000/month
```

Example revenue:

| Clinics | Monthly Price | Monthly Revenue |
| ---: | ---: | ---: |
| 10 | ₹1,999 | ₹19,990 |
| 25 | ₹1,999 | ₹49,975 |
| 50 | ₹1,999 | ₹99,950 |
| 100 | ₹1,999 | ₹1,99,900 |

## 17. Compliance & Privacy Notes

Because the app handles patient information, privacy must be treated seriously from the beginning.

Important principles:

- Store only necessary patient data in MVP
- Avoid storing full medical records in first version
- Use secure authentication
- Encrypt sensitive data where possible
- Restrict data access by clinic
- Keep audit logs for important actions in future
- Add clear privacy policy and terms
- Follow India's Digital Personal Data Protection Act requirements

MVP should avoid:

- Prescription generation
- Diagnosis storage
- Lab report storage
- Deep medical history
- Insurance or payment records

These can be added later after stronger compliance planning.

## 18. Development Phases

### Phase 1: MVP

Goal: Validate with real clinics.

Features:

- Clinic registration
- Clinic login
- Dashboard
- Add patient
- Patient list
- Patient profile
- Add appointment
- Appointment list
- Appointment status update
- Basic reminder status

### Phase 2: Reminder Automation

Goal: Reduce manual work for clinic staff.

Features:

- Scheduled SMS reminders
- Scheduled WhatsApp reminders
- Reminder retry
- Reminder delivery status
- Default reminder time setting

### Phase 3: Staff & Multi-Doctor Support

Goal: Support larger clinics.

Features:

- Staff accounts
- Role permissions
- Multiple doctors
- Doctor-wise appointment calendar
- Receptionist workflow

### Phase 4: Growth Features

Goal: Help clinics improve repeat visits and reputation.

Features:

- Follow-up reminders
- Google review request
- Missed appointment follow-up
- Birthday or health camp messages
- Patient segmentation

### Phase 5: Advanced Clinic Management

Goal: Expand into a more complete clinic system.

Features:

- Billing
- Prescription builder
- Visit notes
- Reports
- Multi-branch support
- Patient portal
- Mobile apps

## 19. Success Metrics

Track these from the beginning:

- Number of clinics registered
- Number of active clinics
- Number of patients added per clinic
- Number of appointments created per clinic
- Reminder delivery success rate
- Missed appointment reduction
- Monthly recurring revenue
- Churn rate
- Average revenue per clinic

## 20. MVP Validation Plan

Before building too much, validate with 10 to 20 clinics.

Questions to ask clinic owners:

- How do you currently register patients?
- How do you track appointments?
- How many appointments are missed every week?
- Do you send reminders manually?
- Do you use WhatsApp for patient communication?
- Would you pay ₹999 to ₹1,999/month for automatic reminders and patient tracking?
- Who will use the software: doctor or receptionist?
- Which device will they use: phone, tablet, laptop, or desktop?

Validation target:

- At least 5 clinics agree to pilot
- At least 2 clinics agree to pay after demo
- Clinics clearly say appointment reminders save time or reduce missed visits

## 21. Design Principles

The app should be:

- Mobile-first
- Fast to use
- Simple enough for reception staff
- Clear for non-technical users
- Available in English first
- Ready for Hindi and regional language support later

Avoid:

- Too many form fields
- Complex medical terminology
- Heavy dashboards
- Features that require patient app installation
- Full EMR complexity in the MVP

## 22. Future Feature Backlog

Possible future features:

- WhatsApp appointment booking
- Patient self-booking page
- QR code for clinic registration desk
- Google review request after appointment
- Follow-up campaigns
- Staff roles and permissions
- Doctor calendar
- Prescription generation
- Billing and invoices
- Payment collection
- Reports and analytics
- Patient import from Excel
- Multi-language support
- Multi-branch support
- Android app
- Patient app

## 23. First Build Checklist

- [ ] Decide app name
- [ ] Choose tech stack
- [ ] Create database schema
- [ ] Build authentication
- [ ] Build clinic registration
- [ ] Build patient CRUD
- [ ] Build appointment CRUD
- [ ] Build dashboard
- [ ] Add reminder scheduling foundation
- [ ] Add manual reminder button
- [ ] Test with sample clinic data
- [ ] Demo to first clinic
- [ ] Collect feedback
- [ ] Improve MVP

## 24. Implementation Progress Tracker

Use this section to track product, UI, and API progress during development.

**Maintenance rule:** Whenever a screen, API, module, or shared foundation (theme, routing, etc.) is completed in code, update the tables in this section in the same work session so the README stays aligned with the repo.

Status values:

- `Not Started`
- `In Progress`
- `Blocked`
- `Needs Review`
- `Done`

### 24.1 Screen List & UI Progress

| Screen | Priority | UI Status | API Status | Notes |
| --- | --- | --- | --- | --- |
| Splash Screen | Low | Done | Not Needed | Initial animated splash screen created |
| Welcome / Entry Screen | High | Done | Not Needed | Login / Open New Clinic choices; navigates from splash |
| Login To Clinic | High | Done | Not Started | Email/phone + password + OTP link; API pending v0.2 |
| Open New Clinic | High | Done | Not Started | Registration form UI; API pending v0.2 |
| OTP Verification | Medium | Done | Not Started | 6-digit OTP, resend timer; API pending v0.2 |
| Forgot Password | Low | Done | Not Started | Sends OTP → reset password flow; API pending v0.2 |
| Clinic Setup | Medium | Done | Not Started | Profile, hours, reminder defaults; API pending v0.2 |
| Main shell (custom bottom nav) | High | Done | Not Needed | Floating clinic dock; 4 tabs with placeholders |
| Dashboard | High | Done | Not Started | Hero, stats, quick actions, today's schedule (mock data) |
| Patient List | High | Done | Not Started | Search, filters, FAB; mock repository |
| Add Patient | High | Done | Not Started | 3-step wizard with tips and quick picks |
| Patient Profile | High | Done | Not Started | Details, visit history mock, call/book/edit |
| Edit Patient | Medium | Done | Not Started | Single-page form; updates mock repository |
| Add Appointment | High | Done | Not Started | 2-step booking wizard with patient picker |
| Appointment List | High | Done | Not Started | Grouped by day, filters, summary strip |
| Appointment Detail | Medium | Done | Not Started | Status actions + reminder placeholder |
| Notifications / Reminders | Medium | Not Started | Not Started | Scheduled and sent reminders |
| Settings | Medium | Done | Not Started | More hub + clinic profile, reminders, account, about (mock repository) |
| Staff Management | Future | Not Started | Not Started | Phase 3 feature |
| Doctor Management | Future | Not Started | Not Started | Phase 3 feature |
| Branch Management | Future | Not Started | Not Started | Phase 5 feature |
| Patient Timeline | Future | Not Started | Not Started | Phase 5 feature |
| Billing | Future | Not Started | Not Started | Phase 5 feature |
| Reports | Future | Not Started | Not Started | Phase 5 feature |
| Subscription Plan | Future | Not Started | Not Started | SaaS billing feature |
| Patient Portal | Future | Not Started | Not Started | Patient-facing feature |

### 24.2 API Progress

| API | Method | Priority | Status | Used By Screen |
| --- | --- | --- | --- | --- |
| `/auth/register-clinic` | POST | High | Not Started | Open New Clinic |
| `/auth/login` | POST | High | Not Started | Login To Clinic |
| `/auth/send-otp` | POST | Medium | Not Started | Login To Clinic, OTP Verification |
| `/auth/verify-otp` | POST | Medium | Not Started | OTP Verification |
| `/auth/logout` | POST | Medium | Not Started | Settings |
| `/clinic/me` | GET | High | Not Started | Dashboard, Settings |
| `/clinic/me` | PATCH | Medium | Not Started | Clinic Setup, Settings |
| `/patients` | GET | High | Not Started | Patient List |
| `/patients` | POST | High | Not Started | Add Patient |
| `/patients/:id` | GET | High | Not Started | Patient Profile |
| `/patients/:id` | PATCH | Medium | Not Started | Edit Patient |
| `/patients/:id` | DELETE | Low | Not Started | Patient Profile |
| `/appointments` | GET | High | Not Started | Dashboard, Appointment List |
| `/appointments` | POST | High | Not Started | Add Appointment |
| `/appointments/:id` | GET | Medium | Not Started | Appointment Detail |
| `/appointments/:id` | PATCH | Medium | Not Started | Appointment Detail |
| `/appointments/:id/complete` | POST | Medium | Not Started | Appointment Detail |
| `/appointments/:id/cancel` | POST | Medium | Not Started | Appointment Detail |
| `/appointments/:id/mark-missed` | POST | Medium | Not Started | Appointment Detail |
| `/reminders` | GET | Medium | Not Started | Notifications / Reminders |
| `/appointments/:id/send-reminder` | POST | Medium | Not Started | Appointment Detail |
| `/reminders/:id/retry` | POST | Low | Not Started | Notifications / Reminders |

### 24.3 Module Progress

| Module | Product Status | UI Status | API Status | Database Status | Notes |
| --- | --- | --- | --- | --- | --- |
| App foundation (GetX, routes, qobo folder layout) | In Progress | Done | Not Needed | Not Needed | Splash + Welcome + main shell; `lib/routes`, `lib/constants` |
| Design tokens (theme colors) | Done | Done | Not Needed | Not Needed | `lib/constants/color_constants.dart` — slate primary, cyan logo accent, cyan-tint secondary buttons |
| Shared UI widgets (`appButton`, `AppTextField`) | Done | Done | Not Needed | Not Needed | `lib/utils/app_widgets/`, `lib/utils/text_utils/`, `lib/utils/ui_utils/` |
| Authentication | In Progress | Done | Not Started | Not Started | All auth/setup screens UI done; APIs pending v0.2 |
| Clinic Setup | In Progress | Done | Not Started | Not Started | Onboarding form after register/login/OTP |
| Patient Management | In Progress | Done | Not Started | Not Started | UI complete; APIs in v0.2 |
| Appointment Management | In Progress | Done | Not Started | Not Started | UI complete; APIs in v0.3 |
| Reminder System | Not Started | Not Started | Not Started | Not Started | Manual reminder first, automation second |
| Dashboard | In Progress | Done | Not Started | Not Started | Home tab UI with mock data; APIs in v0.3 |
| Settings | In Progress | Done | Not Started | Not Started | UI complete; APIs in v0.2/v0.4 |

### 24.4 Release Progress

| Version | Goal | Status | Notes |
| --- | --- | --- | --- |
| v0.1 | Static UI screens and navigation | Done | Full auth + clinic setup UI flow complete |
| v0.2 | Auth, clinic setup, patient CRUD | Not Started | Wire auth/clinic APIs + patient CRUD |
| v0.3 | Appointment CRUD and dashboard | Not Started | First clinic demo version |
| v0.4 | Manual reminders | Not Started | Can test real workflow |
| v0.5 | Automated reminders | Not Started | Pilot-ready version |
| v1.0 | Paid MVP launch | Not Started | Stable enough for first paying clinics |

## 25. Important Product Decision

The first version should not depend on patients installing an app.

Reason:

Most patients will not install a separate app for one clinic. Clinics already communicate through phone calls, SMS, and WhatsApp. Therefore, the clinic-facing app should be the main product, while patient-facing app features can come later.

## 26. Recommended First Version Name Ideas

- ClinicPulse
- ClinicDay
- PatientDesk
- ClinicTrack
- VisitFlow
- ApptCare
- ClinicMate

These are only working names. Check domain and trademark availability before finalizing.
