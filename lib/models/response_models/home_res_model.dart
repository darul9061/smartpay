class HomeResModel {
  bool? status;
  String? message;
  Data? data;

  HomeResModel({this.status, this.message, this.data});

  HomeResModel.fromJson(Map<String, dynamic> json) {
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
  String? secret;

  Data({this.secret});

  Data.fromJson(Map<String, dynamic> json) {
    secret = json['secret'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['secret'] = this.secret;
    return data;
  }
}
