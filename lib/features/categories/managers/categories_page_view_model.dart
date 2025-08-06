import 'package:flutter/cupertino.dart';
import 'package:restourant_mobile_app/core/client.dart';
import 'package:restourant_mobile_app/data/models/categories/category_model.dart';

class CategoriesPageViewModel extends ChangeNotifier {
  List<CategoryModel> categories = [];
  bool loading = true;

  CategoriesPageViewModel() {
    getCategories();
  }

  void getCategories() async {
    var response = await dio.get("/categories/list");
    if (response.statusCode != 200) {
      throw Exception("Something went wrong!\n${response.data}");
    }
    categories = (response.data as List)
        .map((x) => CategoryModel.fromJson(x))
        .toList();
    loading = false;
    notifyListeners();
  }
}
