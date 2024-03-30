import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:smartpay/models/response_models/expired_token_res_model.dart';
import 'package:smartpay/models/response_models/refresh_token_res_model.dart';
import 'package:smartpay/models/user_detail_model.dart';
import 'package:smartpay/utils/common.dart';
import 'package:smartpay/utils/constants.dart';
import 'package:smartpay/utils/http/http_constants.dart';
import 'package:smartpay/utils/http/http_methods.dart';

class HttpInterceptor extends Interceptor {

  RequestOptions? _lastRequestOptions;

  final HttpMethods _httpMethods = HttpMethods();

  String? passedBearerToken;

  HttpInterceptor({this.passedBearerToken});

  @override
  Future<void> onRequest(RequestOptions options, RequestInterceptorHandler handler) async {

    UserDetailModel? res = await  SmartpaySharedPreferences.getUserInfo(showWarning: false);

    if(res == null || res.userToken == null) {handler.next(options); return;}

    debugPrint(" USER TOKENS =======> ${res.userToken} - ${passedBearerToken} ");

    debugPrint("${{"Authorization": passedBearerToken != null ? "Bearer $passedBearerToken" : "Bearer ${res.userToken}"}} }");

    options.headers.addAll({"Authorization": passedBearerToken != null ? "Bearer $passedBearerToken" : "Bearer ${res.userToken}"});

    _lastRequestOptions = options;

    handler.next(options);

  }


  // This is for 200 ... 299 responses
  @override
  Future<void> onResponse(Response response, ResponseInterceptorHandler handler) async {

    handler.next(response);

  }

  // This is for 400 ... 599 responses
  @override
  Future<void> onError( DioException err, ErrorInterceptorHandler handler ) async {

    debugPrint("ON RESPONSE");

    handler.next(err);

  }


  
}