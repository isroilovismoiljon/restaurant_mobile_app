import 'package:flutter/widgets.dart';
import 'package:restourant_mobile_app/data/models/recipes/recipe_model.dart';
import 'package:restourant_mobile_app/data/models/recipes/trending_recipe.dart';
import 'package:restourant_mobile_app/data/repositories/recipe_repository.dart';

import '../../../core/utils/result.dart';

class TrendingRecipesViewModel extends ChangeNotifier {
  TrendingRecipeModel? trendingRecipe;
  List<RecipeModel> recipes = [];

  bool trendingRecipeIsLoading = true;
  String? trendingRecipeError;

  bool recipesIsLoading = true;
  String? recipesError;
  final RecipeRepository _recipeRepository;

  TrendingRecipesViewModel({
    required RecipeRepository recipeRepo,
  }) : _recipeRepository = recipeRepo{
    getTrendingRecipe();
    getRecipes();
  }

  Future<void> getTrendingRecipe() async {
    trendingRecipeIsLoading = true;
    notifyListeners();
    final result = await _recipeRepository.getTrendingRecipe();
    result.fold(
      (error) {
        trendingRecipeError = error.toString();
        trendingRecipeIsLoading = false;
        notifyListeners();
      },
      (value) {
        trendingRecipe = value;
        trendingRecipeIsLoading = false;
        notifyListeners();
      },
    );
  }
  
  Future<void> getRecipes() async {
    recipesIsLoading = true;
    recipesError = null;
    notifyListeners();
    final result = await _recipeRepository.getCategoryDetails({
    'Category': 3
    });

    if (result is Ok) {
      recipes = (result as Ok).value;
    } else{
      recipesError = (result as Error).error.toString();
    }
    recipesIsLoading = false;
    notifyListeners();
  }
}
