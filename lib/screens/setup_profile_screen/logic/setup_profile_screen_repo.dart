import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:smartpay/models/request_models/next_of_kin_req_model.dart';
import 'package:smartpay/models/request_models/store_patient_detail_req_model.dart';
import 'package:smartpay/models/response_models/next_of_kin_res_model.dart';
import 'package:smartpay/models/response_models/patient_details_res_models.dart';
import 'package:smartpay/models/response_models/store_patient_detail_res_model.dart';
import 'package:smartpay/models/user_detail_model.dart';
import 'package:smartpay/utils/constants.dart';
import 'package:smartpay/utils/http/http_constants.dart';
import 'package:smartpay/utils/http/http_methods.dart';

class SetupProfileScreenRepository{

  final HttpMethods _httpMethods = HttpMethods();

  SetupProfileScreenRepository();

  Future<PatientDetailsResModel?> storeProfile(StorePatientDetailReqModel reqData, String userTypeId, {bool keepPreloaderLoading = false}) async {

    try {

      print("httpPatch ----------------->");

      var formMapData = reqData.toJson();
      
      formMapData.removeWhere((key, value) => value == null || value == '');

      final formData = FormData.fromMap(

        formMapData

      );

      // debugPrint("${formMapData}");

      var res = await _httpMethods.httpFormData(

        "${HttpConstants.storeAndGetPatient}$userTypeId/", 

        method: 'PATCH', 

        data: formData,

        keepPreloaderLoading: keepPreloaderLoading

      );

      var patientObj = PatientDetailsResModel.fromJson(res);

      return patientObj;

    } catch (e) {

      print("http repo error: PatientDetailsResModel $e");

    }

    return null;

  }

  Future<NextOfKinResModel?> storeNextOfKinProfile(NextOfKinReqModel nextOfKinReqData,String userTypeId) async {

    try {

      print("httpPost ----------------->");

      var kinRes = await _httpMethods.httpPost(HttpConstants.storeNextOfKin(userTypeId), data: nextOfKinReqData.toJson());

      return NextOfKinResModel.fromJson(kinRes);

    } catch (e) {

      print("http repo error: NextOfKinResModel $e");

    }

    return null;

  }
}