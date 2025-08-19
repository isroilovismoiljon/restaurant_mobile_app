import 'package:flutter/material.dart';
import 'package:restourant_mobile_app/core/client.dart';
import 'package:restourant_mobile_app/core/utils/result.dart';
import 'package:restourant_mobile_app/data/models/recipes/category_details_model.dart';
import 'package:restourant_mobile_app/data/models/users/chef.dart';
import 'package:restourant_mobile_app/data/repositories/recipe_repository.dart';
import 'package:restourant_mobile_app/data/repositories/users_repository.dart';

class ChefProfileViewModel extends ChangeNotifier {
  ChefModel? chef;
  bool isLoadingChef = true;
  String? errorChef;
  List<CategoryDetailsModel> categoryDetails = [];
  bool isLoadingCategoryDetails = true;
  String? errorCategoryDetails;

  final ApiClient client;
  final UsersRepository _repository;
  final RecipeRepository _repositoryRecipe;
  final int chefId;

  ChefProfileViewModel(RecipeRepository repositoryRecipe,
      UsersRepository repository, {
        required this.client, required this.chefId,
      })
      : _repository = repository,
        _repositoryRecipe = repositoryRecipe {
    getChef(chefId);
    getCategoryDetails(chefId);
  }

  Future<void> getChef(int id) async {
    isLoadingChef = true;
    notifyListeners();
    var result = await _repository.getChef(id);
    if (result is Ok) {
      chef = (result as Ok).value;
    } else {
      errorChef = (result as Error).error.toString();
    }

    isLoadingChef = false;
    notifyListeners();
  }

  Future<void> getCategoryDetails(int chefId) async {
    isLoadingCategoryDetails = true;
    notifyListeners();
    var result = await _repositoryRecipe.getCategoryDetails({'UserId': chefId});
    if (result is Ok) {
      categoryDetails = (result as Ok).value;
    } else {
      errorCategoryDetails = (result as Error).error.toString();
    }
    isLoadingChef = false;
    notifyListeners();
  }
}
