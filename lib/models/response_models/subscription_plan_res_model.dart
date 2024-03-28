class SubscriptionPlanResModel {
  String? id;
  List<PlanFeatures>? planFeatures;
  String? plan;
  String? description;
  String? price;
  String? timeModified;
  String? timeCreated;

  SubscriptionPlanResModel(
      {this.id,
      this.planFeatures,
      this.plan,
      this.description,
      this.price,
      this.timeModified,
      this.timeCreated});

  SubscriptionPlanResModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    if (json['plan_features'] != null) {
      planFeatures = <PlanFeatures>[];
      json['plan_features'].forEach((v) {
        planFeatures!.add(new PlanFeatures.fromJson(v));
      });
    }
    plan = json['plan'];
    description = json['description'];
    price = json['price'];
    timeModified = json['time_modified'];
    timeCreated = json['time_created'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    if (this.planFeatures != null) {
      data['plan_features'] =
          this.planFeatures!.map((v) => v.toJson()).toList();
    }
    data['plan'] = this.plan;
    data['description'] = this.description;
    data['price'] = this.price;
    data['time_modified'] = this.timeModified;
    data['time_created'] = this.timeCreated;
    return data;
  }
}

class PlanFeatures {
  String? feature;

  PlanFeatures({this.feature});

  PlanFeatures.fromJson(Map<String, dynamic> json) {
    feature = json['feature'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['feature'] = this.feature;
    return data;
  }
}
