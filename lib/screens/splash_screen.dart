import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smartpay/models/user_detail_model.dart';
import 'package:smartpay/screens/root_access_screens/root_access_screen.dart';
import 'package:smartpay/screens/setup_profile_screen/ui/setup_pin_screen.dart';
import 'package:smartpay/screens/welcome_screen/welcome_screen.dart';
import 'package:smartpay/state_manager/central_bloc.dart';
import 'package:smartpay/utils/common.dart';
import 'package:smartpay/utils/constants.dart';
import 'package:smartpay/utils/media_query.dart';

class SplashScreen extends StatefulWidget {

  static String routeName = "/splashscreen";

  SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();

}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {

    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {

      UserDetailModel? userInfo = await SmartpaySharedPreferences.getUserInfo(showWarning: false);

      Future.delayed(const Duration(milliseconds: 4000), () async {

        if(userInfo is! UserDetailModel){

          Navigator.pushReplacementNamed(context, WelcomeScreen.routeName);

        }else {

          context.read<CentralBLoc>().setupPinScreenShouldCheckPin = true;
          
          Navigator.pushReplacementNamed(context, SetupPinScreen.routeName, arguments: userInfo); 
          
        }

      });

    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      body: SizedBox(

        child: Center(
          
          child: Column(

            mainAxisAlignment: MainAxisAlignment.center,
            
            children: [
              
              Image.asset(SmartpayImagesAssets.smartpayLogo, width: Common.Ws(0.2)) ,

              const SizedBox(height: 10),

              RichText(
                
                text: TextSpan(

                  text: "Smart",

                  style: context.textSize.displaySmall?.copyWith(

                    color: SmartpayColors.smartpayPrimaryColor,

                    fontWeight: FontWeight.bold

                  ),

                  children: [

                    TextSpan(

                      text: "pay.",

                      style: context.textSize.displaySmall?.copyWith(

                        color: SmartpayColors.smartpaySecondaryColor,

                        fontWeight: FontWeight.bold

                      ),

                    )

                  ]

                )
                
              ),
              
            ]
              
          ),

        )

      ),

    );

  }

}

// class SplashScreen extends StatelessWidget {
//   const SplashScreen({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Container();
//   }
// }