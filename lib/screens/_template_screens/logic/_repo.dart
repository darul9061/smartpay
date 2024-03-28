part of '_bloc.dart';

class Repository {

  // final HttpMethods _httpMethods = HttpMethods();

  Repository();

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
  
}