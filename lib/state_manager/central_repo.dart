part of 'central_bloc.dart';

class CentralBLocRepository {

  final HttpMethods _httpMethods = HttpMethods();

  CentralBLocRepository();

  Future<dynamic> index(dynamic reqData) async {

    try {

      print("httpPost ----------------->");

      // var res = await _httpMethods.httpFormData("${HttpConstants.storeAndGetPatient}$userTypeId/", method: 'PATCH', data: formData);

      // return ResModel.fromJson(res);

    } catch (e) {

      print("http repo error: PatientDetailsResModel $e");

    }

    return null;

  }


  
  Future<PatientDetailsResModel?> getPatientInfo(String patientId, {bool preloader = true, bool keepPreloaderLoading = false}) async {

    try {

      print("httpGet ----------------->");

      var res = await _httpMethods.httpGet(HttpConstants.patientInfo(patientId), preloader: preloader, keepPreloaderLoading: keepPreloaderLoading);

      return PatientDetailsResModel.fromJson(res);

    } catch (e, stacktrace) {

      print("http repo error: PatientDetailsResModel $e ${stacktrace}");

    }

    return null;

  }
  
}