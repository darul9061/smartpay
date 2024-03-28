class BookLabTestCartResModel {
  String? id;
  List<TestsCartItems>? testsCartItems;
  int? cartCount;
  double? totalCost;
  String? timeModified;
  String? timeCreated;
  String? patient;

  BookLabTestCartResModel(
      {this.id,
      this.testsCartItems,
      this.cartCount,
      this.totalCost,
      this.timeModified,
      this.timeCreated,
      this.patient});

  BookLabTestCartResModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    if (json['tests_cart_items'] != null) {
      testsCartItems = <TestsCartItems>[];
      json['tests_cart_items'].forEach((v) {
        testsCartItems!.add(new TestsCartItems.fromJson(v));
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
    if (this.testsCartItems != null) {
      data['tests_cart_items'] =
          this.testsCartItems!.map((v) => v.toJson()).toList();
    }
    data['cart_count'] = this.cartCount;
    data['total_cost'] = this.totalCost;
    data['time_modified'] = this.timeModified;
    data['time_created'] = this.timeCreated;
    data['patient'] = this.patient;
    return data;
  }
}

class TestsCartItems {
  String? id;
  String? productTitle;
  String? price;
  String? image;
  String? testItemId;
  String? testItem;

  TestsCartItems({this.id, this.productTitle, this.price, this.image, this.testItemId, this.testItem});

  TestsCartItems.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    productTitle = json['product_title'];
    price = json['price'];
    image = json['image'];
    testItemId = json['test_item_id'];
    testItem = json['test_item'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['product_title'] = this.productTitle;
    data['price'] = this.price;
    data['image'] = this.image;
    data['test_item_id'] = this.testItemId;
    data['test_item'] = this.testItem;
    return data;
  }
}
