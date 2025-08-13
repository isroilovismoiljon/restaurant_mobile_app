import 'package:flutter/cupertino.dart';
import 'package:restourant_mobile_app/core/utils/result.dart';
import 'package:restourant_mobile_app/data/repositories/recipes/category_repository.dart';
import '../../../data/models/recipes/category_model.dart';

class CategoriesPageViewModel extends ChangeNotifier {
  List<CategoryModel> categories = [];
  bool isLoading = true;
  String? error;

  CategoriesPageViewModel({required CategoryRepository categoryRepo})
    : _categoryRepo = categoryRepo;
  final CategoryRepository _categoryRepo;

  Future<void> getCategories() async {
    isLoading = true;
    notifyListeners();

    final result = await _categoryRepo.getAll(); // Result<List<CategoryModel>>

    if (result is Ok) {
      categories = (result as Ok).value;
    }  else{
      error = (result as Error).error.toString();
    }

    isLoading = false;
    notifyListeners();
  }

}
