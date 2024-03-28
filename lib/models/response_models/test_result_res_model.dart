class TestResultResModel {
  String? id;
  Appointment? appointment;
  List<TestDetails>? testDetails;
  String? diagnosis;
  String? commentsNotes;
  String? attachment;
  String? timeModified;
  String? timeCreated;

  TestResultResModel(
      {this.id,
      this.appointment,
      this.testDetails,
      this.diagnosis,
      this.commentsNotes,
      this.attachment,
      this.timeModified,
      this.timeCreated});

  TestResultResModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    appointment = json['appointment'] != null
        ? new Appointment.fromJson(json['appointment'])
        : null;
    if (json['test_details'] != null) {
      testDetails = <TestDetails>[];
      json['test_details'].forEach((v) {
        testDetails!.add(new TestDetails.fromJson(v));
      });
    }
    diagnosis = json['diagnosis'];
    commentsNotes = json['comments_notes'];
    attachment = json['attachment'];
    timeModified = json['time_modified'];
    timeCreated = json['time_created'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    if (this.appointment != null) {
      data['appointment'] = this.appointment!.toJson();
    }
    if (this.testDetails != null) {
      data['test_details'] = this.testDetails!.map((v) => v.toJson()).toList();
    }
    data['diagnosis'] = this.diagnosis;
    data['comments_notes'] = this.commentsNotes;
    data['attachment'] = this.attachment;
    data['time_modified'] = this.timeModified;
    data['time_created'] = this.timeCreated;
    return data;
  }
}

class Appointment {
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
  String? language;
  String? paymentMethod;
  String? status;
  String? timeModified;
  String? timeCreated;

  Appointment(
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
      this.language,
      this.paymentMethod,
      this.status,
      this.timeModified,
      this.timeCreated});

  Appointment.fromJson(Map<String, dynamic> json) {
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
    language = json['language'];
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
    data['language'] = this.language;
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
  int? averageReview;
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

class TestDetails {
  String? id;
  String? testName;
  String? result;

  TestDetails({this.id, this.testName, this.result});

  TestDetails.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    testName = json['test_name'];
    result = json['result'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['test_name'] = this.testName;
    data['result'] = this.result;
    return data;
  }
}
