import 'package:flutter/material.dart';
import 'package:smartpay/models/request_models/email_verif_req_model.dart';
import 'package:smartpay/models/request_models/setup_profile_req_model.dart';
import 'package:smartpay/models/response_models/email_verification_res_model.dart';
import 'package:smartpay/models/response_models/get_email_verif_token_res_model.dart';
import 'package:smartpay/models/response_models/signup_res_model.dart';
import 'package:smartpay/utils/http/http_constants.dart';
import 'package:smartpay/utils/http/http_methods.dart';

class SignUpScreenRepository {

  final HttpMethods _httpMethods = HttpMethods();

  SignUpScreenRepository();

  Future<GetEmailVerifTokenResModel?> getEmailVerifToken(String email) async {

    try {

      debugPrint("httpGet ----------------->");

      var res = await _httpMethods.httpPost(HttpConstants.getVerifyEmailToken, data: { "email": email });

      return GetEmailVerifTokenResModel.fromJson(res);

    } catch (e) {

      debugPrint("http repo error: GetEmailVerifTokenResModel$e");

    }

    return null;


  }

  Future<EmailVerificationResModel?> verifyEmail(EmailVerificationReqModel reqData) async {

    try {

      debugPrint("httpGet ----------------->");

      var res = await _httpMethods.httpPost(HttpConstants.verifyEmail, data: reqData.toJson());

      return EmailVerificationResModel.fromJson(res);

    } catch (e) {

      debugPrint("http repo error: EmailVerificationResModel$e");

    }

    return null;


  }
  
}