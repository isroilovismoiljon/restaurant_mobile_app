import 'package:flutter/material.dart';
import 'package:restourant_mobile_app/data/models/users/chef.dart';
import 'package:restourant_mobile_app/data/repositories/users_repository.dart';

import '../../../core/utils/result.dart';

class TopChefsViewModel extends ChangeNotifier{

  List<ChefModel> mostViewedChefs = [];
  bool isLoadingMostViewedChefs = false;
  String? errorMostViewedChefs;
  List<ChefModel> mostLikedChefs = [];
  bool isLoadingMostLikedChefs = false;
  String? errorMostLikedChefs;
  List<ChefModel> newChefs = [];
  bool isLoadingNewChefs = false;
  String? errorNewChefs;

  final UsersRepository _repository;

  TopChefsViewModel({required UsersRepository repository}) : _repository = repository{
    getMostViewedChefs();
    getMostLikedChefs();
    getNewChefs();
  }

  Future<void> getMostViewedChefs()async{
    isLoadingMostViewedChefs = true;
    notifyListeners();
    
    final result = await _repository.getChefs({
      'Page': 1,
      'Limit': 2,
    });
    if (result is Ok) {
      mostViewedChefs = (result as Ok).value;
    }  else{
      errorMostViewedChefs = (result as Error).error.toString();
    }

    isLoadingMostViewedChefs = false;
    notifyListeners();
  }
  Future<void> getMostLikedChefs()async{
    isLoadingMostLikedChefs = true;
    notifyListeners();

    final result = await _repository.getChefs({
      'Page': 2,
      'Limit': 2,
    });
    if (result is Ok) {
      mostLikedChefs = (result as Ok).value;
    }  else{
      errorMostLikedChefs = (result as Error).error.toString();
    }

    isLoadingMostLikedChefs = false;
    notifyListeners();
  }
  Future<void> getNewChefs()async{
    isLoadingNewChefs = true;
    notifyListeners();

    final result = await _repository.getChefs({
      'Page': 3,
      'Limit': 2,
    });
    if (result is Ok) {
      newChefs = (result as Ok).value;
    }  else{
      errorNewChefs = (result as Error).error.toString();
    }

    isLoadingNewChefs = false;
    notifyListeners();
  }
}