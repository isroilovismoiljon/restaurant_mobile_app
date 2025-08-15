import 'package:flutter/cupertino.dart';
import 'package:restourant_mobile_app/core/utils/result.dart';
import 'package:restourant_mobile_app/data/repositories/recipe_repository.dart';
import '../../../data/models/recipes/category_details_model.dart';
import '../../../data/models/recipes/category_model.dart';

class CategoryDetailsViewModel extends ChangeNotifier {
  List<CategoryDetailsModel> categoryDetails = [];
  List<CategoryModel> categories = [];
  int selectedCategoryId;
  String selectedCategoryTitle = '';
  bool categoryDetailsLoading = true;
  bool categoriesLoading = true;
  String? categoriesError;
  String? categoryDetailsError;

  final RecipeRepository _repository;

  CategoryDetailsViewModel(
    this.selectedCategoryId, {
    required RecipeRepository recipeRepo,
  }) : _repository = recipeRepo;

  Future<void> getCategoryDetails(int categoryId, String? title) async {
    categoryDetailsLoading = true;
    notifyListeners();
    final result = await _repository.getCategoryDetails(selectedCategoryId);

    if (result is Ok) {
      categoryDetails = (result as Ok).value;
      selectedCategoryId = categoryId;
      if (title != null) {
        selectedCategoryTitle = title;
      }
    } else {
      categoryDetailsError = (result as Error).error.toString();
    }
    categoryDetailsLoading = false;
    notifyListeners();
  }

  Future<void> getCategories() async {
    categoriesLoading = true;
    notifyListeners();
    final result = await _repository.getCategories();
    if (result is Ok) {
      categories = (result as Ok).value;
    } else{
      categoriesError = (result as Error).error.toString();
    }
    categoriesLoading = false;
    notifyListeners();
  }
}
