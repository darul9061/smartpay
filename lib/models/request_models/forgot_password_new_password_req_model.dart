class ForgotPasswordNewPasswordReqModel {
  String? email;
  int? token;
  String? newPassword;
  String? reNewPassword;

  ForgotPasswordNewPasswordReqModel(
      {this.email, this.token, this.newPassword, this.reNewPassword});

  ForgotPasswordNewPasswordReqModel.fromJson(Map<String, dynamic> json) {
    email = json['email'];
    token = json['token'];
    newPassword = json['new_password'];
    reNewPassword = json['re_new_password'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['email'] = this.email;
    data['token'] = this.token;
    data['new_password'] = this.newPassword;
    data['re_new_password'] = this.reNewPassword;
    return data;
  }
}
