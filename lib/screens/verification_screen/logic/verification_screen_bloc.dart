import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smartpay/models/request_models/signup_verif_req_model.dart';
import 'package:smartpay/models/response_models/resend_verification_res_model.dart';
import 'package:smartpay/models/response_models/signup_verification_res_model.dart';
import 'package:smartpay/models/user_detail_model.dart';
import 'package:smartpay/screens/setup_profile_screen/ui/setup_profile_screen.dart';
import 'package:smartpay/screens/verification_screen/logic/verification_screen_repo.dart';
import 'package:smartpay/utils/common.dart';
import 'package:smartpay/utils/constants.dart';

part 'verification_screen_state.dart';
part 'verification_screen_events.dart';

class VerificationScreenBLoc extends Bloc<VerificationScreenEvent, VerificationScreenState> {

  VerificationScreenRepository verifRepo = VerificationScreenRepository();  

  VerificationScreenBLoc():super(VerificationScreenState()){

    on<VerificationScreenTapEvent>(verificationTap);

    on<ResendVerificationEvent>(resendVerification);

  }

  void verificationTap(VerificationScreenTapEvent event, Emitter<VerificationScreenState> emit) async {

    var reqData = VerificationScreenReqModel(email: event.email, token: event.token);

    SignUpVerificationResModel? res = await verifRepo.verifyUser(reqData);

    if(res is! SignUpVerificationResModel) return;

    await SmartpaySharedPreferences.putUserInfo(

      UserDetailModel(
        email: res.email,
        userToken: res.accessToken,
        refreshToken: res.refreshToken,
        patientId: res.userTypeId,
        userType: res.userType,
        agoraUserId: res.agoraUserId
      )

    );

    Navigator.pushReplacementNamed(Common.navigatorKey.currentContext!, SetupProfileScreen.routeName);

  }

  void resendVerification(ResendVerificationEvent event, Emitter<VerificationScreenState> emit) async {

    ResendVerificationResModel? resendVerif = await verifRepo.resendVerificationCode(event.email);
    
    emit(VerificationScreenState());

  }
  
}