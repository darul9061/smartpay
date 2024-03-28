class UserDetailModel {
  String? firstName;
  String? lastName;
  String? phoneNumber;
  String? email;
  String? id;
  int? userType;
  String? userToken;
  String? refreshToken;
  String? patientId;
  String? agoraUserId;
  String? agoraUserToken;

  UserDetailModel(
      {this.firstName,
      this.lastName,
      this.phoneNumber,
      this.email,
      this.id,
      this.userType,
      this.userToken,
      this.refreshToken,
      this.patientId,
      this.agoraUserId,
      this.agoraUserToken});

  UserDetailModel.fromJson(Map<String, dynamic> json) {
    firstName = json['first_name'];
    lastName = json['last_name'];
    phoneNumber = json['phone_number'];
    email = json['email'];
    id = json['id'];
    userType = json['user_type'];
    userToken = json['user_token'];
    refreshToken = json['refresh_token'];
    patientId = json['user_type_id'];
    agoraUserId = json['agora_user_id'];
    agoraUserToken = json['agora_user_token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['first_name'] = this.firstName;
    data['last_name'] = this.lastName;
    data['phone_number'] = this.phoneNumber;
    data['email'] = this.email;
    data['id'] = this.id;
    data['user_type'] = this.userType;
    data['user_token'] = this.userToken;
    data['refresh_token'] = this.refreshToken;
    data['user_type_id'] = this.patientId;
    data['agora_user_id'] = this.agoraUserId;
    data['agora_user_token'] = this.agoraUserToken;
    return data;
  }
}
