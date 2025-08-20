import 'package:flutter/material.dart';
import 'package:restourant_mobile_app/data/models/recipes/recipe_review_model.dart';
import 'package:restourant_mobile_app/data/models/recipes/review_model.dart';
import 'package:restourant_mobile_app/data/repositories/recipe_repository.dart';

class ReviewsViewModel extends ChangeNotifier {
  RecipeReviewModel? reviewModel;
  bool isLoadingRecipe = true;
  String? errorRecipe;

  List<ReviewModel> reviews = [];
  bool isLoadingReviews = true;
  String? errorReviews;

  final RecipeRepository _repository;

  ReviewsViewModel({required int recipeId, required RecipeRepository repository}) : _repository = repository {
    getRecipe(recipeId);
    getReviews(recipeId);
  }

  Future<void> getRecipe(int recipeId) async {
    isLoadingRecipe = true;
    notifyListeners();
    var result = await _repository.getRecipeReview(recipeId);
    result.fold(
      (error) => errorRecipe = error.toString(),
      (value) => reviewModel = value,
    );
    isLoadingRecipe = false;
    notifyListeners();
  }

  Future<void> getReviews(int recipeId) async {
    isLoadingReviews = true;
    notifyListeners();
    var result = await _repository.getReviews(recipeId);
    result.fold(
      (error) => errorReviews = error.toString(),
      (value) => reviews = value,
    );
    isLoadingReviews = false;
    notifyListeners();
  }
}
