import 'package:dio/dio.dart';

class StorePatientDetailReqModel {
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
  MultipartFile? profilePicture;

  StorePatientDetailReqModel(
      {this.phoneNumber,
      this.email,
      this.firstName,
      this.lastName,
      this.dateOfBirth,
      this.gender,
      this.bloodGroup,
      this.genotype,
      this.height,
      this.weight,
      this.address,
      this.profilePicture});

  StorePatientDetailReqModel.fromJson(Map<String, dynamic> json) {
    phoneNumber = json['phone_number'];
    email = json['email'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    dateOfBirth = json['date_of_birth'];
    gender = json['gender'];
    bloodGroup = json['blood_group'];
    genotype = json['genotype'];
    height = json['height'];
    weight = json['weight'];
    address = json['address'];
    profilePicture = json['profile_picture'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['phone_number'] = this.phoneNumber;
    data['email'] = this.email;
    data['first_name'] = this.firstName;
    data['last_name'] = this.lastName;
    data['date_of_birth'] = this.dateOfBirth;
    data['gender'] = this.gender;
    data['blood_group'] = this.bloodGroup;
    data['genotype'] = this.genotype;
    data['height'] = this.height;
    data['weight'] = this.weight;
    data['address'] = this.address;
    data['profile_picture'] = this.profilePicture;
    return data;
  }
}
