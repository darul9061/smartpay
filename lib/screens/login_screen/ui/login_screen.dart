import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smartpay/components/appbar.dart';
import 'package:smartpay/components/buttons.dart';
import 'package:smartpay/components/card.dart';
import 'package:smartpay/components/textinput.dart';
import 'package:smartpay/screens/forgot_password_screen/ui/forgot_password_screen.dart';
import 'package:smartpay/screens/login_screen/logic/login_screen_bloc.dart';
import 'package:smartpay/screens/root_access_screens/root_access_screen.dart';
import 'package:smartpay/screens/signup_screen/ui/signup_screen.dart';
import 'package:smartpay/state_manager/central_bloc.dart';
import 'package:smartpay/utils/constants.dart';
import 'package:smartpay/utils/media_query.dart';

class LoginScreen extends StatefulWidget {

  static String routeName = "/login";

  const LoginScreen({Key? key}) : super(key: key);


  @override
  State<LoginScreen> createState() => _LoginScreenState();

}

class _LoginScreenState extends State<LoginScreen> {

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  TextEditingController emailEditingController = TextEditingController();

  TextEditingController passwordEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {

    // emailEditingController.text = "nidrosulte@gufum.com";
    // passwordEditingController.text = "Gamestop2468@";

    return BlocListener<CentralBLoc, CentralBLocState>(

      listenWhen: (previous, current) => current.patientDetails != null,
      
      listener: (context, centralBlocState){

        Navigator.pushReplacementNamed(context, RootAccessScreen.routeName);

      },

      child: Scaffold(

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
                    
                    padding: const EdgeInsets.only( top: 26, bottom: 22 ),
                    
                    child: Text(

                      SmartpayTextStrings.loginTitle,

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

                          TextInput(
                            
                            controller: emailEditingController, 
                            
                            textEntry: SmartpayTextStrings.empty, 
                            
                            labelText: SmartpayTextStrings.emailInputLabel
                            
                          ),

                          TextInput(
                            
                            controller: passwordEditingController, 
                            
                            textEntry: SmartpayTextStrings.empty, 
                            
                            labelText: SmartpayTextStrings.passwordInputLabel,

                            obscureText: true,

                            fromLogin: true,
                            
                          ),

                          InkWell(

                            onTap: () => Navigator.pushNamed(context, ForgotPasswordScreen.routeName),

                            child: Padding(
                              
                              padding: const EdgeInsets.only( top: 18, bottom: 20),

                              child: Text(

                                SmartpayTextStrings.forgotPasswordQuestion,

                                style: context.textSize.bodyMedium?.copyWith(

                                  fontWeight: FontWeight.w600

                                ),
                                
                              )
                            )
                            
                          ),

                          SmartpayButtons.plain(

                            () {

                              if(formKey.currentState?.validate() ?? false){

                                formKey.currentState?.save();

                                FocusManager.instance.primaryFocus?.unfocus();

                                context.read<LoginScreenBLoc>().add(

                                  LoginScreenTapEvent(

                                    email: emailEditingController.text.trim(),

                                    password: passwordEditingController.text.trim()

                                  )
                                  
                                );

                              }

                            },
                            
                            title: SmartpayTextStrings.login

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

                            SmartpayTextStrings.noAccount,

                            style: TextStyle(

                              color: SmartpayColors.smartpayGray
                              
                            ),

                          ),

                          TextButton(
                            
                            onPressed: (){

                              Navigator.pushNamed(context, SignUpScreen.routeName);

                            }, 
                            
                            child: Text(

                              SmartpayTextStrings.signUp,

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
        
        )
    
      )

    );

  }

}