import 'package:flutter/material.dart';
import 'package:restourant_mobile_app/data/models/recipes/review_model.dart';
import 'package:restourant_mobile_app/data/repositories/recipe_repository.dart';

class ReviewsViewModel extends ChangeNotifier {
  ReviewModel? reviewModel;
  bool isLoading = true;
  String? errorReview;

  final RecipeRepository _repository;

  ReviewsViewModel({required int recipeId, required RecipeRepository repository})
    : _repository = repository{
    getReview(recipeId);
  }

  Future<void> getReview(int recipeId) async {
    isLoading = true;
    notifyListeners();
    var result = await _repository.getReview(recipeId);
    result.fold(
      (error) => errorReview = error.toString(),
      (value) => reviewModel = value,
    );
    isLoading = false;
    notifyListeners();
  }
}
