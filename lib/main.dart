import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:smartpay/components/preloader.dart';
import 'package:smartpay/routes/index.dart';
import 'package:smartpay/screens/splash_screen.dart';
import 'package:smartpay/state_manager/central_bloc.dart';
import 'package:smartpay/utils/common.dart';
import 'package:smartpay/utils/constants.dart';

class MyHttpOverrides extends HttpOverrides{
  @override
  HttpClient createHttpClient(SecurityContext? context){
    return super.createHttpClient(context)
      ..badCertificateCallback = (X509Certificate cert, String host, int port)=> true;
  }
}

void main() {

  WidgetsFlutterBinding.ensureInitialized();

  // HttpOverrides.global = MyHttpOverrides();

  EasyLoading.instance
    ..indicatorWidget = const SmartpayLoaderAnimationBuilder()
    ..displayDuration = const Duration(milliseconds: 2000)
    ..indicatorType = EasyLoadingIndicatorType.pumpingHeart
    ..loadingStyle = EasyLoadingStyle.custom
    ..boxShadow = []
    // ..indicatorSize = 45
    ..radius = 40.0
    ..progressColor = SmartpayColors.smartpaySecondaryColor
    ..backgroundColor = Colors.transparent
    ..indicatorColor = SmartpayColors.smartpaySecondaryColor
    ..textColor = Colors.white
    ..maskColor = Colors.transparent
    ..maskType = EasyLoadingMaskType.black
    ..userInteractions = false
    ..dismissOnTap = false;

  runApp(

    MultiBlocProvider(

      providers: [

        BlocProvider<CentralBLoc>(

          create: (BuildContext context) => CentralBLoc(),

        )

      ],

      child: const SmartpayApp()
      
    )

  );

}

class SmartpayApp extends StatelessWidget {

  const SmartpayApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return MaterialApp(

      title: 'Smartpay',

      navigatorKey: Common.navigatorKey,

      debugShowCheckedModeBanner: false,

      builder: EasyLoading.init(),

      theme: ThemeData(
        
        appBarTheme: AppBarTheme(

          iconTheme: IconThemeData(

            color: SmartpayColors.smartpayPrimaryColor

          ),
          
        ),

        primaryIconTheme: IconThemeData(

          color: SmartpayColors.smartpayPrimaryColor

        ),

        iconTheme: IconThemeData(

          color: SmartpayColors.smartpayPrimaryColor

        ),

        bottomNavigationBarTheme: BottomNavigationBarThemeData(

          backgroundColor: Colors.white,

          elevation: 0,

          selectedIconTheme: IconThemeData(

            color: SmartpayColors.smartpayPrimaryColor

          ),

          unselectedIconTheme: IconThemeData(

            color: SmartpayColors.smartpayGray

          ),

          selectedItemColor: SmartpayColors.smartpayPrimaryColor,

          unselectedItemColor: SmartpayColors.smartpayGray,

          showSelectedLabels: true,

          showUnselectedLabels: true,

          type: BottomNavigationBarType.shifting



        ),

        fontFamily: 'euclid-circular-b',

        textTheme: TextTheme(

          bodySmall: TextStyle(color: SmartpayColors.smartpayPrimaryColor, fontSize: defaultTargetPlatform == TargetPlatform.android ? 10 : null),
          bodyLarge: TextStyle(color: SmartpayColors.smartpayPrimaryColor, fontSize: defaultTargetPlatform == TargetPlatform.android ? 14 : null),
          bodyMedium: TextStyle(color: SmartpayColors.smartpayPrimaryColor, fontSize: defaultTargetPlatform == TargetPlatform.android ? 12 : null),
          labelLarge: TextStyle(color: SmartpayColors.smartpayPrimaryColor),
          labelMedium: TextStyle(color: SmartpayColors.smartpayPrimaryColor),
          labelSmall: TextStyle(color: SmartpayColors.smartpayPrimaryColor),
          titleSmall: TextStyle(color: SmartpayColors.smartpayPrimaryColor, fontSize: defaultTargetPlatform == TargetPlatform.android ? 12 : null),
          titleMedium: TextStyle(color: SmartpayColors.smartpayPrimaryColor, fontSize: defaultTargetPlatform == TargetPlatform.android ? 14 : null),
          titleLarge: TextStyle(color: SmartpayColors.smartpayPrimaryColor, fontSize: defaultTargetPlatform == TargetPlatform.android ? 20 : null),
          displaySmall: TextStyle(color: SmartpayColors.smartpayPrimaryColor, fontSize: defaultTargetPlatform == TargetPlatform.android ? 34 : null),
          displayMedium: TextStyle(color: SmartpayColors.smartpayPrimaryColor, fontSize: defaultTargetPlatform == TargetPlatform.android ? 43 : null),
          displayLarge: TextStyle(color: SmartpayColors.smartpayPrimaryColor, fontSize: defaultTargetPlatform == TargetPlatform.android ? 55 : null),

        ),

        primaryColor: SmartpayColors.smartpayPrimaryColor,

        scaffoldBackgroundColor: SmartpayColors.smartpayBlueishWhite,

        colorScheme: ColorScheme.fromSeed(seedColor: SmartpayColors.smartpaySecondaryColor),

        useMaterial3: true,

      ),

      initialRoute: SplashScreen.routeName,

      routes: SmartpayRoute.allRoutes,

      // This is used when path is not found in [routes]
      // This is used in smartpay for passing urgent arguments through constructors
      onGenerateRoute: SmartpayRoute.onGenerateRoute,

      // home:  BlocProvider( create: (_) =>  SetupProfileScreenBLoc(), child: SetupProfileScreen() ),
      
    );

  }

}