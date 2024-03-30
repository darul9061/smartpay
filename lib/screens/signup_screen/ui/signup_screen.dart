import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smartpay/components/appbar.dart';
import 'package:smartpay/components/buttons.dart';
import 'package:smartpay/components/textinput.dart';
import 'package:smartpay/screens/login_screen/ui/login_screen.dart';
import 'package:smartpay/screens/signup_screen/logic/signup_screen_bloc.dart';
import 'package:smartpay/screens/signup_screen/ui/verification_screen.dart';
import 'package:smartpay/utils/common.dart';
import 'package:smartpay/utils/constants.dart';
import 'package:smartpay/utils/hexcolor.dart';
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

  bool emailTextLengthReady = false;

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: SmartpayAppbars.plain( context, isTransparent: true ),

      body: SafeArea(

        child: SingleChildScrollView(

          child: Container(

            padding: const EdgeInsets.symmetric( horizontal: 20 ),

            // height: context.screenHeight,

            width: context.screenWidth,

            child: Column(

              crossAxisAlignment: CrossAxisAlignment.stretch,

              mainAxisAlignment: MainAxisAlignment.start,

              children: [

                Padding(
                  
                  padding: const EdgeInsets.only( top: 26,),
                  
                  child: RichText(

                    text: TextSpan(

                      text: "Create a ",

                      style: context.textSize.titleLarge?.copyWith(

                        fontWeight: FontWeight.bold,

                        fontSize: (context.textSize.titleLarge?.fontSize ?? 0.0) * 1.1,

                        color: SmartpayColors.smartpayBlack

                      ),

                      children: [

                        TextSpan(

                          text: "Smartpay",

                          style: context.textSize.titleLarge?.copyWith(

                            fontWeight: FontWeight.bold,

                            fontSize: (context.textSize.titleLarge?.fontSize ?? 0.0) * 1.1,

                            color: SmartpayColors.smartpaySecondaryColor

                          ),

                        ),

                      ]

                    ),

                  )

                ),





                Padding(
                  
                  padding: const EdgeInsets.only( bottom: 13),
                  
                  child: 

                  Text(

                    " account",

                    style: context.textSize.titleLarge?.copyWith(

                      fontWeight: FontWeight.bold,

                      fontSize: (context.textSize.titleLarge?.fontSize ?? 0.0) * 1.1,

                      color: SmartpayColors.smartpayBlack

                    ),

                  ),

                ),


                Form(

                  key: formKey,

                  child: Column(

                    crossAxisAlignment: CrossAxisAlignment.stretch,

                    children: [

                      TextInput(
                        
                        controller: emailEditingController,
                        
                        textEntry: SmartpayTextStrings.emailInputLabel,

                        onChanged: (text){

                          if(text.length > 4) { emailTextLengthReady = true; setState(() {}); return; }

                          emailTextLengthReady = false;

                          setState(() {});

                        }
                        
                      ),

                      const SizedBox(height: 15,),

                      SmartpayButtons.plain(

                        () {

                          if( !emailTextLengthReady ) {

                            return;

                          }

                          if( (formKey.currentState?.validate() ?? false) ){

                            formKey.currentState?.save();

                            FocusManager.instance.primaryFocus?.unfocus();

                            context.read<SignUpScreenBLoc>().add(

                              SignUpGetEmailVerifTokenEvent(email: emailEditingController.text)
                              
                            );

                          }

                        },
                        
                        title: SmartpayTextStrings.signUp,

                        fillColor: !(emailTextLengthReady) ? SmartpayColors.smartpayGray : null

                      ),

                      const SizedBox(

                        height: 20,

                      )

                    ],

                  )
                  
                ),


                Padding(

                  padding: const EdgeInsets.symmetric(vertical: 18),

                  child: Stack(

                    children: [

                      Center(

                        child: Divider( thickness: 2, color: HexColor("#F2F4F7") )
                        
                      ),

                      Center(

                        child: Container(

                          padding: const EdgeInsets.symmetric(horizontal: 9),

                          color: Colors.white,

                          child: Text(

                            "OR",

                            style: Theme.of(context)
                                .textTheme
                                .titleMedium
                                ?.copyWith(

                                  color: HexColor("#667085"),

                                ),

                          )
                          
                        )
                        
                      )

                    ],
                  ),
                  //   ],
                  // ),
                ),


                // SSO
                Row(

                  mainAxisAlignment: MainAxisAlignment.spaceBetween,

                  children: [

                    Expanded(

                      child: InkWell(

                        onTap: () => Navigator.pop(context),

                        child: Container(

                          padding: const EdgeInsets.symmetric(vertical: 15),

                          decoration: BoxDecoration(

                            border: Border.all( width: 0.8, color: SmartpayColors.smartpayGray.withOpacity(0.2)),

                            borderRadius: BorderRadius.circular(13)

                          ),

                          child: Center(

                            child: Image.asset(

                              SmartpayImagesAssets.google,

                              width: 25,

                              height: 25,

                            )

                          ),

                        )

                      )

                    ),

                    SizedBox( width: Common.Ws(0.04),),

                    Expanded(

                      child: InkWell(

                        onTap: () => Navigator.pop(context),

                        child: Container(

                          padding: const EdgeInsets.symmetric(vertical: 15),

                          decoration: BoxDecoration(

                            border: Border.all( width: 0.8, color: SmartpayColors.smartpayGray.withOpacity(0.2)),

                            borderRadius: BorderRadius.circular(13)

                          ),

                          child: Center(

                            child: Image.asset(

                              SmartpayImagesAssets.apple,

                              width: 25,

                              height: 25,

                            )

                          ),

                        )

                      )

                    )

                  ],

                ),

                SizedBox(height: Common.Hs(0.1),),

                Padding(
                
                  padding: const EdgeInsets.only( top: 12 ),

                  child: Center(
                    
                    child: Row(

                      mainAxisAlignment: MainAxisAlignment.center,

                      children: [

                        Text(

                          SmartpayTextStrings.haveAccount,

                          style: context.textSize.titleMedium?.copyWith(

                            color: HexColor("#6B7280"),

                            fontSize: (context.textSize.titleMedium?.fontSize ?? 0.0) + 1.5,

                            fontWeight: FontWeight.w200

                          ),

                        ),

                        TextButton(
                          
                          onPressed: (){

                            Navigator.pushNamed(context, LoginScreen.routeName);

                          }, 
                          
                          child: Text(

                            "Sign In",

                            style: context.textSize.titleMedium?.copyWith(

                              color: SmartpayColors.smartpaySecondaryColor,

                              fontSize: (context.textSize.titleMedium?.fontSize ?? 0.0) + 1.5,

                              fontWeight: FontWeight.w700

                            ),

                          )

                        )

                      ]

                    )


                  ),
                
                ),

              ],

            )

          ),

        )
      
      ),

    );

  }
}