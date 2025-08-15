import 'package:provider/provider.dart';
import '../data/repositories/authentication_repository.dart';
import '../data/repositories/recipe_repository.dart';
import 'client.dart';

final dependencies = [
  Provider(create: (context) => ApiClient(baseUrl: "http://192.168.11.205:8888/api/v1")),
  Provider(
    create: (context) => RecipeRepository(client: context.read()),
  ),
  Provider(
    create: (context) => AuthenticationRepository(client: context.read()),
  ),
];