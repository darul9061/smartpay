class SelfTrackerResModel {
  String? id;
  List<TrackerData>? trackerData;
  String? unit;
  String? name;
  String? timeModified;
  String? timeCreated;

  SelfTrackerResModel(
      {this.id,
      this.trackerData,
      this.unit,
      this.name,
      this.timeModified,
      this.timeCreated});

  SelfTrackerResModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    if (json['tracker_data'] != null) {
      trackerData = <TrackerData>[];
      json['tracker_data'].forEach((v) {
        trackerData!.add(new TrackerData.fromJson(v));
      });
    }
    unit = json['unit'];
    name = json['name'];
    timeModified = json['time_modified'];
    timeCreated = json['time_created'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    if (this.trackerData != null) {
      data['tracker_data'] = this.trackerData!.map((v) => v.toJson()).toList();
    }
    data['unit'] = this.unit;
    data['name'] = this.name;
    data['time_modified'] = this.timeModified;
    data['time_created'] = this.timeCreated;
    return data;
  }
}

class TrackerData {
  String? id;
  String? value;
  String? timeModified;
  String? timeCreated;

  TrackerData({this.id, this.value, this.timeModified, this.timeCreated});

  TrackerData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    value = json['value'];
    timeModified = json['time_modified'];
    timeCreated = json['time_created'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['value'] = this.value;
    data['time_modified'] = this.timeModified;
    data['time_created'] = this.timeCreated;
    return data;
  }
}
