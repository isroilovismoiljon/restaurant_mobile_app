import 'package:restourant_mobile_app/core/client.dart';
import 'package:restourant_mobile_app/core/utils/result.dart';

import '../models/auth/login_model.dart';
import '../models/auth/register_model.dart';

class AuthenticationRepository {
  final ApiClient client;

  AuthenticationRepository({required this.client});

  Future<Result<String>> register(RegisterModel model) async {
    final result = await client.post<String>(
      '/auth/register',
      data: model.toJson(),
    );

    return result.fold(
      (error) => Result.error(error),
      (value) => Result.ok(value),
    );
  }

  Future<Result<String>> login(LoginModel model) async {
    final result = await client.post<String>(
      '/auth/login',
      data: model.toJson(),
    );
    return result.fold(
          (error) => Result.error(error),
          (value) => Result.ok(value),
    );
  }
}
