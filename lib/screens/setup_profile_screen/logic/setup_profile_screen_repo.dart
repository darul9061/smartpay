import 'package:smartpay/models/request_models/setup_profile_req_model.dart';
import 'package:smartpay/models/response_models/setup_profile_res_model.dart';
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