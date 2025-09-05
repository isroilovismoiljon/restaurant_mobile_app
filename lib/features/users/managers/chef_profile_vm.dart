import 'package:flutter/material.dart';
import 'package:restourant_mobile_app/core/client.dart';
import 'package:restourant_mobile_app/core/utils/result.dart';
import 'package:restourant_mobile_app/data/models/recipes/recipe_details_model.dart';
import 'package:restourant_mobile_app/data/models/users/chef.dart';
import 'package:restourant_mobile_app/data/repositories/recipe_repository.dart';
import 'package:restourant_mobile_app/data/repositories/users_repository.dart';

class ChefProfileViewModel extends ChangeNotifier {
  ChefModel? chef;
  bool isLoadingChef = true;
  bool isLoadingFollow = true;
  String? errorChef;
  String? errorFollow;
  List<RecipeDetailsModel> categoryDetails = [];
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
    result.fold((error) => errorChef = error.toString(), (value) {
      chef = value;
      errorChef = null;
    },);
    isLoadingChef = false;
    notifyListeners();
  }

  Future<void> getCategoryDetails(int chefId) async {
    isLoadingCategoryDetails = true;
    notifyListeners();
    var result = await _repositoryRecipe.getCategoryDetails({'UserId': chefId});
    result.fold((error) => errorCategoryDetails = error.toString(), (value) {
      categoryDetails = value;
      errorCategoryDetails = null;
    },);
    isLoadingCategoryDetails = false;
    notifyListeners();
  }

  Future<String> followToUser(int userId) async {
    isLoadingFollow = true;
    notifyListeners();
    var result = await _repository.follow(userId);
    return result.fold((error) {
      isLoadingFollow = false;
      notifyListeners();
      return errorFollow = error.toString();
    }, (value) {
      isLoadingFollow = false;
      notifyListeners();
      return 'ok';
    },);
    isLoadingFollow = false;
    notifyListeners();
  }
}
