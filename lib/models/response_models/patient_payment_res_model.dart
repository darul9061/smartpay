class PatientPaymentResModel {
  String? id;
  String? transaction;
  String? amount;
  String? transactionDate;
  int? status;
  int? paymentType;
  String? paymentMethod;
  String? timeCreated;
  String? timeModified;
  String? patient;

  PatientPaymentResModel(
      {this.id,
      this.transaction,
      this.amount,
      this.transactionDate,
      this.status,
      this.paymentType,
      this.paymentMethod,
      this.timeCreated,
      this.timeModified,
      this.patient});

  PatientPaymentResModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    transaction = json['transaction'];
    amount = json['amount'];
    transactionDate = json['transaction_date'];
    status = json['status'];
    paymentType = json['payment_type'];
    paymentMethod = json['payment_method'];
    timeCreated = json['time_created'];
    timeModified = json['time_modified'];
    patient = json['patient'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['transaction'] = this.transaction;
    data['amount'] = this.amount;
    data['transaction_date'] = this.transactionDate;
    data['status'] = this.status;
    data['payment_type'] = this.paymentType;
    data['payment_method'] = this.paymentMethod;
    data['time_created'] = this.timeCreated;
    data['time_modified'] = this.timeModified;
    data['patient'] = this.patient;
    return data;
  }
}
