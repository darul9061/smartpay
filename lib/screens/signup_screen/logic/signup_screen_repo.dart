import 'package:smartpay/models/request_models/signup_req_model.dart';
import 'package:smartpay/models/response_models/signup_res_model.dart';
import 'package:smartpay/utils/http/http_constants.dart';
import 'package:smartpay/utils/http/http_methods.dart';

class SignUpScreenRepository {

  final HttpMethods _httpMethods = HttpMethods();

  SignUpScreenRepository();

  Future<SignUpResModel?> authUser(SignUpReqModel signupReq) async {

    try {

      print("httpGet ----------------->");

      var res = await _httpMethods.httpPost(HttpConstants.signup, data: signupReq.toJson());

      return SignUpResModel.fromJson(res);

    } catch (e) {

      print("http repo error: LoginResModel" + e.toString());

    }

    return null;


  }
  
}