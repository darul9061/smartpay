import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:smartpay/models/request_models/next_of_kin_req_model.dart';
import 'package:smartpay/models/request_models/setup_pin_req_model.dart';
import 'package:smartpay/models/request_models/setup_profile_req_model.dart';
import 'package:smartpay/models/request_models/store_patient_detail_req_model.dart';
import 'package:smartpay/models/response_models/next_of_kin_res_model.dart';
import 'package:smartpay/models/response_models/patient_details_res_models.dart';
import 'package:smartpay/models/response_models/setup_profile_res_model.dart';
import 'package:smartpay/models/response_models/store_patient_detail_res_model.dart';
import 'package:smartpay/models/user_detail_model.dart';
import 'package:smartpay/utils/constants.dart';
import 'package:smartpay/utils/http/http_constants.dart';
import 'package:smartpay/utils/http/http_methods.dart';

class SetupProfileScreenRepository{

  final HttpMethods _httpMethods = HttpMethods();

  SetupProfileScreenRepository();

  Future<SetupProfileResModel?> storeProfile( SetupProfileReqModel reqData ) async {

    try {

      print("httpPatch ----------------->");

      var res = await _httpMethods.httpPost(

        HttpConstants.setupProfile, 

        data: reqData.toJson()

      );

      return SetupProfileResModel.fromJson(res);

    } catch (e) {

      print("http repo error: SetupProfileResModel $e");

    }

    return null;

  }

}