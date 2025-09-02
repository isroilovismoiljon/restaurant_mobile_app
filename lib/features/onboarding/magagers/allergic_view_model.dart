import 'package:flutter/foundation.dart';
import '../../../core/client.dart';
import '../../../data/models/onboarding/allergic_model.dart';

class AllergicViewModel extends ChangeNotifier{
  List<AllergicModel> allergicFoods = [];
  bool isLoading = true;
  AllergicViewModel(){
    getCuisines();
}
  
  void getCuisines()async{
    isLoading = true;
    notifyListeners();
    var response = await dio.get("/allergic/list");
    if(response.statusCode != 200){
      throw Exception("Something wrong!");
    }
    allergicFoods = (response.data as List).map((e) => AllergicModel.fromJson(e)).toList();
    isLoading = false;
    notifyListeners();
  }
}