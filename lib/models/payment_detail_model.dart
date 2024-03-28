
class PaymentDetailModel {

  String? id;
  String? txRef;
  int? amount;
  String? currency;
  int? chargedAmount;
  String? narration;
  String? status;
  String? paymentType;
  String? paymentMethod;
  String? createdAt;
  int? accountId;
  String? name;
  String? phoneNumber;
  String? email;

  PaymentDetailModel(
      {
      required this.id,
      this.txRef,
      this.amount,
      this.currency,
      this.chargedAmount,
      required this.narration,
      this.status,
      required this.paymentType,
      required this.paymentMethod,
      this.createdAt,
      this.accountId,
      required this.name, 
      this.phoneNumber, 
      required this.email });

  PaymentDetailModel.fromJson(Map<String, dynamic> json) {
    id = json['id']?.toString();
    txRef = json['tx_ref'];
    amount = json['amount'];
    currency = json['currency'];
    chargedAmount = json['charged_amount'];
    narration = json['narration'];
    status = json['status'];
    paymentType = json['payment_type'];
    paymentMethod = json['payment_method'];
    createdAt = json['created_at'];
    accountId = json['account_id'];
    name = json['name'];
    phoneNumber = json['phone_number'];
    email = json['email'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['tx_ref'] = this.txRef;
    data['amount'] = this.amount;
    data['currency'] = this.currency;
    data['charged_amount'] = this.chargedAmount;
    data['narration'] = this.narration;
    data['status'] = this.status;
    data['payment_type'] = this.paymentType;
    data['payment_method'] = this.paymentMethod;
    data['created_at'] = this.createdAt;
    data['account_id'] = this.accountId;
    data['name'] = this.name;
    data['phone_number'] = this.phoneNumber;
    data['email'] = this.email;
    return data;
  }

}