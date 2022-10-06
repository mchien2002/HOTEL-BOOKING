// ignore_for_file: constant_identifier_names
abstract class RegisterRepository {
  static const LOGIN_BY_PHONE = "/v1/oauth/register";
  static const CONFIRM_OTP = "/v1/oauth/register/otp";
  Future<String?> register(String phoneStr, bool resend);
  Future<String?> confirmOTP(String phone, String code);
}
