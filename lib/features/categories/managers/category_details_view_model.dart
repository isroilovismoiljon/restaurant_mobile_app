import 'package:flutter/cupertino.dart';
import 'package:restourant_mobile_app/core/utils/result.dart';
import 'package:restourant_mobile_app/data/repositories/recipes/category_details_repo.dart';
import '../../../data/models/recipes/category_details_model.dart';
import '../../../data/models/recipes/category_model.dart';
import '../../../data/repositories/recipes/category_repository.dart';

class CategoryDetailsViewModel extends ChangeNotifier {
  List<CategoryDetailsModel> categoryDetails = [];
  List<CategoryModel> categories = [];
  int selectedCategoryId;
  String selectedCategoryTitle = '';
  bool categoryDetailsLoading = true;
  bool categoriesLoading = true;
  String? categoriesError;
  String? categoryDetailsError;

  final CategoryRepository _categoryRepo;
  final CategoryDetailsRepository _categoryDetailsRepo;

  CategoryDetailsViewModel(
    this.selectedCategoryId, {
    required CategoryRepository categoryRepo,
    required CategoryDetailsRepository categoryDetailsRepo,
  }) : _categoryRepo = categoryRepo,
       _categoryDetailsRepo = categoryDetailsRepo;

  Future<void> getCategoryDetails(int categoryId, String? title) async {
    categoryDetailsLoading = true;
    notifyListeners();
    final result = await _categoryDetailsRepo.getAll(selectedCategoryId);

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
    final result = await _categoryRepo.getAll();
    if (result is Ok) {
      categories = (result as Ok).value;
    } else{
      categoriesError = (result as Error).error.toString();
    }
    categoriesLoading = false;
    notifyListeners();
  }
}
