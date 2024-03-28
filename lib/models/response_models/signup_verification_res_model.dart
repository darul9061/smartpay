class SignUpVerificationResModel {
  String? id;
  String? phoneNumber;
  String? accessToken;
  String? refreshToken;
  String? userTypeId;
  String? agoraUserId;
  String? email;
  int? token;
  String? timeCreated;
  String? timeModified;
  bool? isDeleted;
  int? userType;
  String? firstName;
  String? lastName;

  SignUpVerificationResModel(
      {this.id,
      this.phoneNumber,
      this.accessToken,
      this.refreshToken,
      this.userTypeId,
      this.agoraUserId,
      this.email,
      this.token,
      this.timeCreated,
      this.timeModified,
      this.isDeleted,
      this.userType,
      this.firstName,
      this.lastName});

  SignUpVerificationResModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    phoneNumber = json['phone_number'];
    accessToken = json['access_token'];
    refreshToken = json['refresh_token'];
    userTypeId = json['user_type_id'];
    agoraUserId = json['agora_user_id'];
    email = json['email'];
    token = json['token'];
    timeCreated = json['time_created'];
    timeModified = json['time_modified'];
    isDeleted = json['is_deleted'];
    userType = json['user_type'];
    firstName = json['first_name'];
    lastName = json['last_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['phone_number'] = this.phoneNumber;
    data['access_token'] = this.accessToken;
    data['refresh_token'] = this.refreshToken;
    data['user_type_id'] = this.userTypeId;
    data['agora_user_id'] = this.agoraUserId;
    data['email'] = this.email;
    data['token'] = this.token;
    data['time_created'] = this.timeCreated;
    data['time_modified'] = this.timeModified;
    data['is_deleted'] = this.isDeleted;
    data['user_type'] = this.userType;
    data['first_name'] = this.firstName;
    data['last_name'] = this.lastName;
    return data;
  }
}
