part of 'setup_profile_screen_bloc.dart';

abstract class SetupProfileScreenEvent{}


class SetupProfileScreenSelectProfileImage extends SetupProfileScreenEvent {}

class SetupProfileScreenOnTapEvents extends SetupProfileScreenEvent{

  String? phoneNumber;
  String? email;
  String? firstName;
  String? lastName;
  String? dateOfBirth;
  String? gender;
  String? bloodGroup;
  String? genotype;
  int? height;
  int? weight;
  String? address;
  String? profilePicture;

  NextOfKinReqModel nextOfKinReqModel;


  SetupProfileScreenOnTapEvents({
    
    this.address, 
    
    this.bloodGroup, 
    
    this.dateOfBirth, 
    
    this.email, 
    
    this.firstName, 
    
    this.gender, 
    
    this.genotype, 
    
    this.height, 
    
    this.lastName, 
    
    this.phoneNumber, 
    
    this.profilePicture, 
    
    this.weight,

    required this.nextOfKinReqModel
    
  });

}