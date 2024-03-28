class OrderMedicineCartResModel {
  String? id;
  List<PharmacyCartItems>? pharmacyCartItems;
  int? cartCount;
  double? totalCost;
  String? timeModified;
  String? timeCreated;
  String? patient;

  OrderMedicineCartResModel(
      {this.id,
      this.pharmacyCartItems,
      this.cartCount,
      this.totalCost,
      this.timeModified,
      this.timeCreated,
      this.patient});

  OrderMedicineCartResModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    if (json['pharmacy_cart_items'] != null) {
      pharmacyCartItems = <PharmacyCartItems>[];
      json['pharmacy_cart_items'].forEach((v) {
        pharmacyCartItems!.add(new PharmacyCartItems.fromJson(v));
      });
    }
    cartCount = json['cart_count'];
    totalCost = json['total_cost']?.toDouble();
    timeModified = json['time_modified'];
    timeCreated = json['time_created'];
    patient = json['patient'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    if (this.pharmacyCartItems != null) {
      data['pharmacy_cart_items'] =
          this.pharmacyCartItems!.map((v) => v.toJson()).toList();
    }
    data['cart_count'] = this.cartCount;
    data['total_cost'] = this.totalCost;
    data['time_modified'] = this.timeModified;
    data['time_created'] = this.timeCreated;
    data['patient'] = this.patient;
    return data;
  }
}

class PharmacyCartItems {
  String? id;
  String? productTitle;
  int? quantity;
  String? price;
  int? drugSize;
  bool? restricted;
  String? image;
  String? pharmacyItem;
  String? pharmacyItemId;

  PharmacyCartItems(
      {this.id,
      this.productTitle,
      this.quantity,
      this.price,
      this.drugSize,
      this.restricted,
      this.image,
      this.pharmacyItem,
      this.pharmacyItemId,});

  PharmacyCartItems.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    productTitle = json['product_title'];
    quantity = json['quantity'];
    price = json['price'];
    drugSize = json['drug_size'];
    restricted = json['restricted'];
    image = json['image'];
    pharmacyItem = json['pharmacy_item'];
    pharmacyItemId = json['pharmacy_item_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['product_title'] = this.productTitle;
    data['quantity'] = this.quantity;
    data['price'] = this.price;
    data['drug_size'] = this.drugSize;
    data['restricted'] = this.restricted;
    data['image'] = this.image;
    data['pharmacy_item'] = this.pharmacyItem;
    data['pharmacy_item_id'] = this.pharmacyItemId;
    return data;
  }
}
