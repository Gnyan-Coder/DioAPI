import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

class HttpService{
  late Dio _dio;
  final baseUrl="http://reqres.in/";
  HttpService(){
    _dio=Dio(BaseOptions(
      baseUrl:baseUrl,
    ));
  }

  Future<Response> getRequest(String endPoint)async{
    Response response;
    try {
      response=await _dio.get(endPoint);
    } on DioError catch (e) {
      debugPrint(e.error);
      throw Exception(e.message);
    }
    return response;
  }

  initializeInterceptors(){
    _dio.interceptors.add(InterceptorsWrapper(
      onError: (e, handler) {
        debugPrint(e.message);
      },
      onResponse: (e, handler) {
        debugPrint(e.data);
      },
      onRequest: (options, handler) {
        debugPrint("${options.method} ${options.path}");
      },
    ));
  }

}