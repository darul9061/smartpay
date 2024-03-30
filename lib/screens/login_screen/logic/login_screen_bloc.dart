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
import 'package:smartpay/screens/setup_profile_screen/ui/setup_pin_screen.dart';
import 'package:smartpay/screens/signup_screen/ui/verification_screen.dart';
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

    LoginResModel? loginRes = await loginRepo.login(reqData);

    if(loginRes is! LoginResModel) return;

    var u = UserDetailModel(

      fullName: loginRes.data?.user?.fullName,

      username: loginRes.data?.user?.username,

      country: loginRes.data?.user?.country,

      email: loginRes.data?.user?.email,

      id: loginRes.data?.user?.id,

      userToken: loginRes.data?.token

    );

    try {

      bool centralProviderError = await Common.navigatorKey.currentContext!.read<CentralBLoc>().checkPin(
        
        passwordKey: reqData.password!, 
        
        userData: u
        
      );

      if (!centralProviderError) {

        Common.smartpayToast("Incorrect credentials", isError: true);

        return;

      }

      Navigator.pushNamed(Common.navigatorKey.currentContext!, RootAccessScreen.routeName);

    } on StoreUserInfoException {

        Common.navigatorKey.currentContext!.read<CentralBLoc>().setupPinScreenShouldCheckPin = false;
        Navigator.pushNamed(Common.navigatorKey.currentContext!, SetupPinScreen.routeName, arguments: u);

        return;

    }

    // Common.navigatorKey.currentContext!.read<CentralBLoc>().checkPin(passwordKey: passwordKey, userData: userData);

    //Then move to Root Access Screen(Home Screen)
    // Check the ui BlocListener for this functionality
    // Navigator.pushReplacementNamed(Common.navigatorKey.currentContext!, RootAccessScreen.routeName);

  }

}