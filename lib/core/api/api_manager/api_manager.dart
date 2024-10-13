import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:movies_app/core/constants/constants_manager.dart';

@singleton
class ApiManager {
  static late Dio dio;
  static void init() {
    dio = Dio(BaseOptions(baseUrl: ConstantsManager.baseUrl));
  }

  Future<Response> getRequest(
      {required String endPoint,
      required String token,
        Map<String, dynamic>? pathParams,
      Map<String, dynamic>? queryParameters}) async {
    dio.options.headers['Authorization'] = 'Bearer $token';
    if (pathParams != null) {
      pathParams.forEach((key, value) {
        endPoint = endPoint.replaceAll('{$key}', value);
      });}
    var response = await dio.get(endPoint, queryParameters: queryParameters);
    return response;
  }

  Future<Response> postRequest(
      {required String endPoint,
      required String token,
      Map<String, dynamic>? queryParameters}) async {
    dio.options.headers['Authorization'] = 'Bearer $token';
    var response = await dio.post(endPoint, queryParameters: queryParameters);
    return response;
  }
}
