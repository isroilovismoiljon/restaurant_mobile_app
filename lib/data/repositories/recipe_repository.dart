import 'package:restourant_mobile_app/core/utils/result.dart';
import 'package:restourant_mobile_app/data/models/recipes/recipe_model.dart';
import '../../core/client.dart';
import '../models/recipes/category_details_model.dart';
import '../models/recipes/category_model.dart';

class RecipeRepository {
  RecipeModel? recipe;
  List<CategoryDetailsModel> categoryDetails = [];
  List<CategoryModel> categories = [];

  final ApiClient client;

  RecipeRepository({required this.client});

  Future<Result<RecipeModel>> getRecipes(int id) async {
    if (recipe != null) return Result.ok(recipe!);
    var result = await client.get<Map<String, dynamic>>("/recipes/detail/$id");
    return result.fold(
      (error) => Result.error(error),
      (value) => Result.ok(RecipeModel.fromJson(value)),
    );
  }

  Future<Result<List<CategoryDetailsModel>>> getCategoryDetails(int id) async {
    if (categoryDetails.isNotEmpty) return Result.ok(categoryDetails);
    final result = await client.get<List>('/recipes/list?Category=$id');
    return result.fold(
          (error) => Result.error(error),
          (value) => Result.ok(
        value.map((x) => CategoryDetailsModel.fromJson(x)).toList(),
      ),
    );
  }

  Future<Result<List<CategoryModel>>> getCategories() async {
    if (categories.isNotEmpty) return Result.ok(categories);
    final result = await client.get<List>('/recipes/list');

    return result.fold(
          (error) => Result.error(error),
          (value) =>
          Result.ok(value.map((x) => CategoryModel.fromJson(x)).toList()),
    );
  }
}
