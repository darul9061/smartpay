class PatientWalletResModel {
  String? id;
  String? patient;
  String? availableBalance;
  String? timeCreated;
  String? timeModified;

  PatientWalletResModel(
      {this.id,
      this.patient,
      this.availableBalance,
      this.timeCreated,
      this.timeModified});

  PatientWalletResModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    patient = json['patient'];
    availableBalance = json['available_balance'];
    timeCreated = json['time_created'];
    timeModified = json['time_modified'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['patient'] = this.patient;
    data['available_balance'] = this.availableBalance;
    data['time_created'] = this.timeCreated;
    data['time_modified'] = this.timeModified;
    return data;
  }
}
