class CreateAppointmentReqModel {
  // String? practitionerId;
  String? testCartId;
  int? appointmentType;
  String? labName;
  String? location;
  int? consultationType;
  String? consultationFee;
  String? consultationDate;
  String? consultationTime;
  // String? symptoms;
  String? paymentMethod;
  String? transactionId;
  String? transactionNarration;

  CreateAppointmentReqModel(
      {
      // this.practitionerId,
      this.testCartId,
      this.appointmentType,
      this.labName,
      this.location,
      this.consultationType,
      this.consultationFee,
      this.consultationDate,
      this.consultationTime,
      // this.symptoms,
      this.paymentMethod,
      required this.transactionId,
      required this.transactionNarration});

  CreateAppointmentReqModel.fromJson(Map<String, dynamic> json) {
    // practitionerId = json['practitioner_id'];
    testCartId = json['test_cart_id'];
    appointmentType = json['appointment_type'];
    labName = json['lab_name'];
    location = json['location'];
    consultationType = json['consultation_type'];
    consultationFee = json['consultation_fee'];
    consultationDate = json['consultation_date'];
    consultationTime = json['consultation_time'];
    // symptoms = json['symptoms'];
    paymentMethod = json['payment_method'];
    transactionId = json['transaction_id'];
    transactionNarration = json['transaction_narration'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    // data['practitioner_id'] = this.practitionerId;
    data['test_cart_id'] = this.testCartId;
    data['appointment_type'] = this.appointmentType;
    data['lab_name'] = this.labName;
    data['location'] = this.location;
    data['consultation_type'] = this.consultationType;
    data['consultation_fee'] = this.consultationFee;
    data['consultation_date'] = this.consultationDate;
    data['consultation_time'] = this.consultationTime;
    // data['symptoms'] = this.symptoms;
    data['payment_method'] = this.paymentMethod;
    data['transaction_id'] = this.transactionId;
    data['transaction_narration'] = this.transactionNarration;
    return data;
  }
}
