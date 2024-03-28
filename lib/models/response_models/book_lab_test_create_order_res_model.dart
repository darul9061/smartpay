class MedicineCreateOrderResModel {
  String? id;
  String? location;
  String? paymentMethod;
  String? status;
  List<OrderItems>? orderItems;

  MedicineCreateOrderResModel(
      {this.id,
      this.location,
      this.paymentMethod,
      this.status,
      this.orderItems});

  MedicineCreateOrderResModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    location = json['location'];
    paymentMethod = json['payment_method'];
    status = json['status'];
    if (json['order_items'] != null) {
      orderItems = <OrderItems>[];
      json['order_items'].forEach((v) {
        orderItems!.add(new OrderItems.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['location'] = this.location;
    data['payment_method'] = this.paymentMethod;
    data['status'] = this.status;
    if (this.orderItems != null) {
      data['order_items'] = this.orderItems!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class OrderItems {
  String? id;
  String? productName;
  int? quantity;
  String? price;
  String? timeModified;
  String? timeCreated;

  OrderItems(
      {this.id,
      this.productName,
      this.quantity,
      this.price,
      this.timeModified,
      this.timeCreated});

  OrderItems.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    productName = json['product_name'];
    quantity = json['quantity'];
    price = json['price']?.toString();
    timeModified = json['time_modified'];
    timeCreated = json['time_created'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['product_name'] = this.productName;
    data['quantity'] = this.quantity;
    data['price'] = this.price;
    data['time_modified'] = this.timeModified;
    data['time_created'] = this.timeCreated;
    return data;
  }
}
