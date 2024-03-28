import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smartpay/models/response_models/practitioner_detail_res_model.dart';
import 'package:smartpay/screens/common_screens/in_app_webview.dart';
import 'package:smartpay/screens/forgot_password_screen/logic/forgot_password_screen_bloc.dart';
import 'package:smartpay/screens/forgot_password_screen/ui/forgot_password_new_password_screen.dart';
import 'package:smartpay/screens/forgot_password_screen/ui/forgot_password_screen.dart';
import 'package:smartpay/screens/login_screen/logic/login_screen_bloc.dart';
import 'package:smartpay/screens/login_screen/ui/login_screen.dart';
import 'package:smartpay/screens/root_access_screens/root_access_screen.dart';
import 'package:smartpay/screens/setup_profile_screen/logic/setup_profile_screen_bloc.dart';
import 'package:smartpay/screens/setup_profile_screen/ui/setup_profile_screen.dart';
import 'package:smartpay/screens/signup_screen/logic/signup_screen_bloc.dart';
import 'package:smartpay/screens/signup_screen/ui/signup_screen.dart';
import 'package:smartpay/screens/splash_screen.dart';
import 'package:smartpay/screens/verification_screen/logic/verification_screen_bloc.dart';
import 'package:smartpay/screens/verification_screen/ui/verification_screen.dart';
import 'package:smartpay/screens/welcome_screen.dart';
import 'package:smartpay/state_manager/central_bloc.dart';

class SmartpayRoute {

  // shared BLOCs
  // static CentralBLoc centralBLoc = CentralBLoc();
  static ForgotPasswordScreenBLoc _forgotPasswordScreenBLoc = ForgotPasswordScreenBLoc();



  static Route<dynamic> onGenerateRoute(RouteSettings settings){

    debugPrint("${settings.arguments}${settings.name}");

    Map<String, WidgetBuilder> extraRoutes = {

    };

    WidgetBuilder builder = extraRoutes[settings.name]!;

    return MaterialPageRoute(builder: (ctx) => builder(ctx) );

  } 


  

  static Map<String, Widget Function(BuildContext)> allRoutes = {


    // DO NOT TOUCH, VERY IMPORTANT
    // Even though initail route has been set in main
    // This is called before initial route
    "/":(_) => Container(),

    //Root Access Screen
    RootAccessScreen.routeName: (context) => MultiBlocProvider(
                                            
                                              providers: [

                                                // BlocProvider.value( value:  ),

                                              ], 

                                              child: RootAccessScreen()
                                            
                                            ),

    /*
    * AUTH SCREENS 
    */

    //In App Web View Screen
    SmartpayInAppWebView.routeName: (context) =>  SmartpayInAppWebView(),

    //Inital Screen
    SplashScreen.routeName: (context) =>  SplashScreen(),

    //Welcome Screen
    WelcomeScreen.routeName: (context) =>  WelcomeScreen(),

    //Login Screen - Forgot Password Screen
    LoginScreen.routeName: (context) => BlocProvider( create: (_) =>  LoginScreenBLoc(), child: const LoginScreen() ),

    //Login Screen - Forgot Password
    ForgotPasswordScreen.routeName: (context) => BlocProvider.value( value: _forgotPasswordScreenBLoc, child: ForgotPasswordScreen() ), 

    //Login Screen - Forgot Password New screen
    ForgotPasswordNewPasswordScreen.routeName: (context) => BlocProvider.value( value: _forgotPasswordScreenBLoc, child: ForgotPasswordNewPasswordScreen() ),                                   

    //Sign Up Screen
    SignUpScreen.routeName: (context) =>  BlocProvider( create: (_) =>  SignUpScreenBLoc(), child: const SignUpScreen() ),

    //Verification Screen
    VerificationScreen.routeName: (context) =>  BlocProvider( create: (_) =>  VerificationScreenBLoc(), child: VerificationScreen()),

    //Setup Profile Screen
    SetupProfileScreen.routeName: (context) =>  BlocProvider( create: (_) =>  SetupProfileScreenBLoc(), child: SetupProfileScreen() ),


  };


}
