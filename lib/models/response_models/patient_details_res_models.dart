class PatientDetailsResModel {
  String? id;
  String? phoneNumber;
  String? email;
  String? firstName;
  String? lastName;
  NextOfKin? nextOfKin;
  String? medicsId;
  List<AppointmentsPatient>? appointmentsPatient;
  PharmacyCart? pharmacyCart;
  TestsCart? testsCart;
  PatientWallet? patientWallet;
  List<PatientPayment>? patientPayment;
  List<Orders>? orders;
  String? referralCode;
  List<PatientReferralReferrer>? patientReferralReferrer;
  List<PatientTracker>? patientTracker;
  SubscriptionPlan? subscriptionPlan;
  String? dateOfBirth;
  String? gender;
  String? bloodGroup;
  String? genotype;
  int? height;
  int? weight;
  String? address;
  String? profilePicture;
  bool? completionStatus;
  String? timeModified;
  String? timeCreated;

  PatientDetailsResModel(
      {this.id,
      this.phoneNumber,
      this.email,
      this.firstName,
      this.lastName,
      this.nextOfKin,
      this.medicsId,
      this.appointmentsPatient,
      this.pharmacyCart,
      this.testsCart,
      this.patientWallet,
      this.patientPayment,
      this.orders,
      this.referralCode,
      this.patientReferralReferrer,
      this.patientTracker,
      this.subscriptionPlan,
      this.dateOfBirth,
      this.gender,
      this.bloodGroup,
      this.genotype,
      this.height,
      this.weight,
      this.address,
      this.profilePicture,
      this.completionStatus,
      this.timeModified,
      this.timeCreated});

  PatientDetailsResModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    phoneNumber = json['phone_number'];
    email = json['email'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    nextOfKin = json['next_of_kin'] != null
        ? new NextOfKin.fromJson(json['next_of_kin'])
        : null;
    medicsId = json['medics_id'];
    if (json['appointments_patient'] != null) {
      appointmentsPatient = <AppointmentsPatient>[];
      json['appointments_patient'].forEach((v) {
        appointmentsPatient!.add(new AppointmentsPatient.fromJson(v));
      });
    }
    pharmacyCart = json['pharmacy_cart'] != null
        ? new PharmacyCart.fromJson(json['pharmacy_cart'])
        : null;
    testsCart = json['tests_cart'] != null
        ? new TestsCart.fromJson(json['tests_cart'])
        : null;
    patientWallet = json['patient_wallet'] != null
        ? new PatientWallet.fromJson(json['patient_wallet'])
        : null;
    if (json['orders'] != null) {
      orders = <Orders>[];
      json['orders'].forEach((v) {
        orders!.add(new Orders.fromJson(v));
      });
    }
    referralCode = json['referral_code'];
    if (json['patient_referral_referrer'] != null) {
      patientReferralReferrer = <PatientReferralReferrer>[];
      json['patient_referral_referrer'].forEach((v) {
        patientReferralReferrer!.add(new PatientReferralReferrer.fromJson(v));
      });
    }
    if (json['patient_payment'] != null) {
      patientPayment = <PatientPayment>[];
      json['patient_payment'].forEach((v) {
        patientPayment!.add(new PatientPayment.fromJson(v));
      });
    }
    if (json['patient_tracker'] != null) {
      patientTracker = <PatientTracker>[];
      json['patient_tracker'].forEach((v) {
        patientTracker!.add(new PatientTracker.fromJson(v));
      });
    }
    subscriptionPlan = json['plan'] != null
        ? new SubscriptionPlan.fromJson(json['plan'])
        : null;
    dateOfBirth = json['date_of_birth'];
    gender = json['gender'];
    bloodGroup = json['blood_group'];
    genotype = json['genotype'];
    height = json['height'];
    weight = json['weight'];
    address = json['address'];
    profilePicture = json['profile_picture'];
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
    if (this.nextOfKin != null) {
      data['next_of_kin'] = this.nextOfKin!.toJson();
    }
    data['medics_id'] = this.medicsId;
    if (this.appointmentsPatient != null) {
      data['appointments_patient'] =
          this.appointmentsPatient!.map((v) => v.toJson()).toList();
    }
    if (this.pharmacyCart != null) {
      data['pharmacy_cart'] = this.pharmacyCart!.toJson();
    }
    if (this.testsCart != null) {
      data['tests_cart'] = this.testsCart!.toJson();
    }
    if (this.patientWallet != null) {
      data['patient_wallet'] = this.patientWallet!.toJson();
    }
    if (this.orders != null) {
      data['orders'] = this.orders!.map((v) => v.toJson()).toList();
    }
    if (this.patientPayment != null) {
      data['payment_payment'] =
          this.patientPayment!.map((v) => v.toJson()).toList();
    }
    data['referral_code'] = this.referralCode;
    if (this.patientReferralReferrer != null) {
      data['patient_referral_referrer'] =
          this.patientReferralReferrer!.map((v) => v.toJson()).toList();
    }
    if (this.patientTracker != null) {
      data['patient_tracker'] =
          this.patientTracker!.map((v) => v.toJson()).toList();
    }
    data['date_of_birth'] = this.dateOfBirth;
    data['gender'] = this.gender;
    data['blood_group'] = this.bloodGroup;
    data['genotype'] = this.genotype;
    data['height'] = this.height;
    data['weight'] = this.weight;
    data['address'] = this.address;
    data['profile_picture'] = this.profilePicture;
    data['completion_status'] = this.completionStatus;
    data['time_modified'] = this.timeModified;
    data['time_created'] = this.timeCreated;
    return data;
  }
}

class NextOfKin {
  String? id;
  String? fullName;
  String? phoneNumber;

  NextOfKin({this.id, this.fullName, this.phoneNumber});

  NextOfKin.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    fullName = json['full_name'];
    phoneNumber = json['phone_number'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['full_name'] = this.fullName;
    data['phone_number'] = this.phoneNumber;
    return data;
  }
}

class AppointmentsPatient {
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
  String? symptoms;
  String? paymentMethod;
  String? status;
  String? timeModified;
  String? timeCreated;

  AppointmentsPatient(
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
      this.symptoms,
      this.paymentMethod,
      this.status,
      this.timeModified,
      this.timeCreated});

  AppointmentsPatient.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    practitioner = json['practitioner'] != null
        ? new Practitioner.fromJson(json['practitioner'])
        : null;
    patient =
        json['patient'] != null ? 

          // This is caused by the irregularity of the backend engineer
          json['patient'] is Map<String,dynamic>? new Patient.fromJson(json['patient']) : new Patient( firstName: json[patient])

        : 
        
          null;

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

class PharmacyCart {
  String? id;
  List<PharmacyCartItems>? pharmacyCartItems;
  int? cartCount;
  double? totalCost;
  String? timeModified;
  String? timeCreated;
  String? patient;
  String? pharmacyItem;
  String? pharmacyItemId;

  PharmacyCart(
      {this.id,
      this.pharmacyCartItems,
      this.cartCount,
      this.totalCost,
      this.pharmacyItem,
      this.pharmacyItemId,
      this.timeModified,
      this.timeCreated,
      this.patient});

  PharmacyCart.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    if (json['pharmacy_cart_items'] != null) {
      pharmacyCartItems = <PharmacyCartItems>[];
      json['pharmacy_cart_items'].forEach((v) {
        pharmacyCartItems!.add(new PharmacyCartItems.fromJson(v));
      });
    }
    cartCount = json['cart_count'];
    totalCost = json['total_cost']?.toDouble();
    pharmacyItem = json['pharmacy_item'];
    pharmacyItemId = json['pharmacy_item_id'];
    timeModified = json['time_modified'];
    timeCreated = json['time_created'];
    patient = json['patient'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    if (this.pharmacyCartItems != null) {
      data['pharmacy_cart_items'] =
          this.pharmacyCartItems!.map((v) => v.toJson()).toList();
    }
    data['cart_count'] = this.cartCount;
    data['total_cost'] = this.totalCost;
    data['time_modified'] = this.timeModified;
    data['time_created'] = this.timeCreated;
    data['patient'] = this.patient;
    data['pharmacy_item'] = this.pharmacyItem;
    data['pharmacy_item_id'] = this.pharmacyItemId;
    return data;
  }
}

class PharmacyCartItems {
  String? id;
  String? productTitle;
  int? quantity;
  String? price;
  int? drugSize;
  bool? restricted;
  String? image;

  PharmacyCartItems(
      {this.id,
      this.productTitle,
      this.quantity,
      this.price,
      this.drugSize,
      this.restricted,
      this.image});

  PharmacyCartItems.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    productTitle = json['product_title'];
    quantity = json['quantity'];
    price = json['price'];
    drugSize = json['drug_size'];
    restricted = json['restricted'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['product_title'] = this.productTitle;
    data['quantity'] = this.quantity;
    data['price'] = this.price;
    data['drug_size'] = this.drugSize;
    data['restricted'] = this.restricted;
    data['image'] = this.image;
    return data;
  }
}

class TestsCart {
  String? id;
  List<TestsCartItems>? testsCartItems;
  int? cartCount;
  double? totalCost;
  String? timeModified;
  String? timeCreated;
  String? patient;

  TestsCart(
      {this.id,
      this.testsCartItems,
      this.cartCount,
      this.totalCost,
      this.timeModified,
      this.timeCreated,
      this.patient});

  TestsCart.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    if (json['tests_cart_items'] != null) {
      testsCartItems = <TestsCartItems>[];
      json['tests_cart_items'].forEach((v) {
        testsCartItems!.add(new TestsCartItems.fromJson(v));
      });
    }
    cartCount = json['cart_count'];
    totalCost = json['total_cost']?.toDouble();
    timeModified = json['time_modified'];
    timeCreated = json['time_created'];
    patient = json['patient'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    if (this.testsCartItems != null) {
      data['tests_cart_items'] =
          this.testsCartItems!.map((v) => v.toJson()).toList();
    }
    data['cart_count'] = this.cartCount;
    data['total_cost'] = this.totalCost;
    data['time_modified'] = this.timeModified;
    data['time_created'] = this.timeCreated;
    data['patient'] = this.patient;
    return data;
  }
}

class PatientWallet {
  String? id;
  String? patient;
  String? availableBalance;
  String? timeCreated;
  String? timeModified;

  PatientWallet(
      {this.id,
      this.patient,
      this.availableBalance,
      this.timeCreated,
      this.timeModified});

  PatientWallet.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    patient = json['patient'];
    availableBalance = json['available_balance'];
    timeCreated = json['time_created'];
    timeModified = json['time_modified'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['patient'] = this.patient;
    data['available_balance'] = this.availableBalance;
    data['time_created'] = this.timeCreated;
    data['time_modified'] = this.timeModified;
    return data;
  }
}

class PatientPayment {
  String? id;
  String? patient;
  String? transaction;
  String? amount;
  String? transactionDate;
  int? status;
  int? paymentType;
  String? paymentMethod;
  String? timeCreated;
  String? timeModified;

  PatientPayment(
      {this.id,
      this.patient,
      this.transaction,
      this.amount,
      this.transactionDate,
      this.status,
      this.paymentType,
      this.paymentMethod,
      this.timeCreated,
      this.timeModified});

  PatientPayment.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    patient = json['patient'];
    transaction = json['transaction'];
    amount = json['amount'];
    transactionDate = json['transaction_date'];
    status = json['status'];
    paymentType = json['payment_type'];
    paymentMethod = json['payment_method'];
    timeCreated = json['time_created'];
    timeModified = json['time_modified'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['patient'] = this.patient;
    data['transaction'] = this.transaction;
    data['amount'] = this.amount;
    data['transaction_date'] = this.transactionDate;
    data['status'] = this.status;
    data['payment_type'] = this.paymentType;
    data['payment_method'] = this.paymentMethod;
    data['time_created'] = this.timeCreated;
    data['time_modified'] = this.timeModified;
    return data;
  }
}

class TestsCartItems {
  String? id;
  String? productTitle;
  String? price;
  String? image;

  TestsCartItems({this.id, this.productTitle, this.price, this.image});

  TestsCartItems.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    productTitle = json['product_title'];
    price = json['price'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['product_title'] = this.productTitle;
    data['price'] = this.price;
    data['image'] = this.image;
    return data;
  }
}

class Orders {
  String? id;
  List<OrderItems>? orderItems;
  int? orderNo;
  String? location;
  String? paymentMethod;
  String? status;
  String? timeModified;
  String? timeCreated;

  Orders(
      {this.id,
      this.orderItems,
      this.orderNo,
      this.location,
      this.paymentMethod,
      this.status,
      this.timeModified,
      this.timeCreated});

  Orders.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    if (json['order_items'] != null) {
      orderItems = <OrderItems>[];
      json['order_items'].forEach((v) {
        orderItems!.add(new OrderItems.fromJson(v));
      });
    }
    orderNo = json['order_no'];
    location = json['location'];
    paymentMethod = json['payment_method'];
    status = json['status'];
    timeModified = json['time_modified'];
    timeCreated = json['time_created'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    if (this.orderItems != null) {
      data['order_items'] = this.orderItems!.map((v) => v.toJson()).toList();
    }
    data['order_no'] = this.orderNo;
    data['location'] = this.location;
    data['payment_method'] = this.paymentMethod;
    data['status'] = this.status;
    data['time_modified'] = this.timeModified;
    data['time_created'] = this.timeCreated;
    return data;
  }
}

class OrderItems {
  String? id;
  String? productName;
  int? quantity;
  String? price;
  String? timeModified;
  String? timeCreated;

  OrderItems(
      {this.id,
      this.productName,
      this.quantity,
      this.price,
      this.timeModified,
      this.timeCreated});

  OrderItems.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    productName = json['product_name'];
    quantity = json['quantity'];
    price = json['price'];
    timeModified = json['time_modified'];
    timeCreated = json['time_created'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['product_name'] = this.productName;
    data['quantity'] = this.quantity;
    data['price'] = this.price;
    data['time_modified'] = this.timeModified;
    data['time_created'] = this.timeCreated;
    return data;
  }
}

class PatientReferralReferrer {
  String? firstName;
  String? lastName;
  String? timeCreated;

  PatientReferralReferrer({this.firstName, this.lastName, this.timeCreated});

  PatientReferralReferrer.fromJson(Map<String, dynamic> json) {
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

class PatientTracker {
  String? id;
  List<TrackerData>? trackerData;
  String? unit;
  String? name;
  String? timeModified;
  String? timeCreated;

  PatientTracker(
      {this.id,
      this.trackerData,
      this.unit,
      this.name,
      this.timeModified,
      this.timeCreated});

  PatientTracker.fromJson(Map<String, dynamic> json) {
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

class SubscriptionPlan {
  String? id;
  List<PlanFeatures>? planFeatures;
  String? plan;
  String? description;
  String? price;
  String? timeModified;
  String? timeCreated;

  SubscriptionPlan(
      {this.id,
      this.planFeatures,
      this.plan,
      this.description,
      this.price,
      this.timeModified,
      this.timeCreated});

  SubscriptionPlan.fromJson(Map<String, dynamic> json) {
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
