class SignUpReqModel {
  String? firstName;
  String? lastName;
  String? phoneNumber;
  String? email;
  String? password;
  String? rePassword;
  int? userType;

  SignUpReqModel(
      {this.firstName,
      this.lastName,
      this.phoneNumber,
      this.email,
      this.password,
      this.rePassword,
      this.userType});

  SignUpReqModel.fromJson(Map<String, dynamic> json) {
    firstName = json['first_name'];
    lastName = json['last_name'];
    phoneNumber = json['phone_number'];
    email = json['email'];
    password = json['password'];
    rePassword = json['re_password'];
    userType = json['user_type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['first_name'] = this.firstName;
    data['last_name'] = this.lastName;
    data['phone_number'] = this.phoneNumber;
    data['email'] = this.email;
    data['password'] = this.password;
    data['re_password'] = this.rePassword;
    data['user_type'] = this.userType;
    return data;
  }
}