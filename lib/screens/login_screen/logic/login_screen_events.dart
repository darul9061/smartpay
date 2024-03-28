part of 'login_screen_bloc.dart';

abstract class LoginScreenEvent {}

class LoginScreenTapEvent extends LoginScreenEvent {

  final String email;
  
  final String password;

  LoginScreenTapEvent({required this.email, required this.password});

}
