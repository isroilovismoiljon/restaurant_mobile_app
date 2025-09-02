import 'package:restourant_mobile_app/core/client.dart';
import 'package:restourant_mobile_app/core/utils/result.dart';
import 'package:restourant_mobile_app/data/models/users/chef.dart';

class UsersRepository {
  final ApiClient client;

  UsersRepository({required this.client});

  Future<Result<List<ChefModel>>> getChefs(Map<String, dynamic> params) async {
    // if (mostViewedChefs.isNotEmpty) return Result.ok(mostViewedChefs);
    var result = await client.get<List>(
      '/top-chefs/list',
      queryParams: params,
    );
    return result.fold(
      (error) => Result.error(error),
      (value) => Result.ok(value.map((x) => ChefModel.fromJson(x)).toList()),
    );
  }

  Future<Result<ChefModel>> getChef(int id) async {
    // if (mostViewedChefs.isNotEmpty) return Result.ok(mostViewedChefs);
    var result = await client.get(
      '/auth/details/$id',
    );
    return result.fold(
      (error) => Result.error(error),
      (value) => Result.ok(ChefModel.fromJson(value)),
    );
  }

  Future<Result<ChefModel>> getMe() async {
    var result = await client.get(
      '/auth/me',
    );
    return result.fold(
      (error) => Result.error(error),
      (value) => Result.ok(ChefModel.fromJson(value)),
    );
  }

  Future<Result<String>> follow(int userId) async {
    var result = await client.post<String>('/auth/follow/$userId', data: userId);
    return result.fold(
      (error) => Result.error(error),
      (value) => Result.ok(value),
    );
  }
}
