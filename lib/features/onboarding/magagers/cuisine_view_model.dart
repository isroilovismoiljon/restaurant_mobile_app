import 'package:flutter/foundation.dart';
import '../../../core/client.dart';
import '../../../data/models/onboarding/cuisine_model.dart';

class CuisineViewModel extends ChangeNotifier{
  List<CuisineModel> cuisines = [];
  bool isLoading = true;
  CuisineViewModel(){
    getCuisines();
}
  
  void getCuisines()async{
    var response = await dio.get("/cuisines/list");
    if(response.statusCode != 200){
      throw Exception("Something wrong!");
    }
    cuisines = (response.data as List).map((e) => CuisineModel.fromJson(e)).toList();
    isLoading = false;
    notifyListeners();
  }
}