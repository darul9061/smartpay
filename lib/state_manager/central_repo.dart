part of 'central_bloc.dart';

class CentralBLocRepository {

  final HttpMethods _httpMethods = HttpMethods();

  CentralBLocRepository();
  
  Future<HomeResModel?> getDashboadIndex() async {

    try {

      print("httpGet ----------------->");

      var res = await _httpMethods.httpGet(HttpConstants.dashboard);

      return HomeResModel.fromJson(res);

    } catch (e, stacktrace) {

      print("http repo error: HomeResModel $e ${stacktrace}");

    }

    return null;

  }
  
}