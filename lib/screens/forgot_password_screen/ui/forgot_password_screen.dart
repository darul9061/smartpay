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

class ForgotPasswordScreen extends StatefulWidget {

  static const String routeName = "/forgotPasswordScreen";
  
  ForgotPasswordScreen({Key? key}) : super(key: key);

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
  
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {

  final TextEditingController _emailController  = TextEditingController();
  
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(

      appBar: SmartpayAppbars.plain( context, leadingWidget: Image.asset( SmartpayImagesAssets.smartpayLongLogo ), isTransparent: true ),

      body: SafeArea(

        top: false,

        child: SingleChildScrollView(

          child: Container(

            padding: const EdgeInsets.symmetric( horizontal: 20 ),

            child: Column(

              crossAxisAlignment: CrossAxisAlignment.stretch,

              children: [

                Padding(
                  
                  padding: const EdgeInsets.only( top: 26, bottom: 12 ),
                  
                  child: Text(

                    SmartpayTextStrings.forgotPassword,

                    style: context.textSize.titleLarge?.copyWith(

                      fontWeight: FontWeight.bold,

                      color: SmartpayColors.smartpayBlack

                    ),

                  )

                ),

                Padding(
                  
                  padding: const EdgeInsets.only( bottom: 25 ),
                  
                  child: Text(

                    SmartpayTextStrings.enterEmailAssocAcct,

                    style: TextStyle(

                      fontSize: 15,

                      color: SmartpayColors.smartpayGray

                    ),

                  )

                ),

                SmartpayCard.simpleCard(

                  context,

                  horizontalPadding: 15,

                  verticalPadding: 0,

                  child: Column( 

                    crossAxisAlignment: CrossAxisAlignment.start,

                    mainAxisAlignment: MainAxisAlignment.start,
                  
                    children: [

                      TextInput(
                                
                        controller: _emailController, 
                        
                        textEntry: "", 
                        
                        labelText: SmartpayTextStrings.emailInputLabel
                        
                      ),

                      const SizedBox(

                        height: 25,

                      ),

                      SmartpayButtons.plain(
                        () {

                          if(_emailController.text.isNotEmpty){

                            context.read<ForgotPasswordScreenBLoc>().add(ForgotPasswordScreenOnTapSendOTPEvents(email: _emailController.text));

                          }

                        },

                        title: SmartpayTextStrings.recover
                        
                      ),


                      const SizedBox(

                        height: 15,

                      ),
                      
                    ]
                      
                  ),

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

                  )

                )
                
              ]
              
            )
            
          )
          
        )
        
      ),

    );
    
  }
  
}