import 'package:flutter/cupertino.dart';
import '../../../core/client.dart';

class CategoryDetailsViewModel extends ChangeNotifier{
  List categoryDetails = [];
  bool loading = true;

  CategoryDetailsViewModel(int id){
    getCategoryDetails(id);
  }

  void getCategoryDetails(int categoryId)async{
    var response = await dio.get("/recipes/list?Category=$categoryId");
    if(response.statusCode != 200){
      throw Exception("Something went wrong!\n${response.data}");
    }
    categoryDetails = response.data;
    loading = false;
    notifyListeners();
  }
}
