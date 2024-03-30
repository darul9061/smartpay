import 'package:flutter/material.dart';
import 'package:smartpay/components/appbar.dart';
import 'package:smartpay/components/buttons.dart';
import 'package:smartpay/components/textinput.dart';
import 'package:smartpay/screens/forgot_password_screen/ui/forgot_password_verify_identity_screen.dart';
import 'package:smartpay/utils/common.dart';
import 'package:smartpay/utils/constants.dart';
import 'package:smartpay/utils/hexcolor.dart';
import 'package:smartpay/utils/media_query.dart';

class ForgotPasswordScreen extends StatefulWidget {

  static const String routeName = "/forgotPasswordScreen";
  
  ForgotPasswordScreen({Key? key}) : super(key: key);

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
  
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  TextEditingController emailEditingController = TextEditingController();

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

              if( (formKey.currentState?.validate() ?? false) ){

                formKey.currentState?.save();

                FocusManager.instance.primaryFocus?.unfocus();

                Navigator.pushNamed(context, ForgotPasswordVerifyIdentityScreen.routeName);

              }

            },
            
            title: "Send me email"

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

                      SmartpayImagesAssets.lockIllustration,

                      width: Common.Ws(0.3),

                    )

                  ]
                  
                ),

                Padding(
                  
                  padding: const EdgeInsets.only( top: 16, bottom: 13),
                  
                  child: Text(

                    "Password Recovery",

                    style: context.textSize.titleLarge?.copyWith(

                      fontWeight: FontWeight.bold,

                      fontSize: (context.textSize.titleLarge?.fontSize ?? 0.0) * 1.1,

                      color: SmartpayColors.smartpayBlack

                    ),

                  )

                ),

                Padding(
                  
                  padding: const EdgeInsets.only( bottom: 10 ),
                  
                  child: Text(

                    "Enter your registered email below to receive password instructions",

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

                      TextInput(
                        
                        controller: emailEditingController, 
                        
                        textEntry: SmartpayTextStrings.emailInputLabel
                        
                      ),

                      const SizedBox(

                        height: 20,

                      )

                    ],

                  )
                  
                ),

              ],

            )

          ),

        )
      
      ),

    );

  }
  
}