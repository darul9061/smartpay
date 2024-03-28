class NextOfKinResModel {
  String? id;
  String? fullName;
  String? phoneNumber;

  NextOfKinResModel({this.id, this.fullName, this.phoneNumber});

  NextOfKinResModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    fullName = json['full_name'];
    phoneNumber = json['phone_number'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['full_name'] = this.fullName;
    data['phone_number'] = this.phoneNumber;
    return data;
  }
}
