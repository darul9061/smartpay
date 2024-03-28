class SelfTrackerReqModel {
  List<TrackerData>? trackerData;
  String? unit;
  String? name;

  SelfTrackerReqModel({this.trackerData, this.unit, this.name});

  SelfTrackerReqModel.fromJson(Map<String, dynamic> json) {
    if (json['tracker_data'] != null) {
      trackerData = <TrackerData>[];
      json['tracker_data'].forEach((v) {
        trackerData!.add(new TrackerData.fromJson(v));
      });
    }
    unit = json['unit'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.trackerData != null) {
      data['tracker_data'] = this.trackerData!.map((v) => v.toJson()).toList();
    }
    data['unit'] = this.unit;
    data['name'] = this.name;
    return data;
  }
}

class TrackerData {
  String? value;

  TrackerData({this.value});

  TrackerData.fromJson(Map<String, dynamic> json) {
    value = json['value'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['value'] = this.value;
    return data;
  }
}
