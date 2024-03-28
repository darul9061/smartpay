class PharmacyAddToCartReqModel {
  List<PharmacyCartItems>? pharmacyCartItems;

  PharmacyAddToCartReqModel({this.pharmacyCartItems});

  PharmacyAddToCartReqModel.fromJson(Map<String, dynamic> json) {
    if (json['pharmacy_cart_items'] != null) {
      pharmacyCartItems = <PharmacyCartItems>[];
      json['pharmacy_cart_items'].forEach((v) {
        pharmacyCartItems!.add(new PharmacyCartItems.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.pharmacyCartItems != null) {
      data['pharmacy_cart_items'] =
          this.pharmacyCartItems!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class PharmacyCartItems {
  String? productTitle;
  int? quantity;
  String? price;
  int? drugSize;
  bool? restricted;
  //adviced by backend to remove image property to prevent 500 server error
  // String? image;
  String? pharmacyItemId;

  PharmacyCartItems(
      {
    this.productTitle,
      this.quantity,
      this.price,
      this.drugSize,
      this.restricted = false,
      // this.image,
      required this.pharmacyItemId
      });

  PharmacyCartItems.fromJson(Map<String, dynamic> json) {
    productTitle = json['product_title'];
    quantity = json['quantity'];
    price = json['price'];
    drugSize = json['drug_size'];
    restricted = json['restricted'];
    // image = json['image'];
    pharmacyItemId = json['pharmacy_item_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['product_title'] = this.productTitle;
    data['quantity'] = this.quantity;
    data['price'] = this.price;
    data['drug_size'] = this.drugSize;
    data['restricted'] = this.restricted;
    // data['image'] = this.image;
    data['pharmacy_item_id'] = this.pharmacyItemId;
    return data;
  }
}
