class SetupPinScreenReqModel {

  final String email;

  final int token;

  SetupPinScreenReqModel({required this.email, required this.token}); 

  // SetupPinScreenReqModel.fromJson(Map<String, dynamic> json) {
  //   email = json['email'];
  //   token = json['token'];
  // }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['email'] = this.email;
    data['token'] = this.token;
    return data;
  }
  
}