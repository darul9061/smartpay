import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smartpay/components/appbar.dart';
import 'package:smartpay/components/buttons.dart';
import 'package:smartpay/components/card.dart';
import 'package:smartpay/components/phone_num_input.dart';
import 'package:smartpay/components/textinput.dart';
import 'package:smartpay/screens/common_screens/in_app_webview.dart';
import 'package:smartpay/screens/login_screen/ui/login_screen.dart';
import 'package:smartpay/screens/signup_screen/logic/signup_screen_bloc.dart';
import 'package:smartpay/screens/verification_screen/ui/verification_screen.dart';
import 'package:smartpay/utils/common.dart';
import 'package:smartpay/utils/constants.dart';
import 'package:smartpay/utils/http/http_constants.dart';
import 'package:smartpay/utils/media_query.dart';

class SignUpScreen extends StatefulWidget {

  static String routeName = "/signup";

  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();

}

class _SignUpScreenState extends State<SignUpScreen> {

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  TextEditingController emailEditingController = TextEditingController();

  TextEditingController passwordEditingController = TextEditingController();

  TextEditingController firstNameEditingController = TextEditingController();

  TextEditingController lastNameEditingController = TextEditingController();

  TextEditingController phoneEditingController = TextEditingController();

  bool tcChecked = false;

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: SmartpayAppbars.plain( context, leadingWidget: Image.asset( SmartpayImagesAssets.smartpayLongLogo ), isTransparent: true ),

      body: SafeArea(

        child: SingleChildScrollView(

          child: Container(

            padding: const EdgeInsets.symmetric( horizontal: 20 ),

            // height: context.screenHeight,

            width: context.screenWidth,

            child: Column(

              crossAxisAlignment: CrossAxisAlignment.stretch,

              children: [

                Padding(
                  
                  padding: const EdgeInsets.only( top: 26, bottom: 22 ),
                  
                  child: Text(

                    SmartpayTextStrings.signUpTitle,

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
                          
                          controller: firstNameEditingController, 
                          
                          textEntry: SmartpayTextStrings.empty, 
                          
                          labelText: SmartpayTextStrings.firstname
                          
                        ),

                        TextInput(
                          
                          controller: lastNameEditingController, 
                          
                          textEntry: SmartpayTextStrings.empty, 
                          
                          labelText: SmartpayTextStrings.lastname
                          
                        ),

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
                          
                        ),

                        PhoneNumInput(
                          
                          controller: phoneEditingController, 
                          
                          textEntry: SmartpayTextStrings.empty, 
                          
                          labelText: SmartpayTextStrings.phoneNumInputLabel
                          
                        ),



                        Padding(
                          
                          padding: const EdgeInsets.only( top: 18, bottom: 20),

                          child: Row(

                            mainAxisAlignment: MainAxisAlignment.start,

                            children: [

                              Transform.translate(

                                offset: const Offset(-8, 0),

                                child: Checkbox(

                                  tristate: true,

                                  overlayColor: MaterialStateProperty.all(Colors.white),

                                  checkColor: Colors.white,

                                  activeColor: SmartpayColors.smartpaySecondaryColor,

                                  value: tcChecked,

                                  onChanged: (bool? boolValue) {

                                    setState(() {

                                      tcChecked = boolValue ?? false;

                                    });

                                  },

                                  visualDensity: VisualDensity.compact,

                                  shape: RoundedRectangleBorder(

                                    borderRadius: BorderRadius.circular(100),

                                  ),

                                  side: BorderSide(

                                    width: 0.8,

                                    color: SmartpayColors.smartpayBlueDarker
                                      
                                  )
                                    , //HexColor("#D0D5DD")
                                )
                                
                              ),

                              Container(

                                child: Expanded(

                                  child: RichText(
                                    
                                    text: TextSpan(

                                      children: [

                                        TextSpan(

                                          text: "By signing up, you agree to our ",

                                          style: Theme.of(context)
                                            .textTheme
                                            .bodySmall
                                            ?.copyWith(
                                                color: SmartpayColors.smartpayGray)

                                        ),

                                        WidgetSpan(
                                          
                                          child: InkWell(

                                            onTap: () => Navigator.pushNamed(
                                              
                                              context, 


                                              SmartpayInAppWebView.routeName,

                                              arguments: Uri.parse(HttpConstants.protocol + HttpConstants.baseUrl + HttpConstants.terms)
                                              
                                            ),

                                            child: Text(

                                              "Terms of Service",

                                              style: Theme.of(context)
                                                  .textTheme
                                                  .bodySmall
                                                  ?.copyWith(
                                                      color: SmartpayColors.smartpayGray,
                                                      decoration: TextDecoration.underline,
                                                      decorationColor: SmartpayColors.smartpayGray
                                                    ),

                                            ),
                                            
                                          )
                                          
                                        ),


                                        TextSpan(

                                          text: " and ",

                                          style: Theme.of(context)
                                            .textTheme
                                            .bodySmall
                                            ?.copyWith(
                                                color: SmartpayColors.smartpayGray)

                                        ),


                                        WidgetSpan(
                                          
                                          child: InkWell(

                                            onTap: () => Navigator.pushNamed(
                                              
                                              context, 


                                              SmartpayInAppWebView.routeName,

                                              arguments: Uri.parse(HttpConstants.protocol + HttpConstants.baseUrl + HttpConstants.policy)
                                              
                                            ),

                                            child: Text(

                                              "Privacy Policy.",

                                              style: Theme.of(context)
                                                  .textTheme
                                                  .bodySmall
                                                  ?.copyWith(
                                                      color: SmartpayColors.smartpayGray,
                                                      decoration: TextDecoration.underline,
                                                      decorationColor: SmartpayColors.smartpayGray
                                                    ),

                                            ),
                                            
                                          )
                                          
                                        )

                                      ]

                                    ),
                                    
                                  )

                                  // child: InkWell(

                                  //   onTap: () => Navigator.pushNamed(
                                      
                                  //     context, 


                                  //     SmartpayInAppWebView.routeName,

                                  //     arguments: Uri.parse(HttpConstants.protocol + HttpConstants.baseUrl + HttpConstants.terms)
                                      
                                  //   ),

                                  //   child: Text(

                                  //     "By signing up, you agree to our Terms of Service and Privacy Policy.",

                                  //     style: Theme.of(context)
                                  //         .textTheme
                                  //         .bodySmall
                                  //         ?.copyWith(
                                  //             color: SmartpayColors.smartpayGray),

                                  //   ),
                                    
                                  // )
                                    
                                )
                                
                              ),

                            ],

                          ),

                        ),

                        SmartpayButtons.plain(

                          () {

                            if( (formKey.currentState?.validate() ?? false) && phoneEditingController.text.isNotEmpty){

                              formKey.currentState?.save();

                              FocusManager.instance.primaryFocus?.unfocus();

                              if(!tcChecked){ Common.smartpayToast("Accept Terms of Service"); return ;}

                              context.read<SignUpScreenBLoc>().add(

                                SignUpScreenTapEvent(
                                
                                  firstname: firstNameEditingController.text, 
                                  
                                  lastname: lastNameEditingController.text, 
                                  
                                  email: emailEditingController.text, 
                                  
                                  password: passwordEditingController.text,

                                  phoneNumber: phoneEditingController.text
                                  
                                )

                              );

                            }

                          },
                          
                          title: SmartpayTextStrings.signUp

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