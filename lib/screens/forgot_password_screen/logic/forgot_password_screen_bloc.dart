import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:smartpay/components/buttons.dart';
import 'package:smartpay/models/request_models/forgot_password_new_password_req_model.dart';
import 'package:smartpay/models/request_models/reset_password_verify_token_req_model.dart';
import 'package:smartpay/models/user_detail_model.dart';
import 'package:smartpay/screens/common_screens/success_payment_screen.dart';
import 'package:smartpay/screens/forgot_password_screen/logic/forgot_password_screen_repo.dart';
import 'package:smartpay/screens/forgot_password_screen/ui/forgot_password_new_password_screen.dart';
import 'package:smartpay/screens/login_screen/ui/login_screen.dart';
import 'package:smartpay/utils/common.dart';
import 'package:smartpay/utils/constants.dart';
import 'package:smartpay/utils/hexcolor.dart';
import 'package:smartpay/utils/media_query.dart';

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

    Map? res = await forgotPassRepo.sendOtp(event.email);

    if(res is! Map) return;

    TextEditingController otpEditingController = TextEditingController();

    Navigator.push(
      
      Common.navigatorKey.currentContext!, 
      
      MaterialPageRoute(builder: (_) => SuccessPaymentScreen(

          header: "Please check your email",

          headerIcon: CircleAvatar(

            radius: Common.Ws(0.07),

            backgroundColor: SmartpayColors.smartpayLightAsh,

            child: Image.asset(
              
              SmartpayIconsAssets.envelope,

              width: Common.Ws(0.06),

            ),

          ),

          background: Container(),

          child: Column(
                        
            children: [

              Text(
                
                "A link to reset your password has been sent to ${event.email}",

                textAlign: TextAlign.center,
                
                style: Common.navigatorKey.currentContext!.textSize.bodyMedium?.copyWith(

                  color: SmartpayColors.smartpayGray,

                ),

              ),

              const SizedBox(

                height: 15,

              ),
                        
              OtpTextField(
                
                hasCustomInputDecoration: true,

                inputFormatters: [FilteringTextInputFormatter.digitsOnly],

                numberOfFields: 5,

                margin: EdgeInsets.zero,

                fieldWidth: Common.Ws(0.14),

                borderRadius: BorderRadius.circular(5),

                borderWidth: 1,

                mainAxisAlignment: MainAxisAlignment.spaceBetween,

                filled: true,

                handleControllers: (controllers) {},

                textStyle: Theme.of(Common.navigatorKey.currentContext!)
                    .textTheme
                    .headlineSmall
                    ?.copyWith(
                        color: HexColor("#3E4784"),
                        fontWeight: FontWeight.bold),

                decoration: InputDecoration(

                  counterText: "",

                  fillColor: Colors.white,

                  filled: true,

                  border: OutlineInputBorder(

                    borderSide: BorderSide(width: 1.0, color: Colors.white),

                    
                    borderRadius: BorderRadius.circular(10)

                  ),

                  focusedBorder: OutlineInputBorder(

                    borderSide: BorderSide(width: 1.0, color: SmartpayColors.smartpayBorderColor2)

                  ),

                  enabledBorder: OutlineInputBorder(

                    borderSide: BorderSide(width: 1.0, color: SmartpayColors.smartpayBorderColor2),

                    
                    borderRadius: BorderRadius.circular(10)

                  ),

                  contentPadding: EdgeInsets.symmetric(vertical: 16),

                  isCollapsed: true,

                  isDense: true
                
                ),

                borderColor: SmartpayColors.smartpayBorderColor2,
                
                enabledBorderColor: SmartpayColors.smartpayBorderColor2,
                
                keyboardType: TextInputType.number,
                
                onCodeChanged: (value) {
                  
                  print(value);
                  

                  if (value.isEmpty) {
                    
                    otpEditingController.text = "";
                    
                  }
                  
                },
                
                onSubmit: (value) {
                  
                  otpEditingController.text = value;
                  
                },
                
                showFieldAsBox: true,
                
              ),

              const SizedBox(

                height: 25,

              ),

              SmartpayButtons.plain(

                () { 

                  if(otpEditingController.text.length == 5) {
                    
                    add(ForgotPasswordScreenOnTapVerifyEvents( email: event.email, token: int.parse( otpEditingController.text ) ) );

                  }
                  
                },

                title: SmartpayTextStrings.continueWord
                
              ),

              const SizedBox(

                height: 20,

              ),
              
            ]
            
          ),


        )
      
      )
      
    );

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