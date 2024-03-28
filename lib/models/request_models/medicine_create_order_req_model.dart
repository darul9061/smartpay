class MedicineCreateOrderReqModel {
  String? cartId;
  String? location;
  String? paymentMethod;
  String? transactionId;
  String? transactionNarration;

  MedicineCreateOrderReqModel({this.cartId, this.location, this.paymentMethod, required this.transactionId, required this.transactionNarration});

  MedicineCreateOrderReqModel.fromJson(Map<String, dynamic> json) {
    cartId = json['cart_id'];
    location = json['location'];
    paymentMethod = json['payment_method'];
    transactionId = json['transaction_id'];
    transactionNarration = json['transaction_narration'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['cart_id'] = this.cartId;
    data['location'] = this.location;
    data['payment_method'] = this.paymentMethod;
    data['transaction_id'] = this.transactionId;
    data['transaction_narration'] = this.transactionNarration;
    return data;
  }
}
