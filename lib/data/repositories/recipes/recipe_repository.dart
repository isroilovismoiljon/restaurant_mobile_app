import 'package:restourant_mobile_app/core/utils/result.dart';
import 'package:restourant_mobile_app/data/models/recipes/recipe_model.dart';
import '../../../core/client.dart';

class RecipeRepository {
  RecipeModel? recipe;
  final ApiClient client;

  RecipeRepository({required this.client});

  Future<Result<RecipeModel>> getById(int id) async {
    if (recipe != null) return Result.ok(recipe!);
    var result = await client.get<Map<String, dynamic>>("/recipes/detail/$id");
    return result.fold(
      (error) => Result.error(error),
      (value) => Result.ok(RecipeModel.fromJson(value)),
    );
  }
}
