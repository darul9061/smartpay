class PatientAppointmentReqModel {
  String? practitionerId;
  String? consultationType;
  String? consultationFee;
  String? consultationDate;
  String? consultationTime;
  String? symptoms;

  PatientAppointmentReqModel(
      {this.practitionerId,
      this.consultationType,
      this.consultationFee,
      this.consultationDate,
      this.consultationTime,
      this.symptoms});

  PatientAppointmentReqModel.fromJson(Map<String, dynamic> json) {
    practitionerId = json['practitioner_id'];
    consultationType = json['consultation_type'];
    consultationFee = json['consultation_fee'];
    consultationDate = json['consultation_date'];
    consultationTime = json['consultation_time'];
    symptoms = json['symptoms'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['practitioner_id'] = this.practitionerId;
    data['consultation_type'] = this.consultationType;
    data['consultation_fee'] = this.consultationFee;
    data['consultation_date'] = this.consultationDate;
    data['consultation_time'] = this.consultationTime;
    data['symptoms'] = this.symptoms;
    return data;
  }
}
