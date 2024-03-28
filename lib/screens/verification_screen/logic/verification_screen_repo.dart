import 'package:smartpay/models/request_models/signup_verif_req_model.dart';
import 'package:smartpay/models/response_models/resend_verification_res_model.dart';
import 'package:smartpay/models/response_models/signup_verification_res_model.dart';
import 'package:smartpay/utils/http/http_constants.dart';
import 'package:smartpay/utils/http/http_methods.dart';

class VerificationScreenRepository {

  final HttpMethods _httpMethods = HttpMethods();

  VerificationScreenRepository();

  Future<SignUpVerificationResModel?> verifyUser(VerificationScreenReqModel verifReq) async {

    try {

      print("httpPost ----------------->");

      var res = await _httpMethods.httpPost(HttpConstants.signupVerif, data: verifReq.toJson());

      return SignUpVerificationResModel.fromJson(res);

    } catch (e) {

      print("http repo error: SignUpVerificationResModel" + e.toString());

    }

    return null;


  }

  Future<ResendVerificationResModel?> resendVerificationCode(String email) async {

    try {

      print("httpPost ----------------->");

      var res = await _httpMethods.httpPost( HttpConstants.resendVerifCode, data: { "email": email }, preloader: false );

      return ResendVerificationResModel.fromJson(res);

    } catch (e) {

      print("http repo error: ResendVerificationResModel" + e.toString());

    }

    return null;


  }
  
}