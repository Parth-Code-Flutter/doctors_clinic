import 'package:flutter/material.dart';

// --- Brand & actions ---

/// Primary buttons (#0F766E).
const Color kColorPrimary = Color(0xFF0F766E);

/// Primary button pressed / darker accent.
const Color kColorPrimaryDark = Color(0xFF115E59);

/// Secondary button background (#E0F2FE).
const Color kColorSecondaryButtonBackground = Color(0xFFE0F2FE);

/// Secondary button label and important links (#2563EB).
const Color kColorSecondaryButtonText = Color(0xFF2563EB);

/// Important links (#2563EB).
const Color kColorLink = Color(0xFF2563EB);

/// @deprecated Prefer [kColorLink] or [kColorSecondaryButtonText].
const Color kColorAccent = kColorLink;

// --- Surfaces ---

/// Page background (#F8FAFC).
const Color kColorBackground = Color(0xFFF8FAFC);

/// Cards, forms, and elevated surfaces (#FFFFFF).
const Color kColorSurface = Color(0xFFFFFFFF);

// --- Text & borders ---

const Color kColorText = Color(0xFF0F172A);
const Color kColorTextSecondary = Color(0xFF64748B);
const Color kColorBorder = Color(0xFFE2E8F0);

// --- Appointment status ---

/// Success / completed appointment (#16A34A).
const Color kColorAppointmentSuccess = Color(0xFF16A34A);

/// Missed appointment (#DC2626).
const Color kColorAppointmentMissed = Color(0xFFDC2626);

/// Pending / upcoming appointment (#F59E0B).
const Color kColorAppointmentPending = Color(0xFFF59E0B);

/// Cancelled appointment (#64748B).
const Color kColorAppointmentCancelled = Color(0xFF64748B);

// --- General semantic (aligned with appointment palette) ---

const Color kColorSuccess = kColorAppointmentSuccess;
const Color kColorWarning = kColorAppointmentPending;
const Color kColorError = kColorAppointmentMissed;
