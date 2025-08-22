import 'package:dio/dio.dart';
import 'package:restourant_mobile_app/core/utils/result.dart';

import 'auth_interceptor.dart';

class ApiClient {
  ApiClient({required this.interceptor, required String baseUrl})
    : dio = Dio(BaseOptions(baseUrl: baseUrl, validateStatus: (value) => true))..interceptors.add(interceptor);

  late final Dio dio;
  final AuthInterceptor interceptor;

  Future<Result<T>> get<T>(String path, {Map<String, dynamic>? queryParams}) async {
    try {
      var response = await dio.get(path, queryParameters: queryParams);
      if (response.statusCode != 200) {
        return Result.error(Exception(response.data));
      }
      return Result.ok(response.data as T);
    } on Exception catch (exception) {
      return Result.error(exception);
    }
  }

  Future<Result<T>> post<T>(String path, {required data, Map<String, dynamic>? queryParams}) async {
    try {
      final response = await dio.post(path, data: data);
      if (response.statusCode == 200 || response.statusCode == 201) {
        return Result.ok(response.data);
      } else {
        return Result.error(response.data);
      }
    } on Exception catch (e) {
      return Result.error(e);
    }
  }

  Future<Result<T>> patch<T>(String path, Map<String, dynamic> data)async{
    try{
      var response = await dio.patch(path, data: data);
      if (response.statusCode != 200) {
        return Result.error(response.data);
      }
      return Result.ok(response.data);
    }on Exception catch(e){
      return Result.error(e);
    }
  }

  Future<Result> delete<T>(String path)async{
    try{
      var response = await dio.patch(path);
      if (response.statusCode != 204) {
        return Result.error(response.data);
      }
      return Result.ok(response.data);
    }on Exception catch(e){
      return Result.error(e);
    }
  }
}

var dio = Dio(
  BaseOptions(
    baseUrl: "http://192.168.8.196:8888/api/v1",
    validateStatus: (value) => true,
  ),
);
