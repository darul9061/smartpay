part of 'forgot_password_screen_bloc.dart';

abstract class ForgotPasswordScreenEvents {}

class ForgotPasswordScreenOnTapResetEvents extends ForgotPasswordScreenEvents {
  
  final String newPassword;

  final String confirmPassword;

  ForgotPasswordScreenOnTapResetEvents({required this.confirmPassword, required this.newPassword});

}

class ForgotPasswordScreenOnTapVerifyEvents extends ForgotPasswordScreenEvents {
  
  final int token;

  final email;

  ForgotPasswordScreenOnTapVerifyEvents({required this.token, required this.email});

}

class ForgotPasswordScreenOnTapSendOTPEvents extends ForgotPasswordScreenEvents {
  
  final String email;

  ForgotPasswordScreenOnTapSendOTPEvents({required this.email});

}
