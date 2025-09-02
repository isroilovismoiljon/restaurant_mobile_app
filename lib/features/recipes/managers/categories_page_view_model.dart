import 'package:flutter/cupertino.dart';
import 'package:restourant_mobile_app/core/utils/result.dart';
import '../../../data/models/recipes/category_model.dart';
import '../../../data/repositories/recipe_repository.dart';

class CategoriesPageViewModel extends ChangeNotifier {
  List<CategoryModel> categories = [];
  bool isLoading = true;
  String? error;


  CategoriesPageViewModel(RecipeRepository categoryRepo)
    : _repository = categoryRepo{
    getCategories();
  }
  final RecipeRepository _repository;

  Future<void> getCategories() async {
    isLoading = true;
    notifyListeners();

    var result = await _repository.getCategories();
    if (result is Ok) {
      categories = (result as Ok).value;
    }  else{
      error = (result as Error).error.toString();
    }

    isLoading = false;
    notifyListeners();
  }

}
