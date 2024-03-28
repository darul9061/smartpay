part of 'verification_screen_bloc.dart';

abstract class VerificationScreenEvent {}

class VerificationScreenTapEvent extends VerificationScreenEvent {

  final String email;

  final int token;

  VerificationScreenTapEvent({required this.email, required this.token}); 
  
}

class ResendVerificationEvent extends VerificationScreenEvent{

  final String email;

  ResendVerificationEvent({required this.email});

}
