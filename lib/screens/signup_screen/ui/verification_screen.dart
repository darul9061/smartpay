import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smartpay/components/appbar.dart';
import 'package:smartpay/components/buttons.dart';
import 'package:smartpay/screens/signup_screen/logic/signup_screen_bloc.dart';
import 'package:smartpay/utils/constants.dart';
import 'package:smartpay/utils/media_query.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';

import '../../../utils/common.dart';
import '../../../utils/hexcolor.dart';

class VerificationScreen extends StatefulWidget {

  static const String routeName = "/verification";

  VerificationScreen({Key? key}) : super(key: key);

  @override
  State<VerificationScreen> createState() => _VerificationScreenState();

}

class _VerificationScreenState extends State<VerificationScreen> {

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  TextEditingController otpEditingController = TextEditingController();

  late Timer _timer;

  String fifteenMinCountDownText = "";

  String email = "";

  bool isVerifCodeComplete = false;



  Timer startCountDownTImer(String email){

    return Timer.periodic(
      
      const Duration( seconds: 1 ), 
      
      (timer) { 

        int fifteenMinInSecondsDeduct = (15 * 60) - timer.tick;

        print(fifteenMinInSecondsDeduct);

        setState(() {

          fifteenMinCountDownText = Common.formatHHMMSS( fifteenMinInSecondsDeduct );

        });

        if(fifteenMinInSecondsDeduct <= 0){

          timer.cancel();

          context.read<SignUpScreenBLoc>().add(SignUpResendVerificationEvent(email: email));

        }

      }
      
    );

  }

  @override
  void initState() {

    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {

      var email = ModalRoute.of(context)!.settings.arguments;

      assert(email is String, "Email is required");

      this.email = email as String;

      _timer = startCountDownTImer(email);
      
    });

  }

  @override
  void dispose() {

    _timer.cancel();

    super.dispose();
    
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: SmartpayAppbars.plain( context, leadingWidget: Image.asset( SmartpayImagesAssets.smartpayLogo ), isTransparent: true ),

      body: SafeArea(

        child: SingleChildScrollView(

          child: Container(

            padding: const EdgeInsets.symmetric( horizontal: 18 ),

            height: context.screenHeight,

            width: context.screenWidth,

            child: Column(

              crossAxisAlignment: CrossAxisAlignment.stretch,

              children: [

                Padding(
                      
                  padding: const EdgeInsets.only( top: 26, bottom: 12 ),
                  
                  child: Text(

                    SmartpayTextStrings.verifyTitle,

                    style: context.textSize.titleLarge?.copyWith(

                      fontWeight: FontWeight.bold,

                      color: SmartpayColors.smartpayBlack

                    ),

                  )

                ),

                Padding(
                  
                  padding: const EdgeInsets.only( bottom: 10 ),
                  
                  child: Text(

                    "We send a code to ( $email ). Enter it here to verify your identity",

                    textAlign: TextAlign.left,

                    style: context.textSize.titleMedium?.copyWith(

                      color: HexColor("#6B7280"),

                      fontSize: (context.textSize.titleMedium?.fontSize ?? 0.0) + 1.5,

                      fontWeight: FontWeight.w200

                    ),

                  )
                  
                ),

                Form(

                  key: formKey,

                  child: Column(

                    crossAxisAlignment: CrossAxisAlignment.stretch,

                    children: [

                      const SizedBox(height: 30),
                      
                      OtpTextField(
                        
                        hasCustomInputDecoration: true,

                        inputFormatters: [FilteringTextInputFormatter.digitsOnly],

                        numberOfFields: 5,

                        margin: EdgeInsets.zero,

                        fieldWidth: Common.Ws(0.14),

                        borderRadius: BorderRadius.circular(5),

                        borderWidth: 1,

                        mainAxisAlignment: MainAxisAlignment.spaceBetween,

                        styles: [

                          context.textSize.titleLarge?.copyWith( color: Colors.black, fontWeight: FontWeight.w700, fontSize: (context.textSize.titleLarge?.fontSize ?? 0) + 1 ),
                          context.textSize.titleLarge?.copyWith( color: Colors.black, fontWeight: FontWeight.w700, fontSize: (context.textSize.titleLarge?.fontSize ?? 0) + 1 ),
                          context.textSize.titleLarge?.copyWith( color: Colors.black, fontWeight: FontWeight.w700, fontSize: (context.textSize.titleLarge?.fontSize ?? 0) + 1 ),
                          context.textSize.titleLarge?.copyWith( color: Colors.black, fontWeight: FontWeight.w700, fontSize: (context.textSize.titleLarge?.fontSize ?? 0) + 1 ),
                          context.textSize.titleLarge?.copyWith( color: Colors.black, fontWeight: FontWeight.w700, fontSize: (context.textSize.titleLarge?.fontSize ?? 0) + 1 ),

                        ],

                        filled: true,

                        handleControllers: (controllers) {},

                        textStyle: Theme.of(context)
                            .textTheme
                            .headlineSmall
                            ?.copyWith(
                                color: HexColor("#3E4784"),
                                fontWeight: FontWeight.bold),

                        decoration: InputDecoration(

                          counterText: "",

                          fillColor: SmartpayColors.smartpayLighterAsh,

                          filled: true,

                          border: OutlineInputBorder(

                            borderSide: const BorderSide(width: 1.0, color: Colors.white),
                            
                            borderRadius: BorderRadius.circular(10)

                          ),

                          focusedBorder: OutlineInputBorder(

                            borderSide: BorderSide.none,
                            
                            borderRadius: BorderRadius.circular(10)

                          ),

                          enabledBorder: OutlineInputBorder(

                            borderSide: BorderSide.none,
                            
                            borderRadius: BorderRadius.circular(10)

                          ),

                          contentPadding: const EdgeInsets.symmetric(vertical: 13),

                          isCollapsed: true,

                          isDense: true
                        
                        ),

                        borderColor: SmartpayColors.smartpayBorderColor2,
                        
                        enabledBorderColor: SmartpayColors.smartpayBorderColor2,
                        
                        keyboardType: TextInputType.number,
                        
                        onCodeChanged: (value) {

                          if (value.isEmpty) {
                            
                            otpEditingController.text = "";
                            
                          }
                          
                        },
                        
                        onSubmit: (value) {
                          
                          otpEditingController.text = value;

                          if(otpEditingController.text.length == 5){

                            // context.currentstate is used because OtpTextField package textfield doesn't bring out validation error message
                            // instead an alternative would have been used if that happended

                            setState(() {

                              isVerifCodeComplete = formKey.currentState?.validate() ?? false;
                              
                            });

                          }
                          
                        },
                        
                        showFieldAsBox: true,
                        
                      ),

                      BlocListener<SignUpScreenBLoc, SignUpScreenState>(
                        
                        listener: (_, SignUpScreenState state){

                          //for every state change do below
                          setState(() {
                          
                            _timer = startCountDownTImer(email);

                          });

                        },

                        child: Padding(
                          
                          padding: const EdgeInsets.fromLTRB(0, 28, 0, 48),

                          child: Text(

                            SmartpayTextStrings.resendCode + fifteenMinCountDownText,

                            textAlign: TextAlign.center,

                            style: context.textSize.titleMedium?.copyWith(

                              color: SmartpayColors.smartpayGray.withAlpha(200),

                              fontWeight: FontWeight.bold

                            ),

                          )

                        )
                        
                      ),

                      SmartpayButtons.plain(

                        () {

                          if(formKey.currentState?.validate() ?? false){

                            formKey.currentState?.save();

                            FocusManager.instance.primaryFocus?.unfocus();

                            if(otpEditingController.text.length == 5){

                              debugPrint("verification Event");

                              context.read<SignUpScreenBLoc>().add(
                                
                                SignUpEmailVerificationEvent(
                                  
                                  email: email, 
                                  
                                  token: int.parse( otpEditingController.text )
                                  
                                )
                                  
                              );

                            }

                          }

                        },
                        
                        title: SmartpayTextStrings.confirm,

                        fillColor: !(isVerifCodeComplete) ? SmartpayColors.smartpayGray : null

                      ),

                      const SizedBox(

                        height: 20,

                      )

                    ],

                  )
                  
                ),

              ],

            ),

          ),

        )
      
      ),

    );
  }
}