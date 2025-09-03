import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:provider/provider.dart';
import '../data/repositories/authentication_repository.dart';
import '../data/repositories/recipe_repository.dart';
import '../data/repositories/users_repository.dart';
import '../features/common/managers/theme_mode_view_model.dart';
import 'auth_interceptor.dart';
import 'client.dart';

final dependencies = [
  Provider(create: (context) => FlutterSecureStorage()),
  Provider(create: (context) => AuthInterceptor(secureStorage: context.read())),
  Provider(
    create: (context) => ApiClient(interceptor: context.read(), baseUrl: "http://192.168.9.118:8888/api/v1"),
  ),
  Provider(create: (context) => RecipeRepository(client: context.read())),
  Provider(
    create: (context) => AuthenticationRepository(client: context.read(), secureStorage: context.read()),
  ),
  Provider(create: (context) => UsersRepository(client: context.read())),
  ChangeNotifierProvider(create: (context) => ThemeModeViewModel()),
];