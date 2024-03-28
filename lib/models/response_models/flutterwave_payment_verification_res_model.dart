class FlutterWavePaymentVerificationResModel {
  String? status;
  String? message;
  Data? data;

  FlutterWavePaymentVerificationResModel(
      {this.status, this.message, this.data});

  FlutterWavePaymentVerificationResModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  int? id;
  String? txRef;
  String? flwRef;
  String? deviceFingerprint;
  double? amount;
  String? currency;
  double? chargedAmount;
  double? appFee;
  double? merchantFee;
  String? processorResponse;
  String? authModel;
  String? ip;
  String? narration;
  String? status;
  String? paymentType;
  String? createdAt;
  int? accountId;
  double? amountSettled;
  Card? card;
  FlutCustomer? customer;

  Data(
      {this.id,
      this.txRef,
      this.flwRef,
      this.deviceFingerprint,
      this.amount,
      this.currency,
      this.chargedAmount,
      this.appFee,
      this.merchantFee,
      this.processorResponse,
      this.authModel,
      this.ip,
      this.narration,
      this.status,
      this.paymentType,
      this.createdAt,
      this.accountId,
      this.amountSettled,
      this.card,
      this.customer});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    txRef = json['tx_ref'];
    flwRef = json['flw_ref'];
    deviceFingerprint = json['device_fingerprint'];
    amount = json['amount']?.toDouble();
    currency = json['currency'];
    chargedAmount = json['charged_amount']?.toDouble();
    appFee = json['app_fee']?.toDouble();
    merchantFee = json['merchant_fee']?.toDouble();
    processorResponse = json['processor_response'];
    authModel = json['auth_model'];
    ip = json['ip'];
    narration = json['narration'];
    status = json['status'];
    paymentType = json['payment_type'];
    createdAt = json['created_at'];
    accountId = json['account_id'];
    amountSettled = json['amount_settled']?.toDouble();
    card = json['card'] != null ? new Card.fromJson(json['card']) : null;
    customer = json['customer'] != null
        ? new FlutCustomer.fromJson(json['customer'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['tx_ref'] = this.txRef;
    data['flw_ref'] = this.flwRef;
    data['device_fingerprint'] = this.deviceFingerprint;
    data['amount'] = this.amount;
    data['currency'] = this.currency;
    data['charged_amount'] = this.chargedAmount;
    data['app_fee'] = this.appFee;
    data['merchant_fee'] = this.merchantFee;
    data['processor_response'] = this.processorResponse;
    data['auth_model'] = this.authModel;
    data['ip'] = this.ip;
    data['narration'] = this.narration;
    data['status'] = this.status;
    data['payment_type'] = this.paymentType;
    data['created_at'] = this.createdAt;
    data['account_id'] = this.accountId;
    data['amount_settled'] = this.amountSettled;
    if (this.card != null) {
      data['card'] = this.card!.toJson();
    }
    if (this.customer != null) {
      data['customer'] = this.customer!.toJson();
    }
    return data;
  }
}

class Card {
  String? first6digits;
  String? last4digits;
  String? issuer;
  String? country;
  String? type;
  String? token;
  String? expiry;

  Card(
      {this.first6digits,
      this.last4digits,
      this.issuer,
      this.country,
      this.type,
      this.token,
      this.expiry});

  Card.fromJson(Map<String, dynamic> json) {
    first6digits = json['first_6digits'];
    last4digits = json['last_4digits'];
    issuer = json['issuer'];
    country = json['country'];
    type = json['type'];
    token = json['token'];
    expiry = json['expiry'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['first_6digits'] = this.first6digits;
    data['last_4digits'] = this.last4digits;
    data['issuer'] = this.issuer;
    data['country'] = this.country;
    data['type'] = this.type;
    data['token'] = this.token;
    data['expiry'] = this.expiry;
    return data;
  }
}

class FlutCustomer {
  int? id;
  String? name;
  String? phoneNumber;
  String? email;
  String? createdAt;

  FlutCustomer({this.id, this.name, this.phoneNumber, this.email, this.createdAt});

  FlutCustomer.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    phoneNumber = json['phone_number'];
    email = json['email'];
    createdAt = json['created_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['phone_number'] = this.phoneNumber;
    data['email'] = this.email;
    data['created_at'] = this.createdAt;
    return data;
  }
}
