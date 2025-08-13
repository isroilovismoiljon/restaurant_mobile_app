import 'package:restourant_mobile_app/core/client.dart';
import 'package:restourant_mobile_app/core/utils/result.dart';
import 'package:restourant_mobile_app/data/models/recipes/category_model.dart';

class CategoryRepository {
  List<CategoryModel> categories = [];
  final ApiClient client;

  CategoryRepository({required this.client});

  Future<Result<List<CategoryModel>>> getAll() async {
    if (categories.isNotEmpty) return Result.ok(categories);
    final result = await client.get<List>('/categories/list');

    return result.fold(
      (error) => Result.error(error),
      (value) =>
          Result.ok(value.map((x) => CategoryModel.fromJson(x)).toList()),
    );
  }
}
