class LabTestsResModel {
  int? count;
  String? next;
  String? previous;
  List<Results>? results;

  LabTestsResModel({this.count, this.next, this.previous, this.results});

  LabTestsResModel.fromJson(Map<String, dynamic> json) {
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
  String? title;
  String? description;
  String? category;
  String? image;
  String? price;
  String? timeCreated;

  Results(
      {this.id,
      this.title,
      this.description,
      this.category,
      this.image,
      this.price,
      this.timeCreated});

  Results.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    description = json['description'];
    category = json['category'];
    image = json['image'];
    price = json['price'];
    timeCreated = json['time_created'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['description'] = this.description;
    data['category'] = this.category;
    data['image'] = this.image;
    data['price'] = this.price;
    data['time_created'] = this.timeCreated;
    return data;
  }
}
