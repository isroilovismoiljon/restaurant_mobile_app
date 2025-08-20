import 'package:restourant_mobile_app/core/utils/result.dart';
import 'package:restourant_mobile_app/data/models/recipes/recipe_model.dart';
import 'package:restourant_mobile_app/data/models/recipes/review_model.dart';
import 'package:restourant_mobile_app/data/models/recipes/trending_recipe.dart';
import '../../core/client.dart';
import '../models/recipes/category_details_model.dart';
import '../models/recipes/category_model.dart';
import '../models/recipes/recipe_review_model.dart';

class RecipeRepository {
  RecipeModel? recipe;
  List<CategoryDetailsModel> categoryDetails = [];
  List<CategoryModel> categories = [];
  TrendingRecipeModel? trendingRecipe;
  RecipeReviewModel? recipeReviewModel;
  List<ReviewModel> reviews = [];

  final ApiClient client;

  RecipeRepository({required this.client});

  Future<Result<RecipeModel>> getRecipe(int id) async {
    if (recipe != null) return Result.ok(recipe!);
    var result = await client.get<Map<String, dynamic>>("/recipes/detail/$id");
    return result.fold(
      (error) => Result.error(error),
      (value) => Result.ok(RecipeModel.fromJson(value)),
    );
  }

  Future<Result<List<CategoryDetailsModel>>> getCategoryDetails(Map<String, dynamic> queryParams) async {
    if (categoryDetails.isNotEmpty) return Result.ok(categoryDetails);
    final result = await client.get<List>('/recipes/list', queryParams: queryParams);
    return result.fold(
      (error) => Result.error(error),
      (value) => Result.ok(
        value.map((x) => CategoryDetailsModel.fromJson(x)).toList(),
      ),
    );
  }

  Future<Result<List<CategoryModel>>> getCategories() async {
    if (categories.isNotEmpty) return Result.ok(categories);
    final result = await client.get<List>('/categories/list');

    return result.fold(
      (error) => Result.error(error),
      (value) =>
          Result.ok(value.map((x) => CategoryModel.fromJson(x)).toList()),
    );
  }

  Future<Result<TrendingRecipeModel>> getTrendingRecipe() async {
    if (trendingRecipe != null) return Result.ok(trendingRecipe!);
    var result = await client.get<Map<String, dynamic>>('/recipes/trending-recipe');

    return result.fold(
      (error) => Result.error(error),
      (value) => Result.ok(TrendingRecipeModel.fromJson(value)),
    );
  }


  Future<Result<RecipeReviewModel>> getRecipeReview(int recipeId) async {
    if (recipeReviewModel != null) return Result.ok(recipeReviewModel!);
    var result = await client.get<Map<String, dynamic>>('/recipes/reviews/detail/${recipeId}');
    return result.fold(
          (error) => Result.error(error),
          (value) => Result.ok(RecipeReviewModel.fromJson(value)),
    );
  }
  Future<Result<List<ReviewModel>>> getReviews(int recipeId) async {
    if (reviews.isNotEmpty) return Result.ok(reviews);
    var result = await client.get<List>('/reviews/list', queryParams: {'recipeId': recipeId});
    return result.fold(
          (error) => Result.error(error),
          (value) => Result.ok(value.map((x) => ReviewModel.fromJson(x)).toList()),
    );
  }
}
