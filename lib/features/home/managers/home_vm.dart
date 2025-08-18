import 'package:flutter/cupertino.dart';
import '../../../core/client.dart';
import '../../../data/models/recipes/category_model.dart';
import '../../../data/models/recipes/recenly_added_recipe.dart';
import '../../../data/models/recipes/trending_recipe.dart';
import '../../../data/models/recipes/your_recipe_model.dart';
import '../../../data/models/users/chef.dart';

class HomeViewModel extends ChangeNotifier {
  late TrendingRecipeModel trendingRecipe;
  bool isLoadingTrendingRecipe = true;
  List<YourRecipeModel> yourRecipes = [];
  bool isLoadingYourRecipes = true;
  List<RecentlyAddedRecipeModel> recentlyRecipes = [];
  bool isLoadingRecentlyRecipes = true;
  List<CategoryModel> categories = [];
  bool isLoadingCategories = true;
  List<ChefModel> chefs = [];
  bool isLoadingChefs = true;
  String errorYourRecipes = '';
  String errorRecentlyRecipes = '';
  String errorCategories = '';
  String errorChefs = '';
  String errorTrendingRecipe = '';

  int? selectedCategory;

  HomeViewModel() {
    getYourRecipes();
    getRecentlyAddedRecipes();
    getChefs();
    getCategories();
    getTrendingRecipe();
  }

  Future<void> getCategories() async {
    isLoadingCategories = true;
    notifyListeners();

    var response = await dio.get("/recipes/list");
    try {
      final data = response.data as List;
      categories = data.map((x) => CategoryModel.fromJson(x)).toList();
      errorCategories = '';
    } catch (e) {
      errorCategories = e.toString();
    }

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

    var response = await dio.get("/recipes/list?Page=1&Limit=2");
    try {
      final data = response.data as List;
      yourRecipes = data.map((x) => YourRecipeModel.fromJson(x)).toList();
      errorYourRecipes = '';
    } catch (e) {
      errorYourRecipes = e.toString();
    }

    isLoadingYourRecipes = false;
    notifyListeners();
  }
  Future<void> getRecentlyAddedRecipes() async {
    isLoadingRecentlyRecipes = true;
    notifyListeners();
    var response = await dio.get("/recipes/list?Page=2&Limit=2");
    try {
      final data = response.data as List;
      recentlyRecipes = data.map((x) => RecentlyAddedRecipeModel.fromJson(x)).toList();
      errorRecentlyRecipes = '';
    } catch (e) {
      errorRecentlyRecipes = e.toString();
    }
    isLoadingRecentlyRecipes = false;
    notifyListeners();
  }

  Future<void> getChefs() async {
    isLoadingChefs = true;
    notifyListeners();
    var response= await dio.get("/top-chefs/list?Limit=4");
    try {
      final data = response.data as List;
      chefs = data.map((x) => ChefModel.fromJson(x)).toList();
      errorChefs = '';
    } catch (e) {
      errorChefs = e.toString();
    }
    isLoadingChefs = false;
    notifyListeners();
  }

  Future<void> getTrendingRecipe() async {
    isLoadingTrendingRecipe = true;
    notifyListeners();
    var response = await dio.get("/recipes/trending-recipe");
    try {
      final data = response.data;
      trendingRecipe = TrendingRecipeModel.fromJson(data);
      errorTrendingRecipe = '';
    } catch (e) {
      errorTrendingRecipe = e.toString();
    }
    isLoadingTrendingRecipe = false;
    notifyListeners();
  }
}
