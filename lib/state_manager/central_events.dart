part of 'central_bloc.dart';

abstract class CentralBLocEvent {}

class CentralBLocGetPatientDetailsEvent extends CentralBLocEvent {

  final bool preloader;

  final bool keepPreloaderLoading;

  CentralBLocGetPatientDetailsEvent({this.preloader = true, this.keepPreloaderLoading = false});

}

class CentralBLocLogoutPatientDetailsEvent extends CentralBLocEvent {}