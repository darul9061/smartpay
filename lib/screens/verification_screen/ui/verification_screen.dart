import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smartpay/components/appbar.dart';
import 'package:smartpay/components/buttons.dart';
import 'package:smartpay/components/card.dart';
import 'package:smartpay/screens/login_screen/ui/login_screen.dart';
import 'package:smartpay/screens/verification_screen/logic/verification_screen_bloc.dart';
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

          context.read<VerificationScreenBLoc>().add(ResendVerificationEvent(email: email));

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

      appBar: SmartpayAppbars.plain( context, leadingWidget: Image.asset( SmartpayImagesAssets.smartpayLongLogo ), isTransparent: true ),

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
                      
                  padding: const EdgeInsets.only( top: 26, bottom: 22 ),
                  
                  child: Text(

                    SmartpayTextStrings.verifyTitle,

                    style: context.textSize.titleLarge?.copyWith(

                      fontWeight: FontWeight.bold,

                      color: SmartpayColors.smartpayBlack

                    ),

                  )
                ),

                SmartpayCard.simpleCard(

                  context,

                  topMargin: 0,

                  bottomMargin: 0,
                  
                  child: Form(

                    key: formKey,

                    child: Column(

                      crossAxisAlignment: CrossAxisAlignment.stretch,

                      children: [

                        Padding(
                          
                          padding: EdgeInsets.fromLTRB(0, 12, 0, 35),

                          child: Text(

                            "${SmartpayTextStrings.sentCodeTo} $email",

                            textAlign: TextAlign.center,

                            style: context.textSize.bodyMedium?.copyWith(

                              color: SmartpayColors.smartpayGray

                            ),

                          )

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

                          textStyle: Theme.of(context)
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

                              borderSide:
                                  BorderSide(width: 1.0, color: Colors.white),

                              
                              borderRadius: BorderRadius.circular(10)

                            ),

                            focusedBorder: OutlineInputBorder(

                              borderSide:
                                  BorderSide(width: 1.0, color: SmartpayColors.smartpayBorderColor2)

                            ),

                            enabledBorder: OutlineInputBorder(

                              borderSide:
                                  BorderSide(width: 1.0, color: SmartpayColors.smartpayBorderColor2),

                              
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

                        BlocListener<VerificationScreenBLoc, VerificationScreenState>(
                          
                          listener: (_, VerificationScreenState state){

                            //for every state change do below
                            setState(() {
                            
                              _timer = startCountDownTImer(email);

                            });

                          },

                          child: Padding(
                            
                            padding: EdgeInsets.fromLTRB(0, 18, 0, 40),

                            child: Text(

                              SmartpayTextStrings.didNotGetVerifCode + fifteenMinCountDownText,

                              textAlign: TextAlign.center,

                              style: context.textSize.bodyMedium?.copyWith(

                                color: SmartpayColors.smartpayGray

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

                                print("verification Event");

                                context.read<VerificationScreenBLoc>().add(
                                  
                                  VerificationScreenTapEvent(
                                    
                                    email: email, 
                                    
                                    token: int.parse( otpEditingController.text )
                                    
                                  )
                                    
                                );

                              }

                            }

                          },
                          
                          title: SmartpayTextStrings.verifyAccnt

                        ),

                        const SizedBox(

                          height: 20,

                        )

                      ],

                    )
                    
                  )

                ),

                Padding(
                  
                  padding: const EdgeInsets.only( top: 12 ),

                  child: Center(
                    
                    child: Row(

                      mainAxisAlignment: MainAxisAlignment.center,

                      children: [

                        Text(

                          SmartpayTextStrings.haveAccount,

                          style: TextStyle(

                            color: SmartpayColors.smartpayGray
                            
                          ),

                        ),

                        TextButton(
                          
                          onPressed: (){

                            Navigator.pushNamed(context, LoginScreen.routeName);

                          }, 
                          
                          child: Text(

                            SmartpayTextStrings.login,

                            style: context.textSize.bodyMedium?.copyWith(

                              fontWeight: FontWeight.w500
                              
                            ),

                          )

                        )

                      ]

                    )


                  ),
                
                ),

              ],

            ),

          ),

        )
      
      ),

    );
  }
}