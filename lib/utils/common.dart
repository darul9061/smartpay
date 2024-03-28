import 'dart:async';
import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';
import 'package:smartpay/models/payment_detail_model.dart';
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

  static String generateRandomString(int length){

    String characters = 'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';

    Random rndInt = Random();
    
    String uniqueString = '';
    
    for (int i = 0; i <length; i++){
      uniqueString += characters[rndInt.nextInt(characters.length)];
    }
    
    return (uniqueString);
    
  }

  DateTime _getDateOfWeekDay(String weekday, {DateTime? currentDateTime}) {
    
    var weekdayToNum = {
      'monday': 1,
      'tuesday': 2,
      'wednesday': 3,
      'thursday': 4,
      'friday': 5,
      'saturday': 6,
      'sunday': 7
    };

    final now = currentDateTime ?? DateTime.now();
    final int dayToGet = weekdayToNum[weekday]!;

    return _weekdayOf(now, dayToGet);

  }

  DateTime _weekdayOf(DateTime time, int weekday) =>
      time.add(Duration(days: weekday - time.weekday));

  int _getCurrentWeekDayInt() {
    return DateTime.now().weekday - 1;
  }

  List<DayWeek> getDayWeeks(DateTime? dateTime){

    late List<DayWeek> getWeekDayList = [

      DayWeek(label: "monday", dateTime: _getDateOfWeekDay('monday', currentDateTime: dateTime)),
      DayWeek(label: "tuesday", dateTime: _getDateOfWeekDay('tuesday', currentDateTime: dateTime)),
      DayWeek(label: "wednesday", dateTime: _getDateOfWeekDay('wednesday', currentDateTime: dateTime)),
      DayWeek(label: "thursday", dateTime: _getDateOfWeekDay('thursday', currentDateTime: dateTime)),
      DayWeek(label: "friday", dateTime: _getDateOfWeekDay('friday', currentDateTime: dateTime)),
      DayWeek(label: "saturday", dateTime: _getDateOfWeekDay('saturday', currentDateTime: dateTime)),
      DayWeek(label: "sunday", dateTime: _getDateOfWeekDay('sunday', currentDateTime: dateTime)),

    ];

    return getWeekDayList;
  }

  /// Find the first date of the week given a date.
  /// ```
  /// findFirstDateOfTheWeek(DateTime.now());
  ///```
  static DateTime findFirstDateOfTheWeek(DateTime dateTime) {
    return dateTime.subtract(Duration(days: dateTime.weekday - 1));
  }
  /// Find last date of the week given a date.
  ///```
  /// findLastDateOfTheWeek(DateTime.now());
  ///```
  static DateTime findLastDateOfTheWeek(DateTime dateTime) {
    return dateTime.add(Duration(days: DateTime.daysPerWeek - dateTime.weekday));
  }

  String formatDateTimeToPastReadable(DateTime dt) {

    final now = DateTime.now();

    final difference = now.difference(dt);


    if (difference.inDays >= 365) {
      
      final years = (difference.inDays / 365).floor();
      
      return "$years ${years == 1 ? 'year' : 'years'} ago";
      
    } else if (difference.inDays >= 30) {
      
      final months = (difference.inDays / 30).floor();
      
      return "$months ${months == 1 ? 'month' : 'months'} ago";
      
    } else if (difference.inDays > 0) {
      
      return "${difference.inDays} ${difference.inDays == 1 ? 'day' : 'days'} ago";
      
    } else if (difference.inHours > 0) {
      
      return "${difference.inHours} ${difference.inHours == 1 ? 'hour' : 'hours'} ago";
      
    } else if (difference.inMinutes > 0) {
      
      return "${difference.inMinutes} ${difference.inMinutes == 1 ? 'minute' : 'minutes'} ago";
      
    } else {
      
      return "a few seconds ago";
      
    }
    
  }

  theTimeAgo(DateTime dateTime){

    time_ago.format(dateTime, locale: 'en_short');

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

  static String millisecondsSinceEpochToReadableDateTime(int milliseconds, {bool addTime = false}){

    String pattern = addTime? "yyyy-MM-dd HH:mm:ss" : "yyyy-MM-dd";

    return DateFormat(pattern).format( DateTime.fromMillisecondsSinceEpoch( milliseconds ) );

  }

  static String readingNum(double num){

    var formatter = NumberFormat.decimalPattern();

    return formatter.format(num);

  }
  
}