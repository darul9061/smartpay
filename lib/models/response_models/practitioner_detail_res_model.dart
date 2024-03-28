class PractitionerDetailResModel {
  String? id;
  String? phoneNumber;
  String? email;
  String? firstName;
  String? lastName;
  List<AppointmentsAvailability>? appointmentsAvailability;
  List<AppointmentsUnavailability>? appointmentsUnavailability;
  List<AppointmentsConsultation>? appointmentsConsultation;
  List<AppointmentsPractitioner>? appointmentsPractitioner;
  List<SlotsTaken>? slotsTaken;
  List<ReviewPractitioner>? reviewPractitioner;
  double? averageRating;
  int? patientCount;
  String? referralCode;
  List<PractitionerReferralReferred>? practitionerReferralReferred;
  int? reviewsCount;
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
  String? recommendation;
  String? topReviewTitle;
  bool? completionStatus;
  String? timeModified;
  String? timeCreated;

  PractitionerDetailResModel(
      {this.id,
      this.phoneNumber,
      this.email,
      this.firstName,
      this.lastName,
      this.appointmentsAvailability,
      this.appointmentsUnavailability,
      this.appointmentsConsultation,
      this.appointmentsPractitioner,
      this.slotsTaken,
      this.reviewPractitioner,
      this.averageRating,
      this.patientCount,
      this.referralCode,
      this.practitionerReferralReferred,
      this.reviewsCount,
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
      this.recommendation,
      this.topReviewTitle,
      this.completionStatus,
      this.timeModified,
      this.timeCreated});

  PractitionerDetailResModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    phoneNumber = json['phone_number'];
    email = json['email'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    if (json['appointments_availability'] != null) {
      appointmentsAvailability = <AppointmentsAvailability>[];
      json['appointments_availability'].forEach((v) {
        appointmentsAvailability!.add(new AppointmentsAvailability.fromJson(v));
      });
    }
    if (json['appointments_unavailability'] != null) {
      appointmentsUnavailability = <AppointmentsUnavailability>[];
      json['appointments_unavailability'].forEach((v) {
        appointmentsUnavailability!
            .add(new AppointmentsUnavailability.fromJson(v));
      });
    }
    if (json['appointments_consultation'] != null) {
      appointmentsConsultation = <AppointmentsConsultation>[];
      json['appointments_consultation'].forEach((v) {
        appointmentsConsultation!.add(new AppointmentsConsultation.fromJson(v));
      });
    }
    if (json['appointments_practitioner'] != null) {
      appointmentsPractitioner = <AppointmentsPractitioner>[];
      json['appointments_practitioner'].forEach((v) {
        appointmentsPractitioner!.add(new AppointmentsPractitioner.fromJson(v));
      });
    }
    if (json['slots_taken'] != null) {
      slotsTaken = <SlotsTaken>[];
      json['slots_taken'].forEach((v) {
        slotsTaken!.add(new SlotsTaken.fromJson(v));
      });
    }
    if (json['review_practitioner'] != null) {
      reviewPractitioner = <ReviewPractitioner>[];
      json['review_practitioner'].forEach((v) {
        reviewPractitioner!.add(new ReviewPractitioner.fromJson(v));
      });
    }
    averageRating = json['average_rating'];
    patientCount = json['patient_count'];
    referralCode = json['referral_code'];
    if (json['practitioner_referral_referred'] != null) {
      practitionerReferralReferred = <PractitionerReferralReferred>[];
      json['practitioner_referral_referred'].forEach((v) {
        practitionerReferralReferred!
            .add(new PractitionerReferralReferred.fromJson(v));
      });
    }
    reviewsCount = json['reviews_count'];
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
    recommendation = json['recommendation'];
    topReviewTitle = json['topReviewTitle'];
    completionStatus = json['completion_status'];
    timeModified = json['time_modified'];
    timeCreated = json['time_created'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['phone_number'] = this.phoneNumber;
    data['email'] = this.email;
    data['first_name'] = this.firstName;
    data['last_name'] = this.lastName;
    if (this.appointmentsAvailability != null) {
      data['appointments_availability'] =
          this.appointmentsAvailability!.map((v) => v.toJson()).toList();
    }
    if (this.appointmentsUnavailability != null) {
      data['appointments_unavailability'] =
          this.appointmentsUnavailability!.map((v) => v.toJson()).toList();
    }
    if (this.appointmentsConsultation != null) {
      data['appointments_consultation'] =
          this.appointmentsConsultation!.map((v) => v.toJson()).toList();
    }
    if (this.appointmentsPractitioner != null) {
      data['appointments_practitioner'] =
          this.appointmentsPractitioner!.map((v) => v.toJson()).toList();
    }
    if (this.slotsTaken != null) {
      data['slots_taken'] = this.slotsTaken!.map((v) => v.toJson()).toList();
    }
    if (this.reviewPractitioner != null) {
      data['review_practitioner'] =
          this.reviewPractitioner!.map((v) => v.toJson()).toList();
    }
    data['average_rating'] = this.averageRating;
    data['patient_count'] = this.patientCount;
    data['referral_code'] = this.referralCode;
    if (this.practitionerReferralReferred != null) {
      data['practitioner_referral_referred'] =
          this.practitionerReferralReferred!.map((v) => v.toJson()).toList();
    }
    data['reviews_count'] = this.reviewsCount;
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
    data['recommendation'] = this.recommendation;
    data['topReviewTitle'] = this.topReviewTitle;
    data['completion_status'] = this.completionStatus;
    data['time_modified'] = this.timeModified;
    data['time_created'] = this.timeCreated;
    return data;
  }
}

class AppointmentsAvailability {
  String? id;
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
    if (this.availabilityTimes != null) {
      data['availability_times'] =
          this.availabilityTimes!.map((v) => v.toJson()).toList();
    }
    data['slot_count'] = this.slotCount;
    data['day'] = this.day;
    return data;
  }
}

class AvailabilityTimes {
  String? startTime;
  String? endTime;
  int? available;
  String? id;

  AvailabilityTimes({this.startTime, this.endTime, this.available, this.id});

  AvailabilityTimes.fromJson(Map<String, dynamic> json) {
    startTime = json['start_time'];
    endTime = json['end_time'];
    available = json['available'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['start_time'] = this.startTime;
    data['end_time'] = this.endTime;
    data['available'] = this.available;
    data['id'] = this.id;
    return data;
  }
}

class AppointmentsUnavailability {
  String? id;
  String? practitioner;
  String? startDate;
  String? endDate;

  AppointmentsUnavailability(
      {this.id, this.practitioner, this.startDate, this.endDate});

  AppointmentsUnavailability.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    practitioner = json['practitioner'];
    startDate = json['start_date'];
    endDate = json['end_date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['practitioner'] = this.practitioner;
    data['start_date'] = this.startDate;
    data['end_date'] = this.endDate;
    return data;
  }
}

class AppointmentsConsultation {
  String? id;
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
    consultationType = json['consultation_type'];
    consultationFee = json['consultation_fee'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['practitioner'] = this.practitioner;
    data['consultation_type'] = this.consultationType;
    data['consultation_fee'] = this.consultationFee;
    return data;
  }
}

class AppointmentsPractitioner {
  String? id;
  Practitioner? practitioner;
  Patient? patient;
  List<TestAppointmentItems>? testAppointmentItems;
  int? appointmentType;
  String? labName;
  String? location;
  int? consultationType;
  String? consultationFee;
  String? consultationDate;
  String? consultationTime;
  int? duration;
  String? symptoms;
  String? paymentMethod;
  String? status;
  String? timeModified;
  String? timeCreated;

  AppointmentsPractitioner(
      {this.id,
      this.practitioner,
      this.patient,
      this.testAppointmentItems,
      this.appointmentType,
      this.labName,
      this.location,
      this.consultationType,
      this.consultationFee,
      this.consultationDate,
      this.consultationTime,
      this.duration,
      this.symptoms,
      this.paymentMethod,
      this.status,
      this.timeModified,
      this.timeCreated});

  AppointmentsPractitioner.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    practitioner = json['practitioner'] != null
        ? new Practitioner.fromJson(json['practitioner'])
        : null;
    patient =
        json['patient'] != null ? new Patient.fromJson(json['patient']) : null;
    if (json['test_appointment_items'] != null) {
      testAppointmentItems = <TestAppointmentItems>[];
      json['test_appointment_items'].forEach((v) {
        testAppointmentItems!.add(new TestAppointmentItems.fromJson(v));
      });
    }
    appointmentType = json['appointment_type'];
    labName = json['lab_name'];
    location = json['location'];
    consultationType = json['consultation_type'];
    consultationFee = json['consultation_fee'];
    consultationDate = json['consultation_date'];
    consultationTime = json['consultation_time'];
    duration = json['duration'];
    symptoms = json['symptoms'];
    paymentMethod = json['payment_method'];
    status = json['status'];
    timeModified = json['time_modified'];
    timeCreated = json['time_created'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    if (this.practitioner != null) {
      data['practitioner'] = this.practitioner!.toJson();
    }
    if (this.patient != null) {
      data['patient'] = this.patient!.toJson();
    }
    if (this.testAppointmentItems != null) {
      data['test_appointment_items'] =
          this.testAppointmentItems!.map((v) => v.toJson()).toList();
    }
    data['appointment_type'] = this.appointmentType;
    data['lab_name'] = this.labName;
    data['location'] = this.location;
    data['consultation_type'] = this.consultationType;
    data['consultation_fee'] = this.consultationFee;
    data['consultation_date'] = this.consultationDate;
    data['consultation_time'] = this.consultationTime;
    data['duration'] = this.duration;
    data['symptoms'] = this.symptoms;
    data['payment_method'] = this.paymentMethod;
    data['status'] = this.status;
    data['time_modified'] = this.timeModified;
    data['time_created'] = this.timeCreated;
    return data;
  }
}

class Practitioner {
  String? id;
  String? firstName;
  String? lastName;
  String? email;
  double? averageReview;
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
  String? recommendation;
  String? topReviewTitle;
  String? timeModified;
  String? timeCreated;

  Practitioner(
      {this.id,
      this.firstName,
      this.lastName,
      this.email,
      this.averageReview,
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
      this.recommendation,
      this.topReviewTitle,
      this.timeModified,
      this.timeCreated});

  Practitioner.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    email = json['email'];
    averageReview = json['average_review'];
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
    recommendation = json['recommendation'];
    topReviewTitle = json['topReviewTitle'];
    timeModified = json['time_modified'];
    timeCreated = json['time_created'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['first_name'] = this.firstName;
    data['last_name'] = this.lastName;
    data['email'] = this.email;
    data['average_review'] = this.averageReview;
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
    data['recommendation'] = this.recommendation;
    data['topReviewTitle'] = this.topReviewTitle;
    data['time_modified'] = this.timeModified;
    data['time_created'] = this.timeCreated;
    return data;
  }
}

class Patient {
  String? id;
  String? phoneNumber;
  String? email;
  String? firstName;
  String? lastName;
  String? medicsId;
  String? dateOfBirth;
  String? gender;
  String? bloodGroup;
  String? genotype;
  int? height;
  int? weight;
  String? address;
  String? profilePicture;
  String? timeModified;
  String? timeCreated;

  Patient(
      {this.id,
      this.phoneNumber,
      this.email,
      this.firstName,
      this.lastName,
      this.medicsId,
      this.dateOfBirth,
      this.gender,
      this.bloodGroup,
      this.genotype,
      this.height,
      this.weight,
      this.address,
      this.profilePicture,
      this.timeModified,
      this.timeCreated});

  Patient.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    phoneNumber = json['phone_number'];
    email = json['email'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    medicsId = json['medics_id'];
    dateOfBirth = json['date_of_birth'];
    gender = json['gender'];
    bloodGroup = json['blood_group'];
    genotype = json['genotype'];
    height = json['height'];
    weight = json['weight'];
    address = json['address'];
    profilePicture = json['profile_picture'];
    timeModified = json['time_modified'];
    timeCreated = json['time_created'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['phone_number'] = this.phoneNumber;
    data['email'] = this.email;
    data['first_name'] = this.firstName;
    data['last_name'] = this.lastName;
    data['medics_id'] = this.medicsId;
    data['date_of_birth'] = this.dateOfBirth;
    data['gender'] = this.gender;
    data['blood_group'] = this.bloodGroup;
    data['genotype'] = this.genotype;
    data['height'] = this.height;
    data['weight'] = this.weight;
    data['address'] = this.address;
    data['profile_picture'] = this.profilePicture;
    data['time_modified'] = this.timeModified;
    data['time_created'] = this.timeCreated;
    return data;
  }
}

class TestAppointmentItems {
  String? id;
  String? testName;
  String? price;
  String? timeModified;
  String? timeCreated;
  String? appointment;

  TestAppointmentItems(
      {this.id,
      this.testName,
      this.price,
      this.timeModified,
      this.timeCreated,
      this.appointment});

  TestAppointmentItems.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    testName = json['test_name'];
    price = json['price'];
    timeModified = json['time_modified'];
    timeCreated = json['time_created'];
    appointment = json['appointment'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['test_name'] = this.testName;
    data['price'] = this.price;
    data['time_modified'] = this.timeModified;
    data['time_created'] = this.timeCreated;
    data['appointment'] = this.appointment;
    return data;
  }
}

class SlotsTaken {
  String? date;
  List<String>? time;

  SlotsTaken({this.date, this.time});

  SlotsTaken.fromJson(Map<String, dynamic> json) {
    date = json['date'];
    time = json['time'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['date'] = this.date;
    data['time'] = this.time;
    return data;
  }
}

class ReviewPractitioner {
  String? id;
  String? practitioner;
  Patient? patient;
  String? title;
  String? review;
  double? rating;
  String? timeModified;
  String? timeCreated;

  ReviewPractitioner(
      {this.id,
      this.practitioner,
      this.patient,
      this.title,
      this.review,
      this.rating,
      this.timeModified,
      this.timeCreated});

  ReviewPractitioner.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    practitioner = json['practitioner'];
    patient =
        json['patient'] != null ? new Patient.fromJson(json['patient']) : null;
    title = json['title'];
    review = json['review'];
    rating = json['rating'];
    timeModified = json['time_modified'];
    timeCreated = json['time_created'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['practitioner'] = this.practitioner;
    if (this.patient != null) {
      data['patient'] = this.patient!.toJson();
    }
    data['title'] = this.title;
    data['review'] = this.review;
    data['rating'] = this.rating;
    data['time_modified'] = this.timeModified;
    data['time_created'] = this.timeCreated;
    return data;
  }
}

class PractitionerReferralReferred {
  String? firstName;
  String? lastName;
  String? timeCreated;

  PractitionerReferralReferred(
      {this.firstName, this.lastName, this.timeCreated});

  PractitionerReferralReferred.fromJson(Map<String, dynamic> json) {
    firstName = json['first_name'];
    lastName = json['last_name'];
    timeCreated = json['time_created'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['first_name'] = this.firstName;
    data['last_name'] = this.lastName;
    data['time_created'] = this.timeCreated;
    return data;
  }
}
