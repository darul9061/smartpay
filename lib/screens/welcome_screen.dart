import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:smartpay/components/buttons.dart';
import 'package:smartpay/screens/login_screen/ui/login_screen.dart';
import 'package:smartpay/screens/signup_screen/ui/signup_screen.dart';
import 'package:smartpay/utils/common.dart';
import 'package:smartpay/utils/constants.dart';
import 'package:smartpay/utils/media_query.dart';

class WelcomeScreen extends StatefulWidget {

  static String routeName = "/welcome";

  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();

}

class _WelcomeScreenState extends State<WelcomeScreen> {

  @override
  Widget build(BuildContext context) {

    return WillPopScope(
      
      onWillPop: () => Future(() => false),
      
      child: Scaffold(

        backgroundColor: SmartpayColors.smartpayPrimaryColor,

        body: SafeArea(

          child: SingleChildScrollView(

            child: Container(

              padding: EdgeInsets.zero,

              // color: Colors.white,

              child: Column(
                
                children: [

                  //Top Images Section
                  Container(

                    height: defaultTargetPlatform == TargetPlatform.android? Common.Ws(1.1) : Common.Ws(1.1),

                    width: context.screenWidth,

                    padding: EdgeInsets.fromLTRB(
                      
                      defaultTargetPlatform == TargetPlatform.android? Common.Ws(0.03) : Common.Ws(0.03), 
                      
                      0,//Common.Hs(0.05), 
                      
                      defaultTargetPlatform == TargetPlatform.android? Common.Ws(0.03) : Common.Ws(0.03),
                      
                      0, //Common.Hs(0.01)
                      
                    ),

                    margin: const EdgeInsets.only( bottom: 20, top: 50 ),

                    // color: Colors.red,

                    child: Stack(

                      children: [

                        Column(

                          mainAxisAlignment: MainAxisAlignment.spaceBetween,

                          children: [

                            Image.asset(SmartpayImagesAssets.doctorPose, width: defaultTargetPlatform == TargetPlatform.android? Common.Ws(0.5) : Common.Ws(0.5) ),

                            Image.asset(SmartpayImagesAssets.takeDrug, width: defaultTargetPlatform == TargetPlatform.android? Common.Ws(0.5) : Common.Ws(0.5) )
                          ],

                        ),

                        Align(

                          alignment: Alignment.centerRight,

                          child: Image.asset(SmartpayImagesAssets.microscope, width: defaultTargetPlatform == TargetPlatform.android? Common.Ws(0.5) : Common.Ws(0.5) ),

                        )

                      ],

                    )

                  ),

                  //Login and Signup Buttons
                  Padding(

                    padding: const EdgeInsets.symmetric( horizontal: 20 ),

                    child: Column(

                      children: [

                        const SizedBox(

                          height: 5,

                        ),

                        Text(

                          SmartpayTextStrings.welcomeToSmartpayWelcomeScreen,

                          style: Theme.of( context ).textTheme.titleLarge?.copyWith(

                            color: Colors.white,

                            fontWeight: FontWeight.bold,

                            fontSize: Common.Ws(0.06)

                          ),

                        ),

                        const SizedBox(

                          height: 18,

                        ),

                        Container(

                          // color: Colors.red,

                          width: defaultTargetPlatform == TargetPlatform.android? Common.Ws(9) : Common.Ws(0.8),

                          child: Text(

                            SmartpayTextStrings.welcomeToSmartpayBodyWelcomeScreen,

                            textAlign: TextAlign.center,

                            style: context.textSize.bodyMedium?.copyWith(

                              fontSize: 13,

                              color: Colors.white,

                            ),

                          ),

                        ),

                        const SizedBox(

                          height: 20,

                        ),

                        SmartpayButtons.plain(

                          () {

                            Navigator.pushNamed(context, SignUpScreen.routeName);

                          }, 
                          
                          title: SmartpayTextStrings.signUp, 
                          
                          fillColor: SmartpayColors.smartpaySecondaryColor, 
                          
                          titleColor: SmartpayColors.smartpayBlueDarker
                          
                        ),

                        const SizedBox(

                          height: 20,

                        ),

                        SmartpayButtons.skeleton(

                          () {

                            Navigator.pushNamed(context, LoginScreen.routeName);

                          }, 
                          
                          title: SmartpayTextStrings.login, 
                          
                          borderColor: SmartpayColors.smartpayBlueishWhite, 
                          
                          titleColor: SmartpayColors.smartpayBlueishWhite
                          
                        ),

                        const SizedBox(

                          height: 40,

                        ),

                      ],
                      
                    )

                  )

                ]

              )

            ),

          )

        )

      )

    );

  }
  
}
