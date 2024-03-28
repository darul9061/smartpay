import 'package:smartpay/models/request_models/login_req_model.dart';
import 'package:smartpay/models/response_models/login_res_model.dart';
import 'package:smartpay/utils/http/http_constants.dart';
import 'package:smartpay/utils/http/http_methods.dart';

class LoginScreenRepository {

  final HttpMethods _httpMethods = HttpMethods();

  LoginScreenRepository();

  Future<LoginResModel?> login(LoginReqModel loginReq, {bool preloader = true, bool keepPreloaderLoading = false}) async {

    try {

      print("httpGet ----------------->");

      var res = await _httpMethods.httpPost(HttpConstants.login, data: loginReq.toJson(), preloader: preloader, keepPreloaderLoading: keepPreloaderLoading);

      return LoginResModel.fromJson(res);

    } catch (e) {

      print("http repo error: LoginResModel" + e.toString());

    }

    return null;

  }
  
}