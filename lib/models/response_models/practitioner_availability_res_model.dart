class PractitionerAvailabilityResModel {
  String? id;
  String? practitioner;
  String? day;
  String? startTime;
  String? endTime;

  PractitionerAvailabilityResModel(
      {this.id, this.practitioner, this.day, this.startTime, this.endTime});

  PractitionerAvailabilityResModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    practitioner = json['practitioner'];
    day = json['day'];
    startTime = json['start_time'];
    endTime = json['end_time'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['practitioner'] = this.practitioner;
    data['day'] = this.day;
    data['start_time'] = this.startTime;
    data['end_time'] = this.endTime;
    return data;
  }
}
