/// Route argument keys for auth flows.
class AuthRouteArgs {
  AuthRouteArgs._();

  static const String otpFlow = 'otpFlow';
  static const String contact = 'contact';
  static const String isPhone = 'isPhone';
}

/// Why the user is on the OTP screen.
enum AuthOtpFlow {
  forgotPassword,
  login,
  register,
}
