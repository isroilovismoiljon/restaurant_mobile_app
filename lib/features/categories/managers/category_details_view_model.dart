import 'package:flutter/cupertino.dart';
import 'package:restourant_mobile_app/data/models/categories/category_model.dart';
import '../../../core/client.dart';
import '../../../data/models/categories/category_details_model.dart';

class CategoryDetailsViewModel extends ChangeNotifier {
  List<CategoryDetailsModel> categoryDetails = [];
  List<CategoryModel> categories = [];
  int selectedCategoryId;
  String selectedCategoryTitle = '';
  bool categoryDetailsLoading = true;
  bool categoriesLoading = true;

  CategoryDetailsViewModel(this.selectedCategoryId) {
    getCategoryDetails(selectedCategoryId, selectedCategoryTitle);
    getCategories();
  }

  void getCategoryDetails(int categoryId, String? title) async {
    categoryDetailsLoading = true;
    notifyListeners();
    var response = await dio.get("/recipes/list?Category=$categoryId");
    if (response.statusCode != 200) {
      throw Exception("Something went wrong!\n${response.data}");
    }
    categoryDetails = (response.data as List)
        .map((x) => CategoryDetailsModel.fromJson(x))
        .toList();

    selectedCategoryId = categoryId;
    if (title != null) {
      selectedCategoryTitle = title;
    }
    categoryDetailsLoading = false;
    notifyListeners();
  }

  void getCategories() async {
    var response = await dio.get("/categories/list");
    if (response.statusCode != 200) {
      throw Exception("Something went wrong!\n${response.data}");
    }
    categories = (response.data as List)
        .map((x) => CategoryModel.fromJson(x))
        .toList();
    categoriesLoading = false;
    notifyListeners();
  }
}
