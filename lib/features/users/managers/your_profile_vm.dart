import 'package:flutter/cupertino.dart';
import 'package:restourant_mobile_app/data/models/recipes/your_recipe_model.dart';
import '../../../core/client.dart';
import '../../../data/models/recipes/recipe_details_model.dart';
import '../../../data/models/users/chef.dart';
import '../../../data/repositories/recipe_repository.dart';
import '../../../data/repositories/users_repository.dart';

class YourProfileViewModel extends ChangeNotifier {
  ChefModel? user;
  bool isLoadingUser = true;
  bool isLoadingFollow = true;
  String? errorChef;
  String? errorFollow;
  List<YourRecipeModel> yourRecipe = [];
  bool isLoadingYourRecipe = true;
  String? errorYourRecipe;
  List<YourRecipeModel> favourite = [];
  bool isLoadingFavourite = true;
  String? errorFavourite;

  final ApiClient client;
  final UsersRepository _repository;
  final RecipeRepository _repositoryRecipe;

  YourProfileViewModel(RecipeRepository repositoryRecipe,
      UsersRepository repository, {
        required this.client
      })
      : _repository = repository,
        _repositoryRecipe = repositoryRecipe {
    getMe();
    getYourRecipes();
    getFavouriteRecipes();
  }

  Future<void> getMe() async {
    isLoadingUser = true;
    notifyListeners();
    var result = await _repository.getMe();
    result.fold((error) => errorChef = error.toString(), (value) {
      user = value;
      errorChef = null;
    },);
    isLoadingUser = false;
    notifyListeners();
  }

  Future<void> getYourRecipes() async {
    isLoadingYourRecipe = true;
    notifyListeners();
    var result = await _repositoryRecipe.getYourRecipes({});
    result.fold((error) => errorYourRecipe = error.toString(), (value) {
      yourRecipe = value;
      errorYourRecipe = null;
    },);
    isLoadingYourRecipe = false;
    notifyListeners();
  }

  Future<void> getFavouriteRecipes() async {
    isLoadingFavourite = true;
    notifyListeners();
    var result = await _repositoryRecipe.getYourRecipes({'Page': 2, 'Limit': 5});
    result.fold((error) => errorFavourite = error.toString(), (value) {
      favourite = value;
      errorFavourite = null;
    },);
    isLoadingFavourite = false;
    notifyListeners();
  }
}
