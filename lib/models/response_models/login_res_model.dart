class LoginResModel {
  String? email;
  String? password;
  String? accessToken;
  String? refreshToken;
  String? id;
  String? firstName;
  String? lastName;
  String? phoneNumber;
  int? userType;
  String? userTypeId;
  String? agoraUserId;

  LoginResModel(
      {this.email,
      this.password,
      this.accessToken,
      this.refreshToken,
      this.id,
      this.firstName,
      this.lastName,
      this.phoneNumber,
      this.userType,
      this.userTypeId,
      this.agoraUserId});

  LoginResModel.fromJson(Map<String, dynamic> json) {
    email = json['email'];
    password = json['password'];
    accessToken = json['access_token'];
    refreshToken = json['refresh_token'];
    id = json['id'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    phoneNumber = json['phone_number'];
    userType = json['user_type'];
    userTypeId = json['user_type_id'];
    agoraUserId = json['agora_user_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['email'] = this.email;
    data['password'] = this.password;
    data['access_token'] = this.accessToken;
    data['refresh_token'] = this.refreshToken;
    data['id'] = this.id;
    data['first_name'] = this.firstName;
    data['last_name'] = this.lastName;
    data['phone_number'] = this.phoneNumber;
    data['user_type'] = this.userType;
    data['user_type_id'] = this.userTypeId;
    data['agora_user_id'] = this.agoraUserId;
    return data;
  }
}
