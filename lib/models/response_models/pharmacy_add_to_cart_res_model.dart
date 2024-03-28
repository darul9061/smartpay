class PharmacyAddToCartResModel {
  List<PharmacyCartItems>? pharmacyCartItems;

  PharmacyAddToCartResModel({this.pharmacyCartItems});

  PharmacyAddToCartResModel.fromJson(Map<String, dynamic> json) {
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
  String? image;
  String? pharmacyItem;
  String? pharmacyItemId;

  PharmacyCartItems(
      {this.productTitle,
      this.quantity,
      this.price,
      this.drugSize,
      this.restricted,
      this.image,
      this.pharmacyItem,
      this.pharmacyItemId});

  PharmacyCartItems.fromJson(Map<String, dynamic> json) {
    productTitle = json['product_title'];
    quantity = json['quantity'];
    price = json['price']?.toString();
    drugSize = json['drug_size'];
    restricted = json['restricted'];
    image = json['image'];
    pharmacyItem = json['pharmacy_item'];
    pharmacyItemId = json['pharmacy_item_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
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
