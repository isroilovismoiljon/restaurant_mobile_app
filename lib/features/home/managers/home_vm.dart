import 'package:flutter/cupertino.dart';
import 'package:restourant_mobile_app/data/models/recipes/category_details_model.dart';
import 'package:restourant_mobile_app/data/models/recipes/your_recipe_model.dart';
import 'package:restourant_mobile_app/data/repositories/recipe_repository.dart';
import 'package:restourant_mobile_app/data/repositories/users_repository.dart';
import '../../../data/models/recipes/category_model.dart';
import '../../../data/models/recipes/trending_recipe.dart';
import '../../../data/models/users/chef.dart';

class HomeViewModel extends ChangeNotifier {
  late TrendingRecipeModel trendingRecipe;
  bool isLoadingTrendingRecipe = true;
  List<YourRecipeModel> yourRecipes = [];
  bool isLoadingYourRecipes = true;
  List<CategoryDetailsModel> recentlyRecipes = [];
  bool isLoadingRecentlyRecipes = true;
  List<CategoryModel> categories = [];
  bool isLoadingCategories = true;
  List<ChefModel> chefs = [];
  bool isLoadingChefs = true;
  String? errorYourRecipes = '';
  String? errorRecentlyRecipes = '';
  String? errorCategories = '';
  String? errorChefs = '';
  String? errorTrendingRecipe = '';

  int? selectedCategory;
  final UsersRepository _usersRepository;
  final RecipeRepository _recipeRepository;

  HomeViewModel(
    UsersRepository usersRepository,
    RecipeRepository recipeRepository,
  ) : _recipeRepository = recipeRepository,
      _usersRepository = usersRepository {
    getYourRecipes();
    getRecentlyAddedRecipes();
    getChefs();
    getCategories();
    getTrendingRecipe();
  }

  Future<void> getCategories() async {
    isLoadingCategories = true;
    notifyListeners();

    var result = await _recipeRepository.getCategories();
    result.fold(
      (error) => errorCategories = error.toString(),
      (value) => categories = value,
    );
    isLoadingCategories = false;
    notifyListeners();
  }

  void selectCategory(int id) {
    selectedCategory = id;
    notifyListeners();
  }

  Future<void> getYourRecipes() async {
    isLoadingYourRecipes = true;
    notifyListeners();

    var result = await _recipeRepository.getYourRecipes({
      'Page': 1,
      'Limit': 2,
    });
    result.fold(
      (error) => errorYourRecipes = error.toString(),
      (value) {
        errorYourRecipes = null;
        yourRecipes = value;
      },
    );
    isLoadingYourRecipes = false;
    notifyListeners();
  }

  Future<void> getRecentlyAddedRecipes() async {
    isLoadingRecentlyRecipes = true;
    notifyListeners();
    var result = await _recipeRepository.getCategoryDetails({
      'Page': 2,
      'Limit': 2,
    });
    result.fold(
      (error) => errorRecentlyRecipes = error.toString(),
      (value) {
        errorRecentlyRecipes = null;
        recentlyRecipes = value;
      },
    );
    isLoadingRecentlyRecipes = false;
    notifyListeners();
  }

  Future<void> getChefs() async {
    isLoadingChefs = true;
    notifyListeners();
    var result = await _usersRepository.getChefs({'Limit': 4});
    result.fold(
      (error) => errorChefs = error.toString(),
      (value) {
        errorChefs = null;
        chefs = value;
      },
    );
    isLoadingChefs = false;
    notifyListeners();
  }

  Future<void> getTrendingRecipe() async {
    isLoadingTrendingRecipe = true;
    notifyListeners();
    var result = await _recipeRepository.getTrendingRecipe();
    result.fold(
      (error) => errorTrendingRecipe = error.toString(),
      (value) {
        errorTrendingRecipe = null;
        trendingRecipe = value;
      },
    );
    isLoadingTrendingRecipe = false;
    notifyListeners();
  }
}
