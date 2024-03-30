part of 'central_bloc.dart';

abstract class CentralBLocEvent {}

class CentralBLocPinCheckEvent extends CentralBLocEvent {

  final bool preloader;

  final bool keepPreloaderLoading;

  final String passwordKey;

  final UserDetailModel userData;

  CentralBLocPinCheckEvent({
    
    required this.passwordKey,
    required this.userData,
    this.preloader = true, 
    this.keepPreloaderLoading = false
    
  });
}

class CentralBLocLogoutPatientDetailsEvent extends CentralBLocEvent {}
