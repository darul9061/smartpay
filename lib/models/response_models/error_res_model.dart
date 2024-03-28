class ErrorResModel {
  String? detail;
  String? code;
  List<Messages>? messages;

  ErrorResModel({this.detail, this.code, this.messages});

  ErrorResModel.fromJson(Map<String, dynamic> json) {
    detail = json['detail'];
    code = json['code'];
    if (json['messages'] != null) {
      messages = <Messages>[];
      json['messages'].forEach((v) {
        messages!.add(new Messages.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['detail'] = this.detail;
    data['code'] = this.code;
    if (this.messages != null) {
      data['messages'] = this.messages!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Messages {
  String? tokenClass;
  String? tokenType;
  String? message;

  Messages({this.tokenClass, this.tokenType, this.message});

  Messages.fromJson(Map<String, dynamic> json) {
    tokenClass = json['token_class'];
    tokenType = json['token_type'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['token_class'] = this.tokenClass;
    data['token_type'] = this.tokenType;
    data['message'] = this.message;
    return data;
  }
}
