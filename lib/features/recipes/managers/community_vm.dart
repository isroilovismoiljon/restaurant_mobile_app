import 'package:flutter/foundation.dart';
import 'package:restourant_mobile_app/data/models/recipes/community_model.dart';
import 'package:restourant_mobile_app/data/repositories/recipe_repository.dart';

class CommunityViewModel extends ChangeNotifier {
  List<CommunityModel> communities = [];
  bool isLoading = true;
  String? errorMessage;

  final RecipeRepository _repository;

  CommunityViewModel({required RecipeRepository repository}) : _repository = repository {
    getTopCommunities();
  }

  Future<void> getTopCommunities() async {
    isLoading = true;
    notifyListeners();
    var result = await _repository.getCommunities({'Limit': 20, 'Order': 'Rating'});
    result.fold(
      (error) {
        errorMessage = error.toString();
      },
      (value) {
        communities = value;
        errorMessage = null;
      },
    );
    isLoading = false;
    notifyListeners();
  }

  Future<void> getNewCommunities() async {
    isLoading = true;
    notifyListeners();
    var result = await _repository.getCommunities({'Limit': 40, 'Order': 'Create'});
    result.fold(
      (error) {
        errorMessage = error.toString();
      },
      (value) {
        communities = value;
        errorMessage = null;
      },
    );
    isLoading = false;
    notifyListeners();
  }

  Future<void> getOldCommunities() async {
    isLoading = true;
    notifyListeners();
    var result = await _repository.getCommunities({'Limit': 40, 'Order': 'Create', 'Descending': true});
    result.fold(
      (error) {
        errorMessage = error.toString();
      },
      (value) {
        communities = value;
        errorMessage = null;
      },
    );
    isLoading = false;
    notifyListeners();
  }
}
