import 'package:flutter/foundation.dart';

import '../../../data/models/model/register_model.dart';
import '../../../data/repositories/auth/register_repository.dart';

class RegisterViewModel extends ChangeNotifier {
  final RegisterRepository repository;

  bool isLoading = false;
  String? errorMessage;
  String? accessToken;

  RegisterViewModel({required this.repository});

  Future<void> register(RegisterModel model) async {
    isLoading = true;
    errorMessage = null;
    notifyListeners();

    // 2. Repository orqali API chaqirish
    final result = await repository.register(model);

    // 3. Natijani qayta ishlash
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

    // 4. Loading stop
    isLoading = false;
    notifyListeners();
  }
}
