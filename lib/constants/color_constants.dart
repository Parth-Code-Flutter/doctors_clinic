import 'package:flutter/material.dart';

// --- Brand & surfaces ---

/// Page background (#F8FAFC).
const Color kColorBackground = Color(0xFFF8FAFC);

/// Cards, forms, and elevated surfaces (#FFFFFF).
const Color kColorSurface = Color(0xFFFFFFFF);

/// Logo container background (#0F172A).
const Color kColorLogoBackground = Color(0xFF0F172A);

/// Logo icon accent (#06B6D4). Use [kColorLogoIconOnDark] for white on dark logo.
const Color kColorLogoIcon = Color(0xFF06B6D4);

/// Logo icon on dark background (white alternative).
const Color kColorLogoIconOnDark = Color(0xFFFFFFFF);

// --- Typography ---

/// Titles and primary headings (#0F172A).
const Color kColorTitle = Color(0xFF0F172A);

const Color kColorText = kColorTitle;
const Color kColorTextSecondary = Color(0xFF64748B);
const Color kColorBorder = Color(0xFFE2E8F0);

/// Soft shadow for floating bottom nav dock (~8% slate).
const Color kColorBottomNavShadow = Color(0x140F172A);

/// Dashboard hero gradient end (#1E293B).
const Color kColorDashboardGradientEnd = Color(0xFF1E293B);

/// Soft card shadow on dashboard (~6% slate).
const Color kColorCardShadow = Color(0x0F0F172A);

// --- Buttons & links ---

/// Primary button background (#0F172A).
const Color kColorPrimary = Color(0xFF0F172A);

/// Primary button pressed state.
const Color kColorPrimaryDark = Color(0xFF020617);

/// Primary button label (on dark button).
const Color kColorOnPrimary = Color(0xFFFFFFFF);

/// Secondary button background (#CFFAFE).
const Color kColorSecondaryButtonBackground = Color(0xFFCFFAFE);

/// Secondary button label (#0891B2).
const Color kColorSecondaryButtonText = Color(0xFF0891B2);

/// Important links (#0891B2).
const Color kColorLink = Color(0xFF0891B2);

/// @deprecated Prefer [kColorLink] or [kColorSecondaryButtonText].
const Color kColorAccent = kColorLink;

// --- Appointment status ---

/// Success / completed appointment (#16A34A).
const Color kColorAppointmentSuccess = Color(0xFF16A34A);

/// Missed appointment (#DC2626).
const Color kColorAppointmentMissed = Color(0xFFDC2626);

/// Pending / upcoming appointment (#F59E0B).
const Color kColorAppointmentPending = Color(0xFFF59E0B);

/// Cancelled appointment (#64748B).
const Color kColorAppointmentCancelled = Color(0xFF64748B);

// --- General semantic ---

const Color kColorSuccess = kColorAppointmentSuccess;
const Color kColorWarning = kColorAppointmentPending;
const Color kColorError = kColorAppointmentMissed;
