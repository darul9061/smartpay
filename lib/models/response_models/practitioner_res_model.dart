class PractitionerResModel {
  int? count;
  String? next;
  String? previous;
  List<Results>? results;

  PractitionerResModel({this.count, this.next, this.previous, this.results});

  PractitionerResModel.fromJson(Map<String, dynamic> json) {
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
  String? firstName;
  String? lastName;
  List<AppointmentsAvailability>? appointmentsAvailability;
  List<AppointmentsConsultation>? appointmentsConsultation;
  double? averageRating;
  int? patientCount;
  String? practiceName;
  String? dateOfBirth;
  String? gender;
  String? bio;
  String? specialty;
  int? experienceLevel;
  String? hospitalAffiliations;
  String? licenseNumber;
  String? location;
  String? licenseDocument;
  String? profilePicture;
  bool? completionStatus;
  String? timeModified;
  String? timeCreated;

  Results(
      {this.id,
      this.firstName,
      this.lastName,
      this.appointmentsAvailability,
      this.appointmentsConsultation,
      this.averageRating,
      this.patientCount,
      this.practiceName,
      this.dateOfBirth,
      this.gender,
      this.bio,
      this.specialty,
      this.experienceLevel,
      this.hospitalAffiliations,
      this.licenseNumber,
      this.location,
      this.licenseDocument,
      this.profilePicture,
      this.completionStatus,
      this.timeModified,
      this.timeCreated});

  Results.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    if (json['appointments_availability'] != null) {
      appointmentsAvailability = <AppointmentsAvailability>[];
      json['appointments_availability'].forEach((v) {
        appointmentsAvailability!.add(new AppointmentsAvailability.fromJson(v));
      });
    }
    if (json['appointments_consultation'] != null) {
      appointmentsConsultation = <AppointmentsConsultation>[];
      json['appointments_consultation'].forEach((v) {
        appointmentsConsultation!.add(new AppointmentsConsultation.fromJson(v));
      });
    }
    averageRating = json['average_rating'];
    patientCount = json['patient_count'];
    practiceName = json['practice_name'];
    dateOfBirth = json['date_of_birth'];
    gender = json['gender'];
    bio = json['bio'];
    specialty = json['specialty'];
    experienceLevel = json['experience_level'];
    hospitalAffiliations = json['hospital_affiliations'];
    licenseNumber = json['license_number'];
    location = json['location'];
    licenseDocument = json['license_document'];
    profilePicture = json['profile_picture'];
    completionStatus = json['completion_status'];
    timeModified = json['time_modified'];
    timeCreated = json['time_created'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['first_name'] = this.firstName;
    data['last_name'] = this.lastName;
    if (this.appointmentsAvailability != null) {
      data['appointments_availability'] =
          this.appointmentsAvailability!.map((v) => v.toJson()).toList();
    }
    if (this.appointmentsConsultation != null) {
      data['appointments_consultation'] =
          this.appointmentsConsultation!.map((v) => v.toJson()).toList();
    }
    data['average_rating'] = this.averageRating;
    data['patient_count'] = this.patientCount;
    data['practice_name'] = this.practiceName;
    data['date_of_birth'] = this.dateOfBirth;
    data['gender'] = this.gender;
    data['bio'] = this.bio;
    data['specialty'] = this.specialty;
    data['experience_level'] = this.experienceLevel;
    data['hospital_affiliations'] = this.hospitalAffiliations;
    data['license_number'] = this.licenseNumber;
    data['location'] = this.location;
    data['license_document'] = this.licenseDocument;
    data['profile_picture'] = this.profilePicture;
    data['completion_status'] = this.completionStatus;
    data['time_modified'] = this.timeModified;
    data['time_created'] = this.timeCreated;
    return data;
  }
}

class AppointmentsAvailability {
  String? id;
  // Practitioner? practitioner;
  String? practitioner;
  List<AvailabilityTimes>? availabilityTimes;
  int? slotCount;
  String? day;

  AppointmentsAvailability(
      {this.id,
      this.practitioner,
      this.availabilityTimes,
      this.slotCount,
      this.day});

  AppointmentsAvailability.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    // practitioner = json['practitioner'] != null
    //     ? new Practitioner.fromJson(json['practitioner'])
    //     : null;
    practitioner = json['practitioner'];
    if (json['availability_times'] != null) {
      availabilityTimes = <AvailabilityTimes>[];
      json['availability_times'].forEach((v) {
        availabilityTimes!.add(new AvailabilityTimes.fromJson(v));
      });
    }
    slotCount = json['slot_count'];
    day = json['day'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['practitioner'] = this.practitioner;
    // if (this.practitioner != null) {
    //   data['practitioner'] = this.practitioner!.toJson();
    // }
    if (this.availabilityTimes != null) {
      data['availability_times'] =
          this.availabilityTimes!.map((v) => v.toJson()).toList();
    }
    data['slot_count'] = this.slotCount;
    data['day'] = this.day;
    return data;
  }
}

// class Practitioner {
//   String? id;
//   String? firstName;
//   String? lastName;
//   String? email;
//   double? averageReview;
//   String? practiceName;
//   String? dateOfBirth;
//   String? gender;
//   String? bio;
//   String? specialty;
//   int? experienceLevel;
//   String? hospitalAffiliations;
//   String? licenseNumber;
//   String? location;
//   String? licenseDocument;
//   String? profilePicture;
//   String? timeModified;
//   String? timeCreated;

//   Practitioner(
//       {this.id,
//       this.firstName,
//       this.lastName,
//       this.email,
//       this.averageReview,
//       this.practiceName,
//       this.dateOfBirth,
//       this.gender,
//       this.bio,
//       this.specialty,
//       this.experienceLevel,
//       this.hospitalAffiliations,
//       this.licenseNumber,
//       this.location,
//       this.licenseDocument,
//       this.profilePicture,
//       this.timeModified,
//       this.timeCreated});

//   Practitioner.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     firstName = json['first_name'];
//     lastName = json['last_name'];
//     email = json['email'];
//     averageReview = json['average_review'];
//     practiceName = json['practice_name'];
//     dateOfBirth = json['date_of_birth'];
//     gender = json['gender'];
//     bio = json['bio'];
//     specialty = json['specialty'];
//     experienceLevel = json['experience_level'];
//     hospitalAffiliations = json['hospital_affiliations'];
//     licenseNumber = json['license_number'];
//     location = json['location'];
//     licenseDocument = json['license_document'];
//     profilePicture = json['profile_picture'];
//     timeModified = json['time_modified'];
//     timeCreated = json['time_created'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['id'] = this.id;
//     data['first_name'] = this.firstName;
//     data['last_name'] = this.lastName;
//     data['email'] = this.email;
//     data['average_review'] = this.averageReview;
//     data['practice_name'] = this.practiceName;
//     data['date_of_birth'] = this.dateOfBirth;
//     data['gender'] = this.gender;
//     data['bio'] = this.bio;
//     data['specialty'] = this.specialty;
//     data['experience_level'] = this.experienceLevel;
//     data['hospital_affiliations'] = this.hospitalAffiliations;
//     data['license_number'] = this.licenseNumber;
//     data['location'] = this.location;
//     data['license_document'] = this.licenseDocument;
//     data['profile_picture'] = this.profilePicture;
//     data['time_modified'] = this.timeModified;
//     data['time_created'] = this.timeCreated;
//     return data;
//   }
// }

class AvailabilityTimes {
  String? startTime;
  String? endTime;
  String? id;

  AvailabilityTimes({this.startTime, this.endTime, this.id});

  AvailabilityTimes.fromJson(Map<String, dynamic> json) {
    startTime = json['start_time'];
    endTime = json['end_time'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['start_time'] = this.startTime;
    data['end_time'] = this.endTime;
    data['id'] = this.id;
    return data;
  }
}

class AppointmentsConsultation {
  String? id;
  // Practitioner? practitioner;
  String? practitioner;
  int? consultationType;
  String? consultationFee;

  AppointmentsConsultation(
      {this.id,
      this.practitioner,
      this.consultationType,
      this.consultationFee});

  AppointmentsConsultation.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    practitioner = json['practitioner'];
    // practitioner = json['practitioner'] != null
    //     ? new Practitioner.fromJson(json['practitioner'])
    //     : null;
    consultationType = json['consultation_type'];
    consultationFee = json['consultation_fee'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['practitioner'] = this.practitioner;
    // if (this.practitioner != null) {
    //   data['practitioner'] = this.practitioner!.toJson();
    // }
    data['consultation_type'] = this.consultationType;
    data['consultation_fee'] = this.consultationFee;
    return data;
  }
}
