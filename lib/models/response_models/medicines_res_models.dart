class MedicinesResModel {
  int? count;
  String? next;
  String? previous;
  List<Results>? results;

  MedicinesResModel({this.count, this.next, this.previous, this.results});

  MedicinesResModel.fromJson(Map<String, dynamic> json) {
    count = json['count'];
    next = json['next'];
    previous = json['previous'];
    if (json['results'] != null) {
      results = <Results>[];
      json['results'].forEach((v) {
        results!.add(new Results.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['count'] = this.count;
    data['next'] = this.next;
    data['previous'] = this.previous;
    if (this.results != null) {
      data['results'] = this.results!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Results {
  String? id;
  String? availability;
  List<DrugSizes>? drugSizes;
  String? title;
  String? description;
  String? image;
  double? price;
  String? category;
  String? benefits;
  int? stockCount;
  bool? restricted;

  Results(
      {this.id,
      this.availability,
      this.drugSizes,
      this.title,
      this.description,
      this.image,
      this.price,
      this.category,
      this.benefits,
      this.stockCount,
      this.restricted});

  Results.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    availability = json['availability'];
    if (json['drug_sizes'] != null) {
      drugSizes = <DrugSizes>[];
      json['drug_sizes'].forEach((v) {
        drugSizes!.add(new DrugSizes.fromJson(v));
      });
    }
    title = json['title'];
    description = json['description'];
    image = json['image'];
    price = json['price']?.toDouble();
    category = json['category'];
    benefits = json['benefits'];
    stockCount = json['stock_count'];
    restricted = json['restricted'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['availability'] = this.availability;
    if (this.drugSizes != null) {
      data['drug_sizes'] = this.drugSizes!.map((v) => v.toJson()).toList();
    }
    data['title'] = this.title;
    data['description'] = this.description;
    data['image'] = this.image;
    data['price'] = this.price;
    data['category'] = this.category;
    data['benefits'] = this.benefits;
    data['stock_count'] = this.stockCount;
    data['restricted'] = this.restricted;
    return data;
  }
}

class DrugSizes {
  int? drugSize;

  DrugSizes({this.drugSize});

  DrugSizes.fromJson(Map<String, dynamic> json) {
    drugSize = json['drug_size'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['drug_size'] = this.drugSize;
    return data;
  }
}
