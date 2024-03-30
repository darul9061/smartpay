class SetupProfileResModel {
  bool? status;
  String? message;
  Data? data;

  SetupProfileResModel({this.status, this.message, this.data});

  SetupProfileResModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  User? user;
  String? token;

  Data({this.user, this.token});

  Data.fromJson(Map<String, dynamic> json) {
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    data['token'] = this.token;
    return data;
  }
}

class User {
  String? fullName;
  String? username;
  String? email;
  String? country;
  String? id;

  User({this.fullName, this.username, this.email, this.country, this.id});

  User.fromJson(Map<String, dynamic> json) {
    fullName = json['full_name'];
    username = json['username'];
    email = json['email'];
    country = json['country'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['full_name'] = this.fullName;
    data['username'] = this.username;
    data['email'] = this.email;
    data['country'] = this.country;
    data['id'] = this.id;
    return data;
  }
}
