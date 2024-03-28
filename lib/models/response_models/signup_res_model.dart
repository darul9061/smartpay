class SignUpResModel {
  String? id;
  String? timeCreated;
  String? timeModified;
  bool? isDeleted;
  String? userName;
  String? email;
  String? userToken;
  bool? emailValidationStatus;

  SignUpResModel(
      {this.id,
      this.timeCreated,
      this.timeModified,
      this.isDeleted,
      this.userName,
      this.email,
      this.userToken,
      this.emailValidationStatus});

  SignUpResModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    timeCreated = json['timeCreated'];
    timeModified = json['timeModified'];
    isDeleted = json['isDeleted'];
    userName = json['userName'];
    email = json['email'];
    userToken = json['userToken'];
    emailValidationStatus = json['emailValidationStatus'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['timeCreated'] = this.timeCreated;
    data['timeModified'] = this.timeModified;
    data['isDeleted'] = this.isDeleted;
    data['userName'] = this.userName;
    data['email'] = this.email;
    data['userToken'] = this.userToken;
    data['emailValidationStatus'] = this.emailValidationStatus;
    return data;
  }
}
