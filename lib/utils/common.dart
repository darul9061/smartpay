import 'dart:math';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';
import 'package:smartpay/utils/hexcolor.dart';
import 'package:timeago/timeago.dart' as time_ago;

class DayWeek {

  String label;

  DateTime dateTime;

  DayWeek({required this.dateTime, required this.label});

}


class Common {

  static GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();


  static double Hs(double doubleValue, {BuildContext? contxt}) {

    if (contxt != null) {

      var mediaQuery = MediaQuery.of(contxt);

      return mediaQuery.size.height * doubleValue;

    }

    var mediaQuery = MediaQuery.of(navigatorKey.currentContext!);

    return (mediaQuery.size.height) * doubleValue;

  }


  static double Ws(double doubleValue, {BuildContext? contxt}) {

    if (contxt != null) {

      var mediaQuery = MediaQuery.of(contxt);

      return mediaQuery.size.width * doubleValue;

    }

    var mediaQuery = MediaQuery.of(navigatorKey.currentContext!);

    return (mediaQuery.size.width) * doubleValue;

  }

  static smartpayToast(String message, {bool isError = false, Toast toastLength = Toast.LENGTH_LONG}){

    Fluttertoast.showToast(

      msg: message,

      toastLength: toastLength,

      gravity: ToastGravity.BOTTOM,

      timeInSecForIosWeb: 1,

      backgroundColor: isError ? HexColor("#ff0022") : HexColor("#3E4784"),

      textColor: Colors.white,

      fontSize: 16.0

    );
    
  }
  

  static String formatHHMMSS(int seconds) {

    int hours = (seconds / 3600).truncate();
    seconds = (seconds % 3600).truncate();
    int minutes = (seconds / 60).truncate();

    String hoursStr = (hours).toString().padLeft(2, '0');
    String minutesStr = (minutes).toString().padLeft(2, '0');
    String secondsStr = (seconds % 60).toString().padLeft(2, '0');

    if (hours == 0) {
      
      return "$minutesStr:$secondsStr";

    }

    return "$hoursStr:$minutesStr:$secondsStr";

  }
}