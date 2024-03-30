part of 'signup_screen_bloc.dart';

abstract class SignUpScreenEvent {}

class SignUpGetEmailVerifTokenEvent extends SignUpScreenEvent{

  final String email;

  SignUpGetEmailVerifTokenEvent({required this.email});

}

class SignUpResendVerificationEvent extends SignUpScreenEvent {

  final String email;

  SignUpResendVerificationEvent({required this.email});

}

class SignUpEmailVerificationEvent extends SignUpScreenEvent {

  final String email;

  final int token;

  SignUpEmailVerificationEvent({required this.email, required this.token}); 
  
}

class SignUpScreenTapEvent extends SignUpScreenEvent {

  final String firstname;

  final String lastname;

  final String password;

  final String email;

  final String phoneNumber;

  SignUpScreenTapEvent({required this.firstname, required this.lastname, required this.email, required this.password, required this.phoneNumber});

}
