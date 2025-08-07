import 'package:flutter/material.dart';
import 'package:restourant_mobile_app/core/client.dart';
import 'package:restourant_mobile_app/data/models/categories/recipe_model.dart';

class RecipeViewModel extends ChangeNotifier {
  RecipeModel? recipe;
  bool isLoading = true;
  RecipeViewModel(int id){
    getRecipes(id);
  }

  void getRecipes(int id)async{
    isLoading = true;
    notifyListeners();
    var response = await dio.get("/recipes/detail/$id");
    recipe = RecipeModel.fromJson(response.data);
    if (response.statusCode != 200) {
      throw Exception("Something went wrong!\n${response.data}");
    }
    isLoading = false;
    notifyListeners();
  }
}


