class ErrorResModel {
  bool? status;
  String? message;
  Map? errors;

  ErrorResModel({this.status, this.message});

  ErrorResModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    errors = json['errors'] is Map ? json["errors"] : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = this.status;
    data['message'] = this.message;
    data["errors"] = this.errors;
    return data;
  }
}
