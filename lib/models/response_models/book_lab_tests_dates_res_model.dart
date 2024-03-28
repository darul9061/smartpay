class BookLabTestDatesResModel {
  String? id;
  List<TestAvailabilityTimes>? testAvailabilityTimes;
  String? date;

  BookLabTestDatesResModel({this.id, this.testAvailabilityTimes, this.date});

  BookLabTestDatesResModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    if (json['test_availability_times'] != null) {
      testAvailabilityTimes = <TestAvailabilityTimes>[];
      json['test_availability_times'].forEach((v) {
        testAvailabilityTimes!.add(new TestAvailabilityTimes.fromJson(v));
      });
    }
    date = json['date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    if (this.testAvailabilityTimes != null) {
      data['test_availability_times'] =
          this.testAvailabilityTimes!.map((v) => v.toJson()).toList();
    }
    data['date'] = this.date;
    return data;
  }
}

class TestAvailabilityTimes {
  String? id;
  String? availability;
  String? startTime;
  String? endTime;
  int? slots;

  TestAvailabilityTimes(
      {this.id, this.availability, this.startTime, this.endTime, this.slots});

  TestAvailabilityTimes.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    availability = json['availability'];
    startTime = json['start_time'];
    endTime = json['end_time'];
    slots = json['slots'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['availability'] = this.availability;
    data['start_time'] = this.startTime;
    data['end_time'] = this.endTime;
    data['slots'] = this.slots;
    return data;
  }
}
