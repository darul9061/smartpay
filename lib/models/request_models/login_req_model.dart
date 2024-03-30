class LoginReqModel {
  String? email;
  String? password;
  String deviceName = "mobile";

  LoginReqModel({this.email, this.password});

  LoginReqModel.fromJson(Map<String, dynamic> json) {
    email = json['email'];
    password = json['password'];
    deviceName = json['device_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['email'] = this.email;
    data['password'] = this.password;
    data['device_name'] = deviceName;
    return data;
  }
}
