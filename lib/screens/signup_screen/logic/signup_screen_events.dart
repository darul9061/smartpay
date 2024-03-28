part of 'signup_screen_bloc.dart';

abstract class SignUpScreenEvent {}

class SignUpScreenTapEvent extends SignUpScreenEvent {

  final String firstname;

  final String lastname;

  final String password;

  final String email;

  final String phoneNumber;

  SignUpScreenTapEvent({required this.firstname, required this.lastname, required this.email, required this.password, required this.phoneNumber});

}
