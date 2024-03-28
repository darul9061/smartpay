import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smartpay/models/request_models/login_req_model.dart';
import 'package:smartpay/models/response_models/error_res_model.dart';
import 'package:smartpay/models/response_models/login_res_model.dart';
import 'package:smartpay/models/response_models/resend_verification_res_model.dart';
import 'package:smartpay/models/user_detail_model.dart';
import 'package:smartpay/screens/login_screen/logic/login_screen_repo.dart';
import 'package:smartpay/screens/root_access_screens/root_access_screen.dart';
import 'package:smartpay/screens/verification_screen/logic/verification_screen_repo.dart';
import 'package:smartpay/screens/verification_screen/ui/verification_screen.dart';
import 'package:smartpay/state_manager/central_bloc.dart';
import 'package:smartpay/utils/common.dart';
import 'package:smartpay/utils/constants.dart';

part 'login_screen_events.dart';
part 'login_screen_state.dart';

class LoginScreenBLoc extends Bloc<LoginScreenEvent, LoginScreenState> {

  var loginRepo = LoginScreenRepository();
  var loginScreenState = LoginScreenState();

  
  LoginScreenBLoc() : super(LoginScreenState()){


    on<LoginScreenTapEvent>(authUser);
    
  }

  Future<void> authUser(LoginScreenTapEvent event, Emitter<LoginScreenState> emit) async {

    var reqData = LoginReqModel(email: event.email, password: event.password);

    LoginResModel? loginRes = await loginRepo.login(reqData, keepPreloaderLoading: true);

    ErrorResModel? centralProvider = Common.navigatorKey.currentContext!.read<CentralBLoc>().errorResModel;

    if( (centralProvider?.detail?.contains("User account not verified.") ?? false)){

      ResendVerificationResModel? _ = await VerificationScreenRepository().resendVerificationCode(event.email);

      Navigator.pushNamed(
        
        Common.navigatorKey.currentContext!, 
        
        VerificationScreen.routeName, arguments: event.email
        
      );

    }

    if(loginRes is! LoginResModel) return;

    await SmartpaySharedPreferences.putUserInfo(

      UserDetailModel(

        firstName: loginRes.firstName,

        lastName: loginRes.lastName,

        phoneNumber: loginRes.phoneNumber,

        email: loginRes.email,

        id: loginRes.id,

        userToken: loginRes.accessToken,

        userType: loginRes.userType,

        patientId: loginRes.userTypeId,

        refreshToken: loginRes.refreshToken,

        agoraUserId: loginRes.agoraUserId

      )

    );

    Common.navigatorKey.currentContext!.read<CentralBLoc>().add(CentralBLocGetPatientDetailsEvent());

    //Then move to Root Access Screen(Home Screen)
    // Check the ui BlocListener for this functionality
    // Navigator.pushReplacementNamed(Common.navigatorKey.currentContext!, RootAccessScreen.routeName);

  }

}