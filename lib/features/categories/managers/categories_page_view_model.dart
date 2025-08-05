import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:restourant_mobile_app/core/client.dart';

class CategoriesPageViewModel extends ChangeNotifier{
  List categories = [];
  bool loading = true;
  CategoriesPageViewModel(){
    getCategories();
  }

  void getCategories()async{
    var response = await dio.get("/categories/list",);
    if(response.statusCode != 200){
      throw Exception("Something went wrong!\n${response.data}");
    }
    categories = response.data;
    loading = false;
    notifyListeners();
  }
}