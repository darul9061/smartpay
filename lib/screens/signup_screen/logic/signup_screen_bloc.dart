import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smartpay/models/request_models/email_verif_req_model.dart';
import 'package:smartpay/models/request_models/setup_profile_req_model.dart';
import 'package:smartpay/models/response_models/email_verification_res_model.dart';
import 'package:smartpay/models/response_models/get_email_verif_token_res_model.dart';
import 'package:smartpay/models/response_models/signup_res_model.dart';
import 'package:smartpay/screens/setup_profile_screen/ui/setup_profile_screen.dart';
import 'package:smartpay/screens/signup_screen/logic/signup_screen_repo.dart';
import 'package:smartpay/screens/signup_screen/ui/verification_screen.dart';
import 'package:smartpay/utils/common.dart';

part 'signup_screen_state.dart';
part 'signup_screen_events.dart';

class SignUpScreenBLoc extends Bloc<SignUpScreenEvent, SignUpScreenState>{

  SignUpScreenRepository signupRepo = SignUpScreenRepository();

  SignUpScreenBLoc():super(SignUpScreenState()){

    on<SignUpGetEmailVerifTokenEvent>(getEmailVerifyToken);

    on<SignUpEmailVerificationEvent>(verifyEmail);

  }

  Future<void> verifyEmail(SignUpEmailVerificationEvent event, Emitter<SignUpScreenState> emit) async {

    EmailVerificationResModel? signupRes = await signupRepo.verifyEmail(

      EmailVerificationReqModel( email: event.email, token: event.token )

    );

    if(signupRes is! EmailVerificationResModel) return;

    Navigator.pushReplacementNamed( Common.navigatorKey.currentContext!, SetupProfileScreen.routeName, arguments: signupRes.data!.email! );

  }

  Future<void> getEmailVerifyToken(SignUpGetEmailVerifTokenEvent event, Emitter<SignUpScreenState> emit) async {

    GetEmailVerifTokenResModel? signupRes = await signupRepo.getEmailVerifToken(event.email);

    if(signupRes is! GetEmailVerifTokenResModel) return;

    emit(state..gottenVerifToken = signupRes.data?.token ?? "");

    Navigator.pushReplacementNamed(Common.navigatorKey.currentContext!, VerificationScreen.routeName, arguments: event.email);

  }

  void resendVerification(SignUpResendVerificationEvent event, Emitter<SignUpScreenState> emit) async {

    GetEmailVerifTokenResModel? _ = await signupRepo.getEmailVerifToken(event.email);
    
    emit(SignUpScreenState());

  }

}