import 'package:flutter/cupertino.dart';
import 'package:restourant_mobile_app/core/client.dart';

import '../../../data/models/recipes/category_model.dart';

class CategoriesPageViewModel extends ChangeNotifier {
  List<CategoryModel> categories = [];
  bool isLoading = true;

  CategoriesPageViewModel() {
    getCategories();
  }

  void getCategories() async {
    var response = await dio.get("/recipes/list");
    if (response.statusCode != 200) {
      throw Exception("Something went wrong!\n${response.data}");
    }
    categories = (response.data as List)
        .map((x) => CategoryModel.fromJson(x))
        .toList();
    isLoading = false;
    notifyListeners();
  }
}
