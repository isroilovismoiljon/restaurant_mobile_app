import 'package:flutter/widgets.dart';
import 'package:restourant_mobile_app/core/client.dart';
import '../../../data/models/onboarding/onboarding_model.dart';

class OnboardingViewModel extends ChangeNotifier{
  List<OnboardingModel> onboarding = [];
  bool isLoading = true;

  OnboardingViewModel(){
    getOnboarding();
  }

  Future<void> getOnboarding()async{
    isLoading = true;
    notifyListeners();
    var response = await dio.get('/onboarding/list');
    if(response.statusCode != 200){
      throw Exception("Something wrong!");
    }
    onboarding = (response.data as List).map((e) => OnboardingModel.fromJson(e)).toList();
    isLoading = false;
    notifyListeners();
  }
}
