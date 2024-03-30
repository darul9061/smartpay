import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smartpay/models/response_models/error_res_model.dart';
import 'package:smartpay/models/response_models/home_res_model.dart';
import 'package:smartpay/models/response_models/patient_details_res_models.dart';
import 'package:smartpay/models/user_detail_model.dart';
import 'package:smartpay/utils/constants.dart';
import 'package:smartpay/utils/http/http_constants.dart';
import 'package:smartpay/utils/http/http_methods.dart';
import 'package:crypto/crypto.dart';

part 'central_state.dart';
part 'central_events.dart';
part 'central_repo.dart';

class StoreUserInfoException implements Exception {
  final String message;
  StoreUserInfoException(this.message);
}

class CentralBLoc extends Bloc<CentralBLocEvent, CentralBLocState> {

  CentralBLocRepository repo = CentralBLocRepository();

  CentralBLocState centralBLocState = CentralBLocState();

  CentralBLoc():super(CentralBLocState());

  ErrorResModel? errorResModel;

  bool setupPinScreenShouldCheckPin = false;

  Future<bool> checkPin({required String passwordKey, required UserDetailModel userData }) async {

    var key = utf8.encode( passwordKey );

    var u = await SmartpaySharedPreferences.getUserInfo(showWarning: false);

    if(u is! UserDetailModel){ throw StoreUserInfoException(" Failed to get user info "); }

    var dataBytes = utf8.encode( jsonEncode( userData.toEncryptedJson() ) );

    var hmacSha256 = Hmac(sha256, key); 

    var digest = hmacSha256.convert( dataBytes );


    debugPrint("CHECK PIN ===>  ${userData.userEncryptedPin} ${digest.toString()}}");

    var s = digest.toString() == u.userEncryptedPin;

    if(s && u.userToken != null) {


      SmartpaySharedPreferences.putUserInfo(userData..userToken = u.userToken);

    }

    return s;

  }

  Future<bool> storePin({required String passwordKey, required UserDetailModel userData }) async {

    try {
    
      var key = utf8.encode( passwordKey );

      var dataBytes = utf8.encode( jsonEncode( userData.toEncryptedJson() ) );

      var hmacSha256 = Hmac(sha256, key); 

      var digest = hmacSha256.convert( dataBytes );

      userData.userEncryptedPin = digest.toString();

      

      debugPrint("SetupProfileScreenSavePinEvent ===>  ${userData.userEncryptedPin} ${userData.toEncryptedJson()}");

      return await SmartpaySharedPreferences.putUserInfo(
        
        userData

      );

    } catch(e, stacktrace){

      debugPrint("SetupProfileScreenSavePinEvent Error ===>  ${stacktrace}");

      return false;

    }

  }
  
}