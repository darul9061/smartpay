import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smartpay/models/user_detail_model.dart';
import 'package:smartpay/utils/common.dart';
import 'package:smartpay/utils/hexcolor.dart';

class SmartpayColors {
  static Color smartpayPrimaryColor = HexColor("#111827");
  static Color smartpaySecondaryColor = HexColor("#2FA2B9");
  static Color smartpayGray = HexColor("#111827");
  static Color smartpayLightAsh = HexColor("#F9FAFB");
  static Color smartpayBlack = HexColor("#1C1616");
  static Color smartpayRed = HexColor("#F14914");
  static Color smartpayGreen = HexColor("#289A7F");
  static Color smartpayGreen2 = HexColor("#027A48");
  static Color smartpayWhiteGreen = HexColor("#ECFDF3");
  static Color smartpayBlueishWhite = HexColor("#F9FAFD");
  static Color smartpayBlueDarker = HexColor("#070031");
  static Color smartpayBorderColor = HexColor("#E9EBF3");
  static Color smartpayBorderColor2 = HexColor("#BCC2DA");
  static Color success = HexColor("#027A48");
  static const Color darkPrimary = Color(0xFF0D0053);
}

class SmartpayIconsAssets {
  static const String basePath = "assets/icons/";

  static String calendar = "${basePath}calendar.png";
  static String eye = "${basePath}eye.png";
  static String bell = "${basePath}bell.png";
  static String home = "${basePath}home.png";
  static String homeLight = "${basePath}home_light.png";
  static String messageCircle = "${basePath}message-circle.png";
  static String messageCircleLight = "${basePath}message-circle-light.png";
  static String user = "${basePath}user.png";
  static String userBig = "${basePath}user_big.png";
  static String calendar2 = "${basePath}calendar2.png";
  static String filter = "${basePath}mi_filter.png";
  static String users = "${basePath}users.png";
  static String video = "${basePath}video.png";
  static String phone = "${basePath}phone.png";
  static String asthma = "${basePath}asthma.png";
  static String award = "${basePath}award.png";
  static String calendar3 = "${basePath}calendar3.png";
  static String video2 = "${basePath}video2.png";
  static String panic = "${basePath}panic.png";
  static String wallet = "${basePath}wallet.png";
  static String wallet2 = "${basePath}wallet2.png";
  static String yuck = "${basePath}accessibility.png";
  static String accessibility = "${basePath}accessibility.png";
  static String thumbsUp = "${basePath}thumbs-up.png";
  static String cough = "${basePath}cough.png";
  static String ill = "${basePath}ill.png";
  static String checkBlue = "${basePath}check_blue.png";
  static String locationBold = "${basePath}location_bold.png";
  static String locationLightBlue = "${basePath}location_light_blue.png";
  static String naira = "${basePath}naira.png";
  static String send = "${basePath}send.png";
  static String smile = "${basePath}smile.png";
  static String fileText = "${basePath}file-text.png";
  static String activity = "${basePath}activity.png";
  static String logOut = "${basePath}log-out.png";
  static String logIn = "${basePath}log-in.png";
  static String copyWhite = "${basePath}copy.png";
  static String droplet = "${basePath}droplet.png";
  static String meds = "${basePath}medicines.png";
  static String heart = "${basePath}heart.png";
  static String makiDoctor = "${basePath}maki_doctor.png";
  static String share2 = "${basePath}share-2.png";
  static String snoozeTime = "${basePath}snooze_time.png";
  static String tubeVirus = "${basePath}tube_virus.png";
  static String handCoin = "${basePath}hand-coin-outline.png";
  static String thermometer = "${basePath}thermometer.png";
  static String dumbell = "${basePath}dumbell.png";
  static String dollarSignBlue = "${basePath}dollar-sign.png";
  static String videoLight = "${basePath}video_light.png";
  static String trash2 = "${basePath}trash-2.png";
  static String loadingStethoscope = "${basePath}loading_stethoscope.png";
  static String envelope = "${basePath}envelope.png";
  static String globe = "${basePath}globe.png";
  static String plus = "${basePath}plus.png";
  static String cry = "${basePath}cry.png";
}

class SmartpayImagesAssets {
  static const String basePath = "assets/images/";

  static String smartpayLongLogo = "${basePath}smartpay_long_logo.png";
  static String doctorPose = "${basePath}doctor_pose.png";
  static String microscope = "${basePath}microscope.png";
  static String takeDrug = "${basePath}take_drug.png";
  static String femaleDoc = "${basePath}female_doc.png";
  static String femaleDocThinBorder = "${basePath}female_doc_thin_border.png";
  static String toon1 = "${basePath}toon1.png";
  static String toon2 = "${basePath}toon2.png";
  static String toon3 = "${basePath}toon3.png";
  static const String paystack = "${basePath}paystack.png";
  static const String flutterwave = "${basePath}flutterwave.png";
  static const String paypal = "${basePath}paypal.png";
  static String crumbs = "${basePath}crumbs.png";
  static String stethoscope = "${basePath}stethoscope.png";
  static String stethoscopeWider = "${basePath}stethoscope_wider.png";
  static String jarWider = "${basePath}jar_wider.png";
  static String jar = "${basePath}jar.png";
  static String mastercardLogo = "${basePath}mastercard-logo.png";
  static String barChart = "${basePath}bar_chart.png";
  static String lineChart = "${basePath}line_chart.png";
  static String doc1 = "${basePath}doc1.png";
  static String doc2 = "${basePath}doc2.png";
}

class SmartpaySharedPreferences {
  static const String sharePrefHasLoginStatusKey = "hasLoggedInBefore";
  static const String sharePrefDeviceNameKey = "deviceName";
  static const String sharePrefInstanceKey = "instance";
  static const String sharePrefDeviceIdKey = "deviceId";
  static const String sharePrefTokenKey = "authToken";
  static const String sharePrefUserDetailsKey = "userDetails";
  static const String sharePrefClockStatKey = "clockingStat";
  static const String sharePrefLastClockedInDateKey = "lastClockedInDate";
  static const String sharePrefAttIDKey = "attId";
  static const String sharePrefBioKey = "bioIsAvailable";
  static const String sharePrefBioAuthKey = "bioAuth";
  static const String _sharePrefUser = "user";
  // static GlobalKey<NavigatorState> navKey = GlobalKey();



  static Future<UserDetailModel?> getUserInfo({bool showWarning = true}) async {

    SharedPreferences prefs = await SharedPreferences.getInstance();

    String? encodedSignedUpUser = prefs.getString(_sharePrefUser );

    if (encodedSignedUpUser == null){ 
      
      if(showWarning){ Common.smartpayToast("Failed to get user information"); } 
      
      return null; 
      
    };

    return UserDetailModel.fromJson( jsonDecode(  encodedSignedUpUser  ) );

  }

  static Future<bool> putUserInfo(UserDetailModel userDetailModel) async {

    SharedPreferences prefs = await SharedPreferences.getInstance();

    return await prefs.setString(_sharePrefUser, jsonEncode( userDetailModel.toJson() ) );

  }

  static Future<bool> clearUserInfo() async {

    SharedPreferences prefs = await SharedPreferences.getInstance();

    return await prefs.remove(_sharePrefUser);

  }


  static void setDeviceName(String deviceName) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(sharePrefDeviceNameKey, deviceName);
  }

  static Future<void> setConfigured(bool configured) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool(sharePrefHasLoginStatusKey, configured);
  }

  static Future<bool> getHasConfigured() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.containsKey(sharePrefHasLoginStatusKey)
        ? prefs.getBool(sharePrefHasLoginStatusKey) ?? false
        : false;
  }

  static void setAttID(String attId) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(sharePrefAttIDKey, attId);
  }

  static Future<String?> getAttID() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.containsKey(sharePrefAttIDKey)
        ? prefs.getString(sharePrefAttIDKey) ?? null
        : null;
  }

  static Future<void> setClockIn(bool clockIn) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool(sharePrefClockStatKey, clockIn);
  }

  static Future<bool> getClockIn() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.containsKey(sharePrefClockStatKey)
        ? prefs.getBool(sharePrefClockStatKey) ?? false
        : false;
  }
}

class SmartpayTextStrings {

  static const String empty = "";

  static const String welcomeToSmartpayWelcomeScreen = "Welcome to Smartpay";

  static String welcomeToSmartpayBodyWelcomeScreen = "Easily find doctors, schedule virtual consultations, order lab tests, and medications, all from the comfort of your own home.";

  static const String login = "Log in";

  static const String signUp = "Sign Up";

  static const String loginTitle = "Login to your Account";

  static const String verifyTitle = "Verify Your Account";

  static const String signUpTitle = "Sign up to get started.";

  static const String emailInputLabel = "Email address";

  static const String newPasswordInputLabel = "New Password";

  static const String confirmPasswordInputLabel = "Confirm Password";

  static const String phoneNumInputLabel = "Phone Number";

  static const String fullname = "Full Name";

  static const String firstname = "First Name";

  static const String lastname = "Last Name";

  static const String passwordInputLabel = "Password";

  static const String forgotPasswordQuestion = "Forgot Password?";

  static const String noAccount = "Don’t have an account?";

  static const String haveAccount = "Already have an account?";

  static const String rememberNow = "Remember Now?";

  static const String fieldEmpty = "Field must not be empty";

  static const String didNotGetVerifCode = "Didn’t get verification code? Resend code in ";

  static const String sentCodeTo = "Enter the 6 digit verification code sent to ";

  static const String verifyAccnt = "Verify Account";

  static const String welcome = "Welcome, ";

  static const String likeToDo = "What will you like to do today?";

  static const String findASpecDoctors = "Find a Specialist Doctor";

  static const String consultTopSpec = "Consult with top Specialists";

  static const String doctorNow = "Doctor Now";
  
  static const String findDoctors = "Find Doctors";

  static const String connectToADocImmediately = "Connect to a doctor immediately";

  static const String bookLabTests = "Book Lab Tests";

  static const String orderMeds = "Order Medecines";

  static const String connectDocNow = "Connect with a doctor now";

  static const String orderLabTest = "Order a lab test today";

  static const String buyTrackPres = "Buy & Track prescriptions";

  static const String upcomingAppoint = "Upcoming Appointments";

  static const String home = "Home";

  static const String chats = "Chats";

  static const String appointments = "Appointments";

  static const String appointmentDetails = "Appointment Details";

  static const String profile = "Profile";

  static const String viewAll = "View All";

  static const String viewMore = "View More";

  static const String genPhysician = "General Physician";

  static const String about = "About";

  static const String addAName = "Add A Name";

  static const String type = "Type";

  static const String unit = "Unit";

  static const String reading = "Reading";

  static const String date = "Date";

  static const String addNotesOrComments = "Add Notes or Comments";

  static const String nairaSymbol = "₦";

  static const String availability = "Availability";

  static const String viewMoreAvail = "View more availability";

  static const String consultFee = "Consultation Fee";

  static const String videoConsulting = "Video Consulting";

  static const String videoConsult = "Video Consult";

  static const String messaging = "Messaging";

  static const String audioConsult = "Audio Consult";

  static const String inClinicVisit = "In-Clinic Visit";

  static const String homeVisit = "Home Visit";

  static const String visitPartnerLabs = "Visit Partner Labs";

  static const String getDirects = "Get direction";

  static const String bookAppoint = "Book Appointment";

  static const String next = "Next";

  static const String selConsultType = "Select Consultation type";

  static const String selLabs = "Select Labs";

  static const String whatYouExperiencing = "What are you experiencing?";

  static const String selDateTime = "Select a date and time";

  static const String revDetailsAndPay = "Review details and pay";

  static const String total = "Total";

  static const String consultType = "Consultation Type";

  static const String symptoms = "Symptoms";

  static const String langPref = "Language Preferences";

  static const String yourSymptoms = "Your Symptoms";

  static const String dateTime = "Date & Time";

  static const String paymentMethod = "Payment Method";

  static const String pay = "Pay";

  static const String howWantPay = "Choose how you want to pay";

  static const String chosePaymentMethod = "Choose Payment Method";

  static const String save = "Save";

  static const String saveChanges = "Save Changes";

  static const String continueWord = "Continue";

  static const String payFromWallet = "Pay from wallet";

  static const String goToHome = "Go to home";

  static const String viewAppointment = "View Appointment";

  static const String trackOrderStatus = "Track Order tatus";

  static const String paymentSuccessful = "Payment Successful!";

  static const String sayMoreAboutSelf = "Say more about how you feel";

  static const String searchForTests = "Search for tests";

  static const String addToCart = "Add to Cart";

  static const String enterPersonalDetails = "Enter your Personal Details";

  static const String reportGenWithName = "Report will be generated with this name";

  static const String enterLocation = "Enter your Location";

  static const String yourLocation = "Your Location";

  static const String searchForDrugs = "Search for drugs";

  static const String acknowledgeOrder = "I acknowledge that someone will be available to receive my order";

  static const String myChats = "My Chats";

  static const String myAppointments = "My Appointments";

  static const String myProfile = "My Profile";

  static const String upcoming = "Upcoming";

  static const String completed = "Completed";

  static const String rescheduleAppointment = "Reschedule Appointment";

  static const String reasonForReschedule = "Reason for Reschedule";

  static const String sayMoreYouNeedReschedule = "Say more about why you need to reshedule";

  static const String bookAgain = "Book Again";

  static const String leaveAReview = "Leave a Review";

  static const String submit = "Submit";

  static const String cancel = "Cancel";

  static const String howWasExperienceWith = "How was your experience with";

  static const String writeAReview = "Write a review";

  static const String writeYourReview = "Write your review";

  static const String editProfile = "Edit Profile";

  static const String billings = "Billings";

  static const String testRecords = "Test Records";

  static const String fundYourWallet = "Fund Your Wallet";

  static const String selfTracker = "Self Tracker";

  static const String referrals = "Referrals";

  static const String recover = "Recover";

  static const String referralCode = "Referral Code";

  static const String shareInviteLink = "Share invite link";

  static const String referralHist = "Referral History";

  static const String logout = "Logout";

  static const String changePhoto = "Change Photo";

  static const String dateOfBirth = "Date of Birth";

  static const String gender = "Gender";

  static const String bloodGroup = "Blood Group";

  static const String genotype = "Genotype";

  static const String height = "Height";

  static const String weight = "Weight";

  static const String fullnameNextOfKin = "Full Name of Next of Kin";

  static const String phoneNextOfKin = "Phone Number of Next of Kin";

  static const String contactAddress = "Contact Address";

  static const String searchForMssgs = "Search for message";

  static const String search = "Search";

  static const String howToEarn = "How to Earn";

  static const String topUp = "Top Up";

  static const String upgradePlan = "Upgrade Plan";

  static const String yourWallet = "Your Wallet";

  static const String accntBalance = "Account Balance";

  static const String edit = "Edit";

  static const String remove = "Remove";

  static const String paymentHist = "Payment History";

  static const String trackHealthWellnessGoals = "Track your health and wellness goals";

  static const String addNew = "Add New";

  static const String updateTrack = "Update Track";

  static const String bloodPressure = "Blood Pressure";

  static const String bloodSugar = "Blood Sugar";

  static const String sleep = "Sleep";

  static const String waterIntake = "Water Intake";

  static const String bodyTemp = "Body Temperature";

  static const String selALab = "Select a lab";

  static const String setUpYrProfile = "Set up your profile";

  static const String forgotPassword = "Forgot Password";

  static const String letGetKnowYou = "Let's get to know you!";

  static const String enterEmailAssocAcct = "Enter the email associated with your account";

  static const String enterANewPassword = "Enter a new password";

  static const String resetPassword = "Reset Password";

  static const String skip = "Skip";

  static const String changePlanTitle = "Change Plan";

  static const String successAccountCreationMessage = "You have successfully created an account on Smartpay";

  static const String bookNow = "Book Now";

  static const String medicsIdNum = "Medics ID Number";

  static const String contToCheckout = "Continue to Checkout";

  static const String yourCart = "Your Cart";

  static const String meds = "Medicines";

  static const String labTests = "Lab Tests";

  static const String patients = "Patients";

  static const String patientStories = "Patient Stories";

  static const String experience = "Experience";

  static const String others = "Others";

  static const String cartEmpty = "Cart is empty";

  static const String choosePlan = "Choose Plan";

  // static const String home = "Home";

  // static const String home = "Home";

  // static const String home = "Home";

  // static const String home = "Home";

  // static const String home = "Home";

  // static const String home = "Home";

  // static const String home = "Home";
}