import 'package:smartpay/models/request_models/forgot_password_new_password_req_model.dart';
import 'package:smartpay/models/request_models/reset_password_verify_token_req_model.dart';
import 'package:smartpay/screens/forgot_password_screen/logic/forgot_password_screen_bloc.dart';
import 'package:smartpay/utils/http/http_constants.dart';
import 'package:smartpay/utils/http/http_methods.dart';

class ForgotPasswordScreenRepository {
  

  final HttpMethods _httpMethods = HttpMethods();

  Future<dynamic> verifyToken(ForgotPasswordVerifyTokenReqModel tokenVerifyReq) async {

    try {

      print("httpPost ----------------->");

      var res = await _httpMethods.httpPost(HttpConstants.forgotPasswordVerifyToken, data: tokenVerifyReq.toJson());

      return res;

      // return EmailVerificationResModel.fromJson(res);

    } catch (e) {

      print("http repo error: EmailVerificationResModel" + e.toString());

    }

    return null;
    
  }

  Future<dynamic> newPassword(ForgotPasswordNewPasswordReqModel newPasswordReq) async {

    try {

      print("httpPost ----------------->");

      var res = await _httpMethods.httpPost(HttpConstants.forgotPasswordReset, data: newPasswordReq.toJson());

      return res;

      // return EmailVerificationResModel.fromJson(res);

    } catch (e) {

      print("http repo error: EmailVerificationResModel" + e.toString());

    }

    return null;


  }

  Future<Map?> sendOtp(String email) async {

    try {

      print("httpPost ----------------->");

      var res = await _httpMethods.httpPost(HttpConstants.forgotPasswordSendOTP, data: { "email": email } );

      return res;

    } catch (e) {

      print("http repo error: EmailVerificationResModel" + e.toString());

    }

    return null;


  }

}