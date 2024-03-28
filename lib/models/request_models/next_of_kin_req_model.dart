class NextOfKinReqModel {
  String? fullName;
  String? phoneNumber;

  NextOfKinReqModel({this.fullName, this.phoneNumber});

  NextOfKinReqModel.fromJson(Map<String, dynamic> json) {
    fullName = json['full_name'];
    phoneNumber = json['phone_number'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['full_name'] = this.fullName;
    data['phone_number'] = this.phoneNumber;
    return data;
  }
}
