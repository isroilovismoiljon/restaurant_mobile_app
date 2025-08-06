import 'package:flutter/foundation.dart';
import 'package:go_router/go_router.dart';

import '../../../core/client.dart';
import '../../../data/models/onboarding/cuisine_model.dart';

class CuisineViewModel extends ChangeNotifier{
  List<CuisineModel> cuisines = [];
  bool loading = false;
  CuisineViewModel(){
    getCuisines();
}
  
  void getCuisines()async{
    var response = await dio.get("/cuisines/list");
    if(response.statusCode != 200){
      throw Exception("Something wrong!");
    }
    cuisines = (response.data as List).map((e) => CuisineModel.fromJson(e)).toList();
    loading = false;
    notifyListeners();
  }
}