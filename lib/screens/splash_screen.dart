import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smartpay/models/user_detail_model.dart';
import 'package:smartpay/screens/root_access_screens/root_access_screen.dart';
import 'package:smartpay/screens/welcome_screen.dart';
import 'package:smartpay/state_manager/central_bloc.dart';
import 'package:smartpay/utils/common.dart';
import 'package:smartpay/utils/constants.dart';

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

      if(userInfo is UserDetailModel){ 
        
        context.read<CentralBLoc>().add(CentralBLocGetPatientDetailsEvent(preloader: false)); 
        
      }

      Future.delayed(const Duration(milliseconds: 4000), () {

        if(userInfo is! UserDetailModel){

          Navigator.pushReplacementNamed(context, WelcomeScreen.routeName);

        }else { 

          context.read<CentralBLoc>().add(CentralBLocGetPatientDetailsEvent());
          
          Navigator.pushReplacementNamed(context, RootAccessScreen.routeName); 
          
        }

      });

    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      body: Container(

        child: Center(child: Image.asset(SmartpayImagesAssets.smartpayLongLogo, width: Common.Ws(0.6)) ),

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