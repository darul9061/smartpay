import 'package:equatable/equatable.dart';

class MakeAppointmentReqModel extends Equatable {
  String? practitionerId;
  int? consultationType;
  String? consultationFee;
  String? consultationDate;
  String? consultationTime;
  String? symptoms;
  int? appointmentType;
  String? status;
  String? paymentMethod;
  String? transactionId;
  String? transactionNarration;

  MakeAppointmentReqModel(
      {this.practitionerId = "",
      this.consultationType,
      this.consultationFee,
      this.consultationDate,
      this.consultationTime,
      this.appointmentType,
      this.symptoms,
      this.status,
      this.paymentMethod,
      required this.transactionId,
      required this.transactionNarration});

  MakeAppointmentReqModel.fromJson(Map<String, dynamic> json) {
    practitionerId = json['practitioner_id'];
    consultationType = json['consultation_type'];
    consultationFee = json['consultation_fee'];
    consultationDate = json['consultation_date'];
    consultationTime = json['consultation_time'];
    appointmentType = json['appointment_type'];
    symptoms = json['symptoms'];
    status = json['status'];
    paymentMethod = json['payment_method'];
    transactionId = json['transaction_id'];
    transactionNarration = json['transaction_narration'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['practitioner_id'] = this.practitionerId;
    data['consultation_type'] = this.consultationType;
    data['consultation_fee'] = this.consultationFee;
    data['consultation_date'] = this.consultationDate;
    data['consultation_time'] = this.consultationTime;
    data['appointment_type'] = this.appointmentType;
    data['symptoms'] = this.symptoms;
    data['status'] = this.status;
    data['payment_method'] = this.paymentMethod;
    data['transaction_id'] = this.transactionId;
    data['transaction_narration'] = this.transactionNarration;
    return data;
  }

  @override
  List<Object> get props => [practitionerId!];

  @override
  bool? get stringify => true;
}
