import 'dart:convert';
import 'package:hive/hive.dart';
import 'package:dio/dio.dart';
import 'package:restourant_mobile_app/core/utils/result.dart';
import 'package:restourant_mobile_app/data/models/recipes/community_model.dart';
import 'package:restourant_mobile_app/data/models/recipes/recipe_model.dart';
import 'package:restourant_mobile_app/data/models/recipes/review_model.dart';
import 'package:restourant_mobile_app/data/models/recipes/trending_recipe.dart';
import 'package:restourant_mobile_app/data/models/recipes/your_recipe_model.dart';
import 'package:restourant_mobile_app/data/repositories/cache/category_cache.dart';
import '../../core/client.dart';
import '../models/recipes/category_details_model.dart';
import '../models/recipes/category_model.dart';
import '../models/recipes/recipe_review_model.dart';

class RecipeRepository {
  RecipeModel? recipe;
  List<CategoryModel> categories = [];
  List<CategoryDetailsModel> categoryDetails = [];
  List<YourRecipeModel> yourRecipes = [];
  TrendingRecipeModel? trendingRecipe;
  RecipeReviewModel? recipeReviewModel;
  List<ReviewModel> reviews = [];
  List<CommunityModel> communities = [];

  final ApiClient client;
  final CategoryCache cacheCategory = CategoryCache();

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
    var result = await client.get<List>('/recipes/list', queryParams: queryParams);
    return result.fold(
      (error) => Result.error(error),
      (value) => Result.ok(
        value.map((x) => CategoryDetailsModel.fromJson(x)).toList(),
      ),
    );
  }

  Future<Result<List<YourRecipeModel>>> getYourRecipes(Map<String, dynamic> queryParams) async {
    if (yourRecipes.isNotEmpty) return Result.ok(yourRecipes);
    var result = await client.get<List>('/recipes/my-recipes', queryParams: queryParams);
    return result.fold(
      (error) => Result.error(error),
      (value) => Result.ok(
        value.map((x) => YourRecipeModel.fromJson(x)).toList(),
      ),
    );
  }

  Future<Result<List<CategoryModel>>> getCategories() async {
    final categories = await cacheCategory.getCachedCategories();
    if (categories.isNotEmpty) return Result.ok(categories);
    var result = await client.get<List>('/categories/list');

    return result.fold(
      (error) => Result.error(error),
      (value) {
        final categories = value.map((x) => CategoryModel.fromJson(x)).toList();
        cacheCategory.cacheCategories(categories);
        return Result.ok(categories);
      },
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

  Future<Result<String>> addReview(ReviewModel model) async {
    var result = await client.post<Map<String, dynamic>>('/reviews/create', data: FormData.fromMap(model.toJson()));
    return result.fold(
      (error) => Result.error(error),
      (value) => Result.ok('ok'),
    );
  }

  Future<Result<List<CommunityModel>>> getCommunities(Map<String, dynamic> queryParams) async {
    if (communities.isNotEmpty) return Result.ok(communities);
    var result = await client.get<List>('/recipes/community/list', queryParams: queryParams);
    return result.fold(
          (error) => Result.error(error),
          (value) => Result.ok(value.map((x) => CommunityModel.fromJson(x)).toList()),
    );
  }
}
