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
    return result.fold((error) => Result.error(error),
          (value) =>
          Result.ok(value.map((x) => ChefModel.fromJson(x)).toList()),
    );
  }
}
