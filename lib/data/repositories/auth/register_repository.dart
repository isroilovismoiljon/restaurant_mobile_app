import 'package:restourant_mobile_app/core/client.dart';
import 'package:restourant_mobile_app/core/utils/result.dart';

import '../../models/model/register_model.dart';

class RegisterRepository {
  final ApiClient client;

  RegisterRepository({required this.client});

  Future<Result<String>> register(RegisterModel model) async {
    final result = await client.post<Map<String, dynamic>>(
      '/auth/register',
      data: model.toJson(),
    );

    return result.fold(
      (error) => Result.error(error),
      (value) => Result.ok(value['accessToken']),
    );
  }
}
