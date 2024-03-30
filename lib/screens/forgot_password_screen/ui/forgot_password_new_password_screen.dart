import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smartpay/components/appbar.dart';
import 'package:smartpay/components/buttons.dart';
import 'package:smartpay/components/textinput.dart';
import 'package:smartpay/screens/forgot_password_screen/logic/forgot_password_screen_bloc.dart';
import 'package:smartpay/screens/login_screen/ui/login_screen.dart';
import 'package:smartpay/utils/constants.dart';
import 'package:smartpay/utils/hexcolor.dart';
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

      appBar: SmartpayAppbars.plain( context, leadingWidget: Image.asset( SmartpayImagesAssets.smartpayLogo ), isTransparent: true ),

      bottomNavigationBar: Padding(

        padding: MediaQuery.of(context).viewInsets,
        
        child:  Container(

          padding: const EdgeInsets.symmetric( horizontal: 20, vertical: 20),

          child: SmartpayButtons.plain(

            () {

              if( (formKey.currentState?.validate() ?? false) ){

                formKey.currentState?.save();

                FocusManager.instance.primaryFocus?.unfocus();



              }

            },
            
            title: "Create new password"

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

                Padding(
                  
                  padding: const EdgeInsets.only( top: 26, bottom: 13),
                  
                  child: Text(

                    "Create New Password",

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

                    "Please, enter a new password below different from the previous password",

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
                        
                        controller: newPasswordEditingController, 
                        
                        textEntry: SmartpayTextStrings.newPasswordInputLabel,

                        obscureText: true,
                        
                      ),

                      TextInput(
                        
                        controller: confirmPasswordEditingController, 
                        
                        textEntry: SmartpayTextStrings.confirmPasswordInputLabel,

                        obscureText: true,
                        
                      ),

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