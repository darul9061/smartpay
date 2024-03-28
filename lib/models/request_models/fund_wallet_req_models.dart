class FundWalletReqModel {
  String? transaction;
  String? amount;
  int? status;
  int? paymentType;
  String? paymentMethod;

  FundWalletReqModel(
      {this.transaction,
      this.amount,
      this.status,
      this.paymentType,
      this.paymentMethod});

  FundWalletReqModel.fromJson(Map<String, dynamic> json) {
    transaction = json['transaction'];
    amount = json['amount'];
    status = json['status'];
    paymentType = json['payment_type'];
    paymentMethod = json['payment_method'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['transaction'] = this.transaction;
    data['amount'] = this.amount;
    data['status'] = this.status;
    data['payment_type'] = this.paymentType;
    data['payment_method'] = this.paymentMethod;
    return data;
  }
}
