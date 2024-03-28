import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smartpay/models/request_models/signup_req_model.dart';
import 'package:smartpay/models/response_models/resend_verification_res_model.dart';
import 'package:smartpay/models/response_models/signup_res_model.dart';
import 'package:smartpay/screens/signup_screen/logic/signup_screen_repo.dart';
import 'package:smartpay/screens/verification_screen/logic/verification_screen_bloc.dart';
import 'package:smartpay/screens/verification_screen/logic/verification_screen_repo.dart';
import 'package:smartpay/screens/verification_screen/ui/verification_screen.dart';
import 'package:smartpay/utils/common.dart';
import 'package:smartpay/utils/constants.dart';

part 'signup_screen_state.dart';
part 'signup_screen_events.dart';

class SignUpScreenBLoc extends Bloc<SignUpScreenEvent, SignUpScreenState>{

  SignUpScreenRepository signupRepo = SignUpScreenRepository();

  SignUpScreenBLoc():super(SignUpScreenState()){

    on<SignUpScreenTapEvent>(authUser);

  }

  Future<void> authUser(SignUpScreenTapEvent event, Emitter<SignUpScreenState> emit) async {

    var reqData = SignUpReqModel(
      
      firstName: event.firstname, 
      lastName: event.lastname, 
      email: event.email, 
      password: event.password, 
      rePassword: event.password, 
      phoneNumber: event.phoneNumber, 
      userType: 1
      
    );

    SignUpResModel? signupRes = await signupRepo.authUser(reqData);

    if(signupRes is! SignUpResModel) return;

    // ResendVerificationResModel? _ = await VerificationScreenRepository().resendVerificationCode(event.email);

    Navigator.pushReplacementNamed(Common.navigatorKey.currentContext!, VerificationScreen.routeName, arguments: signupRes.email!);

  }

}