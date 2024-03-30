import 'package:flutter/material.dart';
import 'package:smartpay/components/appbar.dart';
import 'package:smartpay/components/buttons.dart';
import 'package:smartpay/components/textinput.dart';
import 'package:smartpay/screens/forgot_password_screen/ui/forgot_password_new_password_screen.dart';
import 'package:smartpay/utils/common.dart';
import 'package:smartpay/utils/constants.dart';
import 'package:smartpay/utils/hexcolor.dart';
import 'package:smartpay/utils/media_query.dart';

class ForgotPasswordVerifyIdentityScreen extends StatefulWidget {

  static const String routeName = "/forgotPasswordVerifyIdentityScreen";
  
  ForgotPasswordVerifyIdentityScreen({Key? key}) : super(key: key);

  @override
  State<ForgotPasswordVerifyIdentityScreen> createState() => _ForgotPasswordVerifyIdentityScreenState();
  
}

class _ForgotPasswordVerifyIdentityScreenState extends State<ForgotPasswordVerifyIdentityScreen> {

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: SmartpayAppbars.plain( context, isTransparent: true ),

      bottomNavigationBar: Padding(

        padding: MediaQuery.of(context).viewInsets,
        
        child:  Container(

          padding: const EdgeInsets.symmetric( horizontal: 20, vertical: 20),

          child: SmartpayButtons.plain(

            () {

              Navigator.pushNamed(context, ForgotPasswordNewPasswordScreen.routeName);

            },
            
            title: "Continue"

          )

        )

      ),

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

                Row(
                  
                  children: [

                    Image.asset(

                      SmartpayImagesAssets.userIllustration,

                      width: Common.Ws(0.3),

                    )

                  ]
                  
                ),

                Padding(
                  
                  padding: const EdgeInsets.only( top: 16, bottom: 13),
                  
                  child: Text(

                    "Verify your identity",

                    style: context.textSize.titleLarge?.copyWith(

                      fontWeight: FontWeight.bold,

                      fontSize: (context.textSize.titleLarge?.fontSize ?? 0.0) * 1.1,

                      color: SmartpayColors.smartpayBlack

                    ),

                  )

                ),

                Padding(
                  
                  padding: const EdgeInsets.only( bottom: 10 ),
                  
                  child: RichText(

                    textAlign: TextAlign.left,

                    text: TextSpan(

                      text: "Where would you like ",

                      style: context.textSize.titleMedium?.copyWith(

                        color: HexColor("#6B7280"),

                        fontSize: (context.textSize.titleMedium?.fontSize ?? 0.0) + 1.5,

                        fontWeight: FontWeight.w200

                      ),

                      children: [

                        TextSpan(

                          text: "Smartpay",

                          style: context.textSize.titleMedium?.copyWith(

                            color: SmartpayColors.smartpaySecondaryColor,

                            fontSize: (context.textSize.titleMedium?.fontSize ?? 0.0) + 1.5,

                            fontWeight: FontWeight.w800

                          )

                        ),
                        
                        TextSpan(

                          text: " to send your security code?",

                          style: context.textSize.titleMedium?.copyWith(

                            color: HexColor("#6B7280"),

                            fontSize: (context.textSize.titleMedium?.fontSize ?? 0.0) + 1.5,

                            fontWeight: FontWeight.w200

                          )

                        )

                      ]
                        
                    ),

                  )
                  
                ),

                Container(

                  margin: const EdgeInsets.only(top: 20),

                  padding: const EdgeInsets.all(15),

                  decoration: BoxDecoration(

                    color: SmartpayColors.smartpayLighterAsh,

                    borderRadius: BorderRadius.circular(12)

                  ),

                  child: Row(

                    children: [

                      Image.asset(

                        SmartpayIconsAssets.check,

                        width: 20,

                      ),

                      SizedBox(width: 20,),

                      Column(

                        crossAxisAlignment: CrossAxisAlignment.start,

                        children: [

                          Text(

                            "Email",

                            style: context.textSize.titleMedium?.copyWith(

                              color: Colors.black,

                              fontWeight: FontWeight.w800

                            ),

                          ),

                          Text(

                            "A*******@mail.com",

                            style: context.textSize.bodyMedium?.copyWith(

                              color: Colors.black,

                              fontWeight: FontWeight.w300

                            ),

                          )

                        ],

                      ),

                      const Spacer(),

                      const Icon(

                        Icons.mail_outline_rounded

                      )

                    ],

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