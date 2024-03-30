class UserDetailModel {
        
  String? email;
  String? fullName;
  String? username;
  String? country;
  String? id;
  int? userType;
  String? userToken;
  String? refreshToken;
  String? userEncryptedPin;

  UserDetailModel(
      {
      this.fullName,
      this.username,
      this.country,
      this.email,
      this.id,
      this.userType,
      this.userToken,
      this.refreshToken,
      this.userEncryptedPin});

  UserDetailModel.fromJson(Map<String, dynamic> json) {
    fullName = json['full_name'];
    username = json['username'];
    country = json['country'];
    email = json['email'];
    id = json['id'];
    userType = json['user_type'];
    userToken = json['user_token'];
    refreshToken = json['refresh_token'];
    userEncryptedPin = json['user_encrypted_pin'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['full_name'] = this.fullName;
    data['username'] = this.username;
    data['country'] = this.country;
    data['email'] = this.email;
    data['id'] = this.id;
    data['user_type'] = this.userType;
    data['user_token'] = this.userToken;
    data['user_token'] = this.userToken;
    data['user_encrypted_pin'] = this.userEncryptedPin;
    return data;
  }



  Map<String, dynamic> toEncryptedJson() {

    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['full_name'] = this.fullName;
    data['username'] = this.username;
    data['country'] = this.country;
    data['email'] = this.email;
    data['id'] = this.id;

    return data;

  }


}
