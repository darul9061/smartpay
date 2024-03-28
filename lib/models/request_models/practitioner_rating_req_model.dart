class PractitionerRatingReqModel {
  String? practitionerId;
  String? review;
  int? rating;

  PractitionerRatingReqModel({this.practitionerId, this.review, this.rating});

  PractitionerRatingReqModel.fromJson(Map<String, dynamic> json) {
    practitionerId = json['practitioner_id'];
    review = json['review'];
    rating = json['rating'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['practitioner_id'] = this.practitionerId;
    data['review'] = this.review;
    data['rating'] = this.rating;
    return data;
  }
}
