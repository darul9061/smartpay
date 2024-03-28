import 'package:dio/dio.dart';
import 'package:smartpay/utils/http/_base.dart';

class HttpMethods extends HttpVerbs {
  @override
  Future<dynamic> httpGet(String path,
      {
      String? baseUrl,
      Map<String, dynamic>? headers,
      Map<String, dynamic>? queryParameters, 
      CancelToken? cancelToken, 
      bool useDefaultPath = true,
      bool preloader = true, 
      bool keepPreloaderLoading = false}) async {
    print("httpGet started");
    Response? response =
        await request(
          path: path, 
          baseUrl: baseUrl,
          headers: headers,
          queryParameters: queryParameters, 
          cancelToken: cancelToken,
        preloader: preloader,
        keepPreloaderLoading: keepPreloaderLoading);
    print("httpGet res: ${response.toString()} \n");

    return response?.data;
  }

  @override
  Future<dynamic> httpPost(String path,
      {
      String? baseUrl,
      Map<String, dynamic>? headers,
      Map<String, dynamic>? data,
      Map<String, dynamic>? queryParameters,
      bool preloader = true,
      bool keepPreloaderLoading = false}) async {

    Response? response = await request(
        method: 'POST',
        queryParameters: queryParameters,
        headers: null,
        data: data,
        path: path,
        baseUrl: baseUrl,
        preloader: preloader,
        keepPreloaderLoading: keepPreloaderLoading);


    print(response?.data);
    return response?.data;
  }

  @override
  Future<dynamic> httpFormData(String path,
      
      {required String method, 
      String? baseUrl,
      Map<String, dynamic>? headers,
      FormData? data,
      Map<String, dynamic>? queryParameters,
      bool preloader = true,
      bool keepPreloaderLoading = false}) async {

    Response? response = await request(
        method: method,//'POST',
        queryParameters: queryParameters,
        headers: null,
        data: data,
        path: path,
        baseUrl: baseUrl,
        preloader: preloader,
        keepPreloaderLoading: keepPreloaderLoading);


    print(response?.data);
    return response?.data;
  }

  @override
  Future<dynamic> httpPatch(String path,
      {
      String? baseUrl,
      Map<String, dynamic>? headers,
      Map<String, dynamic>? data,
      Map<String, dynamic>? queryParameters,
      bool preloader = true,
      bool keepPreloaderLoading = false}) async {
    Response? response = await request(
        queryParameters: queryParameters,
        method: 'PATCH',
        headers: null,
        data: data,
        path: path,
        baseUrl: baseUrl,
        preloader: preloader,
        keepPreloaderLoading: keepPreloaderLoading);

    print(response?.data);
    return response?.data;
  }

  @override
  Future<dynamic> httpPut(String path,
      {
      String? baseUrl,
      Map<String, dynamic>? headers,
      Map<String, dynamic>? data,
      Map<String, dynamic>? queryParameters,
      bool preloader = true,
      bool keepPreloaderLoading = false}) async {
    Response? response = await request(
        queryParameters: queryParameters,
        method: 'PUT',
        headers: null,
        data: data,
        path: path,
        baseUrl: baseUrl,
        preloader: preloader,
        keepPreloaderLoading: keepPreloaderLoading);

    print(response?.data);
    return response?.data;
  }

  @override
  Future<dynamic> httpDelete(String path,
      {
      String? baseUrl,
      Map<String, dynamic>? headers,
      Map<String, dynamic>? data,
      Map<String, dynamic>? queryParameters,
      bool preloader = true,
      bool keepPreloaderLoading = false}) async {
    Response? response = await request(
        queryParameters: queryParameters,
        headers: null,
        method: 'DELETE',
        data: data,
        path: path,
        baseUrl: baseUrl,
        preloader: preloader,
        keepPreloaderLoading: keepPreloaderLoading);

    print( response?.data );
    return response?.data;
  }
}
