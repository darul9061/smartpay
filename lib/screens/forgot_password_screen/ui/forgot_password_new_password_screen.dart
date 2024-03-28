import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smartpay/components/appbar.dart';
import 'package:smartpay/components/buttons.dart';
import 'package:smartpay/components/card.dart';
import 'package:smartpay/components/textinput.dart';
import 'package:smartpay/screens/forgot_password_screen/logic/forgot_password_screen_bloc.dart';
import 'package:smartpay/screens/login_screen/ui/login_screen.dart';
import 'package:smartpay/utils/constants.dart';
import 'package:smartpay/utils/media_query.dart';

class ForgotPasswordNewPasswordScreen extends StatefulWidget {

  static const String routeName = "/forgotPasswordNewPasswordScreen";

  ForgotPasswordNewPasswordScreen({Key? key}) : super(key: key);

  @override
  State<ForgotPasswordNewPasswordScreen> createState() => _ForgotPasswordNewPasswordScreenState();

}

class _ForgotPasswordNewPasswordScreenState extends State<ForgotPasswordNewPasswordScreen> {

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  TextEditingController newPasswordEditingController = TextEditingController();

  TextEditingController confirmPasswordEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: SmartpayAppbars.plain( context, leadingWidget: Image.asset( SmartpayImagesAssets.smartpayLongLogo ), isTransparent: true ),

      body: SafeArea(

        child: SingleChildScrollView(

          child: Container(

            padding: const EdgeInsets.symmetric( horizontal: 20 ),

            height: context.screenHeight,

            width: context.screenWidth,

            child: Column(

              crossAxisAlignment: CrossAxisAlignment.stretch,

              children: [

                Padding(
                  
                  padding: const EdgeInsets.only( top: 26, bottom: 12 ),
                  
                  child: Text(

                    SmartpayTextStrings.resetPassword,

                    style: context.textSize.titleLarge?.copyWith(

                      fontWeight: FontWeight.bold,

                      color: SmartpayColors.smartpayBlack

                    ),

                  )

                ),

                Padding(
                  
                  padding: const EdgeInsets.only( bottom: 25 ),
                  
                  child: Text(

                    SmartpayTextStrings.enterANewPassword,

                    style: TextStyle(

                      fontSize: 15,

                      color: SmartpayColors.smartpayGray

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

                        TextInput(
                          
                          controller: newPasswordEditingController, 
                          
                          textEntry: SmartpayTextStrings.empty, 
                          
                          labelText: SmartpayTextStrings.newPasswordInputLabel,

                          obscureText: true,
                          
                        ),

                        TextInput(
                          
                          controller: confirmPasswordEditingController, 
                          
                          textEntry: SmartpayTextStrings.empty, 
                          
                          labelText: SmartpayTextStrings.confirmPasswordInputLabel,

                          obscureText: true,

                          fromLogin: true,
                          
                        ),

                        const SizedBox(

                          height: 20,

                        ),

                        SmartpayButtons.plain(

                          () {

                            if(formKey.currentState?.validate() ?? false){

                              formKey.currentState?.save();

                              FocusManager.instance.primaryFocus?.unfocus();

                              context.read<ForgotPasswordScreenBLoc>().add(

                                ForgotPasswordScreenOnTapResetEvents(

                                  newPassword: newPasswordEditingController.text,

                                  confirmPassword: confirmPasswordEditingController.text

                                )
                                
                              );

                            }

                          },
                          
                          title: SmartpayTextStrings.resetPassword

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

                          SmartpayTextStrings.rememberNow,

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