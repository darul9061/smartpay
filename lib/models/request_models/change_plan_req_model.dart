class ChangePlanReqModel {
  String? planId;
  String? paymentMethod;
  String? transactionId;
  String? transactionNarration;

  ChangePlanReqModel(
      {this.planId,
      this.paymentMethod,
      this.transactionId,
      this.transactionNarration});

  ChangePlanReqModel.fromJson(Map<String, dynamic> json) {
    planId = json['plan_id'];
    paymentMethod = json['payment_method'];
    transactionId = json['transaction_id'];
    transactionNarration = json['transaction_narration'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['plan_id'] = this.planId;
    data['payment_method'] = this.paymentMethod;
    data['transaction_id'] = this.transactionId;
    data['transaction_narration'] = this.transactionNarration;
    return data;
  }
}
