// class PatientDetailsResModel {
//   String? id;
//   String? phoneNumber;
//   String? email;
//   String? firstName;
//   String? lastName;
//   List<AppointmentsPatient>? appointmentsPatient;
//   String? dateOfBirth;
//   String? gender;
//   String? bloodGroup;
//   String? genotype;
//   int? height;
//   int? weight;
//   String? address;
//   String? profilePicture;
//   bool? completionStatus;
//   String? timeModified;
//   String? timeCreated;

//   PatientDetailsResModel(
//       {this.id,
//       this.phoneNumber,
//       this.email,
//       this.firstName,
//       this.lastName,
//       this.appointmentsPatient,
//       this.dateOfBirth,
//       this.gender,
//       this.bloodGroup,
//       this.genotype,
//       this.height,
//       this.weight,
//       this.address,
//       this.profilePicture,
//       this.completionStatus,
//       this.timeModified,
//       this.timeCreated});

//   PatientDetailsResModel.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     phoneNumber = json['phone_number'];
//     email = json['email'];
//     firstName = json['first_name'];
//     lastName = json['last_name'];
//     if (json['appointments_patient'] != null) {
//       appointmentsPatient = <AppointmentsPatient>[];
//       json['appointments_patient'].forEach((v) {
//         appointmentsPatient!.add(new AppointmentsPatient.fromJson(v));
//       });
//     }
//     dateOfBirth = json['date_of_birth'];
//     gender = json['gender'];
//     bloodGroup = json['blood_group'];
//     genotype = json['genotype'];
//     height = json['height'];
//     weight = json['weight'];
//     address = json['address'];
//     profilePicture = json['profile_picture'];
//     completionStatus = json['completion_status'];
//     timeModified = json['time_modified'];
//     timeCreated = json['time_created'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['id'] = this.id;
//     data['phone_number'] = this.phoneNumber;
//     data['email'] = this.email;
//     data['first_name'] = this.firstName;
//     data['last_name'] = this.lastName;
//     if (this.appointmentsPatient != null) {
//       data['appointments_patient'] =
//           this.appointmentsPatient!.map((v) => v.toJson()).toList();
//     }
//     data['date_of_birth'] = this.dateOfBirth;
//     data['gender'] = this.gender;
//     data['blood_group'] = this.bloodGroup;
//     data['genotype'] = this.genotype;
//     data['height'] = this.height;
//     data['weight'] = this.weight;
//     data['address'] = this.address;
//     data['profile_picture'] = this.profilePicture;
//     data['completion_status'] = this.completionStatus;
//     data['time_modified'] = this.timeModified;
//     data['time_created'] = this.timeCreated;
//     return data;
//   }
// }

// class AppointmentsPatient {
//   String? id;
//   String? practitioner;
//   String? patient;
//   int? consultationType;
//   String? consultationFee;
//   String? consultationDate;
//   String? consultationTime;
//   String? symptoms;

//   AppointmentsPatient(
//       {this.id,
//       this.practitioner,
//       this.patient,
//       this.consultationType,
//       this.consultationFee,
//       this.consultationDate,
//       this.consultationTime,
//       this.symptoms});

//   AppointmentsPatient.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     practitioner = json['practitioner'];
//     patient = json['patient'];
//     consultationType = json['consultation_type'];
//     consultationFee = json['consultation_fee'];
//     consultationDate = json['consultation_date'];
//     consultationTime = json['consultation_time'];
//     symptoms = json['symptoms'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['id'] = this.id;
//     data['practitioner'] = this.practitioner;
//     data['patient'] = this.patient;
//     data['consultation_type'] = this.consultationType;
//     data['consultation_fee'] = this.consultationFee;
//     data['consultation_date'] = this.consultationDate;
//     data['consultation_time'] = this.consultationTime;
//     data['symptoms'] = this.symptoms;
//     return data;
//   }
// }
