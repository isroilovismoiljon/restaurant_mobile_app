import 'package:flutter/cupertino.dart';
import 'package:restourant_mobile_app/data/models/recipes/your_recipe_model.dart';
import 'package:restourant_mobile_app/data/repositories/recipe_repository.dart';

class YourRecipeViewModel extends ChangeNotifier{
  List<YourRecipeModel> mostViewedToday = [];
  List<YourRecipeModel> allYourRecipes = [];
  bool isLoadingMostViewed = true;
  bool isLoadingAllYourRecipes = true;
  String? errorMostViewed;
  String? errorAllYourRecipes;
  final RecipeRepository _repository;

  YourRecipeViewModel({required RecipeRepository repository}) : _repository = repository{
    getMostViewed();
    getYourRecipes();
  }
  
  Future<void> getMostViewed()async{
    isLoadingMostViewed = true;
    notifyListeners();
    var result = await _repository.getYourRecipes({'Limit' : 2});
    result.fold((error) => errorMostViewed = error.toString(), (value) {
      mostViewedToday = value;
      errorMostViewed = null;
    },);
    isLoadingMostViewed = false;
    notifyListeners();
  }
  Future<void> getYourRecipes()async{
    isLoadingAllYourRecipes = true;
    notifyListeners();
    var result = await _repository.getYourRecipes({});
    result.fold((error) => errorAllYourRecipes = error.toString(), (value) {
      allYourRecipes = value;
      errorAllYourRecipes = null;
    },);
    isLoadingAllYourRecipes = false;
    notifyListeners();
  }
}