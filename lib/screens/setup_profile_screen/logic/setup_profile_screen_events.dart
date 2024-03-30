part of 'setup_profile_screen_bloc.dart';

abstract class SetupProfileScreenEvent{}


class SetupProfileScreenSavePinEvent extends SetupProfileScreenEvent {

  final String pin;
  final UserDetailModel userDetail;

  SetupProfileScreenSavePinEvent({required this.pin, required this.userDetail});

}

class SetupProfileScreenCheckPinEvent extends SetupProfileScreenEvent {

  final String pin;
  final UserDetailModel userDetail;

  SetupProfileScreenCheckPinEvent({required this.pin, required this.userDetail});

}

class SetupProfileScreenOnTapEvents extends SetupProfileScreenEvent{

  final String fullName;
  final String username;
  final String email;
  final String country;
  final String password;
  final String deviceName = "mobile";

  SetupProfileScreenOnTapEvents(
    
      {
        
      required this.fullName,
      required this.username,
      required this.email,
      required this.country,
      required this.password
    }
    
  );

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['full_name'] = this.fullName;
    data['username'] = this.username;
    data['email'] = this.email;
    data['country'] = this.country;
    data['password'] = this.password;
    data['device_name'] = this.deviceName;
    return data;
  }

  

}