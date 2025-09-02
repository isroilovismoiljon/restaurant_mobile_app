import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:restourant_mobile_app/core/client.dart';
import 'package:restourant_mobile_app/core/utils/result.dart';

import '../models/auth/login_model.dart';
import '../models/auth/register_model.dart';

class AuthenticationRepository {
  final ApiClient client;
  final FlutterSecureStorage _secureStorage;

  AuthenticationRepository({required this.client, required FlutterSecureStorage secureStorage})
    : _secureStorage = secureStorage;

  Future<Result<String>> register(RegisterModel model) async {
    var result = await client.post<Map<String, dynamic>>(
      '/auth/register',
      data: model.toJson(),
    );
    return result.fold(
      (error) => Result.error(error),
      (value)async {

        final String token = value['accessToken'];
        await _secureStorage.write(key: 'token', value: token);
        return Result.ok(token);
      },
    );
  }

  Future<Result<String>> login(LoginModel model) async {
    var result = await client.post<Map<String, dynamic>>(
      '/auth/login',
      data: model.toJson(),
    );
    return result.fold(
      (error) => Result.error(error),
          (value)async {

        final String token = value['accessToken'];
        await _secureStorage.write(key: 'token', value: token);
        await _secureStorage.write(key: 'login', value: model.login);
        await _secureStorage.write(key: 'password', value: model.password);
        return Result.ok(token);
      },
    );
  }
}
