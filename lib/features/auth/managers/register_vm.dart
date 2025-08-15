import 'package:flutter/foundation.dart';
import '../../../data/models/auth/register_model.dart';
import '../../../data/repositories/authentication_repository.dart';

class RegisterViewModel extends ChangeNotifier {
  final AuthenticationRepository repository;

  bool isLoading = false;
  String? errorMessage;
  String? accessToken;

  RegisterViewModel({required this.repository});

  Future<void> register(RegisterModel model) async {
    isLoading = true;
    errorMessage = null;
    notifyListeners();

    final result = await repository.register(model);
    result.fold(
          (error) {
        errorMessage = error.toString();
        accessToken = null;
      },
          (token) {
        accessToken = token;
        errorMessage = null;
      },
    );
    isLoading = false;
    notifyListeners();
  }
}
