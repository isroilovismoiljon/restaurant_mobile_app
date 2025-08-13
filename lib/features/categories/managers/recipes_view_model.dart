import 'package:flutter/material.dart';
import 'package:restourant_mobile_app/core/utils/result.dart';
import '../../../data/models/recipes/recipe_model.dart';
import '../../../data/repositories/recipes/recipe_repository.dart';

class RecipeViewModel extends ChangeNotifier {
  final RecipeRepository recipeRepository;

  RecipeModel? recipe;
  bool isLoading = true;
  String? error;

  RecipeViewModel({required this.recipeRepository, required int id}) {
    getRecipes(id);
  }

  Future<void> getRecipes(int id) async {
    isLoading = true;
    error = null;
    notifyListeners();

    final result = await recipeRepository.getById(id);
    if (result is Ok) {
      recipe = (result as Ok).value;
    } else {
      error = (result as Error).error.toString();
    }
    isLoading = false;
    notifyListeners();
  }
}
