import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:dio/io.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:smartpay/models/response_models/error_res_model.dart';
import 'package:smartpay/state_manager/central_bloc.dart';
import 'package:smartpay/utils/common.dart';
import 'package:smartpay/utils/http/http_constants.dart';
import 'package:smartpay/utils/http/http_interceptor.dart';

abstract class HttpVerbs {
  Future<Response?> request(
      {String method = 'GET',
      String? baseUrl,
      Map<String, dynamic>? headers = null,
      int connectTimeout = 90,
      int receiveTimeout = 90,
      dynamic data = null,
      String path = '',
      String contentType = 'application/json',
      Map<String, dynamic /*String|Iterable<String>*/ >? queryParameters = null,
      bool preloader = true,
      bool keepPreloaderLoading = false,
      CancelToken? cancelToken}) async {
    
    Dio dio = Dio();
    (dio.httpClientAdapter as IOHttpClientAdapter).createHttpClient = () =>
      HttpClient()
        ..badCertificateCallback =
            (X509Certificate cert, String host, int port) => true;


    // httpInterceptor setting
    String? authorizationHeaderEl = headers?.keys.firstWhere((element) => element.toLowerCase() == 'authorization', orElse: () => '',);

    String? newBearerToken = (authorizationHeaderEl?.isEmpty ?? true) ? null  : headers?[authorizationHeaderEl];

    dio.interceptors.add( HttpInterceptor( passedBearerToken: newBearerToken?.split(" ")[1] ) );

    baseUrl = baseUrl ?? HttpConstants.devBaseUrl;//HttpConstants.baseUrl;
    RequestOptions requestOptions = RequestOptions(
        method: method,
        baseUrl: HttpConstants.protocol + baseUrl,
        headers: headers,
        connectTimeout: Duration(seconds: connectTimeout),
        receiveTimeout: Duration(seconds: receiveTimeout),
        onReceiveProgress: (_, _in) => {},
        onSendProgress: (_, _in) => {},
        data: data, // ?? jsonEncode(data),
        path: path,
        contentType: contentType,
        queryParameters: queryParameters ?? {},
        cancelToken: cancelToken);


    if(preloader){
      
      if(!EasyLoading.isShow) EasyLoading.show();

    }

    try {


      print("root dio request:  " + data.toString());
      print("root dio url:  " + HttpConstants.protocol + baseUrl + path.toString());
      Response response = await dio.fetch(requestOptions);

      print("root dio response:  " + response.toString());
      print("root dio response code:  " + "${response.statusCode}");



      


      try {

        var httpResModel = ErrorResModel.fromJson(response.data);

        Common.navigatorKey.currentContext!.read<CentralBLoc>().errorResModel = httpResModel;

        await Common.smartpayToast(httpResModel.message!);
        
      } catch (err) { 
        
        print("Error from dioError: $err"); 
      
        try {

          if(response.data is Map<String, dynamic>){

            Map mappedResponse = response.data as Map<String, dynamic>;

            var errorMsglist = mappedResponse.values;



            if(errorMsglist.first is List){

              var errMsg = errorMsglist.first[0] as String;

              await Common.smartpayToast(errMsg);

              return null;

            }

          }
          
        } catch (err2) { print("Error from dioError: $err2"); }

      }

      if(preloader && !keepPreloaderLoading) await EasyLoading.dismiss();

      return response;

    } on SocketException {

      // KashiarToast.show(msg: "Please check your internet connection", length: Toast.LENGTH_LONG);

      if(preloader) await EasyLoading.dismiss();

      print("http error: No Internet connection");

      return null;

    } on DioError catch (e) {

      if(preloader) await EasyLoading.dismiss();

      // The request was made and the server responded with a status code
      // that falls out of the range of 2xx and is also not 304.
      if (e.response != null) {

        print("ERROR RESPONSE STATUS CODE:::: ${e.response?.statusCode}");
        print("ERROR RESPONSE DATA:::: ${e.response?.data}");
        print("ERROR RESPONSE HEADERS:::: ${e.response?.headers}");
        print("ERROR RESPONSE REQUEST OPTIONS:::: ${e.response?.requestOptions}");

        if( (e.response?.statusCode ?? 0) >= 500){

          await Common.smartpayToast("Server Error", isError: true);

        }else if(e.response?.data != null){

          try {

            var httpResModel = ErrorResModel.fromJson(e.response!.data);

            Common.navigatorKey.currentContext!.read<CentralBLoc>().errorResModel = httpResModel;

            var v = httpResModel.errors?.values ?? [];

            if (v.isEmpty){

              await Common.smartpayToast(httpResModel.message!, isError: true);


            } else if( v.toList().isNotEmpty ){

              var t = v.toList()[0][0];

              await Common.smartpayToast(t as String, isError: true);

            }
            
          } catch (err, stacktrace) { 
            
            print("Error from dioError: $err $stacktrace"); 
          
            try {

              if(e.response?.data is Map<String, dynamic>){

                Map mappedResponse = e.response?.data as Map<String, dynamic>;

                var errorMsglist = mappedResponse.values;



                if(errorMsglist.first is List){

                  var errMsg = errorMsglist.first[0] as String;

                  await Common.smartpayToast(errMsg, isError: true);

                  return null;

                }

              }
              
            } catch (err2) { print("Error from dioError: $err2"); }
            
          }

        }

      } else {




        if ( (e.message ?? "").contains("SocketException")) { 

          // var exception = e.runtimeType as DioException;

          // print(exception.type);
          // print(exception.message);
          // print(exception.stackTrace);
          
          Common.smartpayToast("Please check your internet connection", isError: true); 
        }
        // Something happened in setting up or sending the request that triggered an Error
        print("ERROR ERROR:::: ${e.error}");
        print("ERROR RUNTIME_TYPE:::: ${e.runtimeType}");
        print("ERROR REQUEST OPTIONS::::: ${e.requestOptions}");
        print("ERROR MESSAGE::::: ${e.message}");

      }

    } catch (e) {

      if(preloader) await EasyLoading.dismiss();

      print("http error ::::" + e.toString());

    }

    return null;
  }

  httpGet(String path);
  httpPost(String path);
  httpPatch(String path);
  httpPut(String path);
  httpDelete(String path);
}