import 'package:flutter/cupertino.dart';
import '../../../core/utils/result.dart';
import '../../../data/models/auth/login_model.dart';
import '../../../data/repositories/authentication_repository.dart';

class LoginViewModel extends ChangeNotifier {
  final AuthenticationRepository _repository;

  bool isLoading = false;
  String? errorMessage;
  String? accessToken;

  LoginViewModel({required AuthenticationRepository repository})
    : _repository = repository;

  Future<void> login(LoginModel model) async {
    isLoading = true;
    notifyListeners();

    var result = await _repository.login(model);
    result.fold(
      (error) {
        errorMessage = (result as Error).error.toString();
      },
      (value) {
        errorMessage = null;
        accessToken = (result as Ok).value;
      },
    );
    isLoading = false;
    notifyListeners();
  }
}
