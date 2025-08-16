import 'package:dio/dio.dart';
import 'package:restourant_mobile_app/core/utils/result.dart';

class ApiClient {
  ApiClient({required String baseUrl})
    : dio = Dio(BaseOptions(baseUrl: baseUrl, validateStatus: (value) => true));

  final Dio dio;

  Future<Result<T>> get<T>(
    String path, {
    Map<String, dynamic>? queryParams,
  }) async {
    final response = await dio.get(path, queryParameters: queryParams);
    if (response.statusCode == 200) {
      return Result.ok(response.data as T);
    } else {
      return Result.error(response.data);
    }
  }

  Future<Result<T>> post<T>(
    String path, {
    required data,
    Map<String, dynamic>? queryParams,
  }) async {
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
}

var dio = Dio(
  BaseOptions(
    baseUrl: "http://192.168.11.205:8888/api/v1",
    validateStatus: (value) => true,
  ),
);
