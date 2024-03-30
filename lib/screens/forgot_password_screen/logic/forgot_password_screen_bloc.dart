import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smartpay/models/request_models/forgot_password_new_password_req_model.dart';
import 'package:smartpay/models/request_models/reset_password_verify_token_req_model.dart';
import 'package:smartpay/screens/forgot_password_screen/logic/forgot_password_screen_repo.dart';
import 'package:smartpay/screens/forgot_password_screen/ui/forgot_password_new_password_screen.dart';
import 'package:smartpay/screens/login_screen/ui/login_screen.dart';
import 'package:smartpay/utils/common.dart';

part 'forgot_password_screen_events.dart';
part 'forgot_password_screen_state.dart';



class ForgotPasswordScreenBLoc extends Bloc<ForgotPasswordScreenEvents, ForgotPasswordScreenState> {

  ForgotPasswordScreenRepository forgotPassRepo = ForgotPasswordScreenRepository();  

  int? _verifiedToken;

  String? _verifiedEmail;

  ForgotPasswordScreenBLoc():super(ForgotPasswordScreenState()){

    on<ForgotPasswordScreenOnTapResetEvents>(newPassword);

    on<ForgotPasswordScreenOnTapVerifyEvents>(verifyToken);

    on<ForgotPasswordScreenOnTapSendOTPEvents>(sendToken);

  }


  void verifyToken(ForgotPasswordScreenOnTapVerifyEvents event, Emitter<ForgotPasswordScreenState> emit) async {

    var reqData = ForgotPasswordVerifyTokenReqModel(email: event.email, token: event.token);

    dynamic signupRes = await forgotPassRepo.verifyToken(reqData);

    if(signupRes is! Map) return;

    // This is important, don't alter
    _verifiedEmail = event.email;
    _verifiedToken = event.token;

    Navigator.pushReplacementNamed(
      
      Common.navigatorKey.currentContext!, 
      
      ForgotPasswordNewPasswordScreen.routeName
      
    );

  }


  void sendToken(ForgotPasswordScreenOnTapSendOTPEvents event, Emitter<ForgotPasswordScreenState> emit) async {

  }


  void newPassword(ForgotPasswordScreenOnTapResetEvents event, Emitter<ForgotPasswordScreenState> emit) async {

    if(event.confirmPassword != event.newPassword){

      Common.smartpayToast("Different passwords", isError: true); 

      return;

    }

    var reqData = ForgotPasswordNewPasswordReqModel(

      email: _verifiedEmail!,
      
      reNewPassword: event.confirmPassword,

      token: _verifiedToken!,

      newPassword: event.newPassword
      
    );

    dynamic res = await forgotPassRepo.newPassword(reqData);

    if(res is! Map) return;

    Navigator.popUntil(Common.navigatorKey.currentContext!, (routePredicate) => routePredicate.settings.name ==  LoginScreen.routeName);

  }

}