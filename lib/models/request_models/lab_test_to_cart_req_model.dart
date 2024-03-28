class LabTestToCartReqModel {
  List<TestsCartItems>? testsCartItems;

  LabTestToCartReqModel({this.testsCartItems});

  LabTestToCartReqModel.fromJson(Map<String, dynamic> json) {
    if (json['tests_cart_items'] != null) {
      testsCartItems = <TestsCartItems>[];
      json['tests_cart_items'].forEach((v) {
        testsCartItems!.add(new TestsCartItems.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.testsCartItems != null) {
      data['tests_cart_items'] =
          this.testsCartItems!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class TestsCartItems {
  String? productTitle;
  String? price;
  String? testItemId;
  //adviced by backend to remove image property to prevent 500 server error
  // String? image;

  TestsCartItems({required this.testItemId, this.productTitle, this.price}); //, this.image});

  TestsCartItems.fromJson(Map<String, dynamic> json) {
    productTitle = json['product_title'];
    price = json['price'];
    testItemId = json['test_item_id'];
    // image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['product_title'] = this.productTitle;
    data['price'] = this.price;
    data['test_item_id'] = this.testItemId;
    // data['image'] = this.image;
    return data;
  }
}
