import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:smartpay/models/response_models/error_res_model.dart';
import 'package:smartpay/models/response_models/patient_details_res_models.dart';
import 'package:smartpay/models/user_detail_model.dart';
import 'package:smartpay/screens/welcome_screen.dart';
import 'package:smartpay/utils/common.dart';
import 'package:smartpay/utils/constants.dart';
import 'package:smartpay/utils/http/http_constants.dart';
import 'package:smartpay/utils/http/http_methods.dart';

part 'central_state.dart';
part 'central_events.dart';
part 'central_repo.dart';

class CentralBLoc extends Bloc<CentralBLocEvent, CentralBLocState> {

  CentralBLocRepository repo = CentralBLocRepository();

  CentralBLocState centralBLocState = CentralBLocState();

  CentralBLoc():super(CentralBLocState()){

    on<CentralBLocGetPatientDetailsEvent>(getAllPatientsDetails);

    on<CentralBLocLogoutPatientDetailsEvent>(logoutPatient);

  }

  getAllPatientsDetails(CentralBLocGetPatientDetailsEvent event, Emitter<CentralBLocState> emit) async {

    UserDetailModel userInfo = (await SmartpaySharedPreferences.getUserInfo() )! ;

    var res = await repo.getPatientInfo(userInfo.patientId!, preloader: event.preloader, keepPreloaderLoading: event.keepPreloaderLoading);

    if(res is! PatientDetailsResModel){ return; }

    centralBLocState = CentralBLocState()..patientDetails = res;

    emit(CentralBLocState()..patientDetails = res);

  }

  logoutPatient(CentralBLocLogoutPatientDetailsEvent event, Emitter<CentralBLocState> emit) async {

    await SmartpaySharedPreferences.clearUserInfo();

    Navigator.pushNamed(Common.navigatorKey.currentContext!, WelcomeScreen.routeName);
    
  }

  ErrorResModel? errorResModel;

  // CartScreenState? cartScreenState;


  // THIS IS FOR ROOT ACCESS TAB PAGES
  /* 
  * This is added in initState of RootAccessScreen.
  * This is important so that FindDoctor Successful Payment can redirect
  */
  PageController? pageController ;

  String readableDateTimeFormat (DateTime passedDateTime){

    return "${DateFormat(DateFormat.ABBR_MONTH_WEEKDAY_DAY).format( 

      passedDateTime

    )} at ${DateFormat( DateFormat.HOUR24_MINUTE ).format( 
      
      passedDateTime
      
    )}";

  }

  String readableDateFormat (DateTime passedDateTime){

    return "${DateFormat(DateFormat.ABBR_MONTH_WEEKDAY_DAY).format( 

      passedDateTime

    )}";

  }

  //video, audio, messaging and in_clinic
  String selectConsultationTypeTextAsset(String value){

    switch (value.toLowerCase()) {
      case "video":
        return SmartpayTextStrings.videoConsult;
      case "audio":
        return SmartpayTextStrings.audioConsult;
      case "messaging":
        return SmartpayTextStrings.messaging;
      case "in_clinic":
        return SmartpayTextStrings.inClinicVisit;
      case "home_visit":
        return SmartpayTextStrings.homeVisit;
      case "visit_partner_labs":
        return SmartpayTextStrings.visitPartnerLabs;
      default:
        return "";
    }

  }

  String selectConsultationTypeTextAssetFromIntType(int value){

    switch (value) {
      case 0:
        return SmartpayTextStrings.videoConsult;
      case 1:
        return SmartpayTextStrings.audioConsult;
      case 2:
        return SmartpayTextStrings.messaging;
      case 3:
        return SmartpayTextStrings.inClinicVisit;
      case 4:
        return SmartpayTextStrings.homeVisit;
      case 5:
        return SmartpayTextStrings.visitPartnerLabs;
      default:
        return "";
    }

  }

  String selectConsultationTypeIconAssetFromIntType(int value){

    switch (value) {
      case 0:
        return SmartpayIconsAssets.video;
      case 1:
        return SmartpayIconsAssets.phone;
      case 2:
        return SmartpayIconsAssets.messageCircle;
      case 3:
        return SmartpayIconsAssets.home;
      case 4:
        return SmartpayIconsAssets.home;
      case 5:
        return SmartpayIconsAssets.locationBold;
      default:
        return "";
    }

  }


  String selectConsultationTypeIconAsset(String value){

    switch (value) {

      case SmartpayTextStrings.videoConsult:
        return SmartpayIconsAssets.video2;

      case SmartpayTextStrings.videoConsulting:
        return SmartpayIconsAssets.video2;

      case SmartpayTextStrings.audioConsult:
        return SmartpayIconsAssets.phone;

      case SmartpayTextStrings.messaging:
        return SmartpayIconsAssets.messageCircle;

      case SmartpayTextStrings.inClinicVisit:
        return SmartpayIconsAssets.home;
        
      default:
        return SmartpayIconsAssets.send;
    }

  }


  
}