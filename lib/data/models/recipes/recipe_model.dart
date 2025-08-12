import '../users/chef.dart';

class RecipeModel {
  final int id, categoryId, timeRequired, reviewsCount;
  final String title, description, photo, videoRecipe, difficulty;
  final num rating;
  final ChefModel chef;
  List<Instruction> instructions;
  List<Ingredient> ingredients;

  RecipeModel({
    required this.id,
    required this.categoryId,
    required this.timeRequired,
    required this.reviewsCount,
    required this.title,
    required this.description,
    required this.photo,
    required this.videoRecipe,
    required this.difficulty,
    required this.rating,
    required this.chef,
    required this.instructions,
    required this.ingredients,
  });

  factory RecipeModel.fromJson(Map<String, dynamic> json) {
    return RecipeModel(
      id: json['id'],
      categoryId: json['categoryId'],
      timeRequired: json['timeRequired'],
      reviewsCount: json['reviewsCount'],
      title: json['title'],
      description: json['description'],
      photo: json['photo'],
      videoRecipe: json['videoRecipe'],
      difficulty: json['difficulty'],
      rating: json['rating'],
      chef: ChefModel.fromJson(json["user"]),
      instructions: List<Instruction>.from(json["instructions"].map((x) => Instruction.fromJson(x))),
      ingredients: List<Ingredient>.from(json["ingredients"].map((x) => Ingredient.fromJson(x))),
    );
  }
}

class Ingredient {
  String amount;
  String name;
  int order;

  Ingredient({
    required this.amount,
    required this.name,
    required this.order,
  });

  factory Ingredient.fromJson(Map<String, dynamic> json) => Ingredient(
    amount: json["amount"],
    name: json["name"],
    order: json["order"],
  );
}

class Instruction {
  String text;
  int order;

  Instruction({
    required this.text,
    required this.order,
  });

  factory Instruction.fromJson(Map<String, dynamic> json) => Instruction(
    text: json["text"],
    order: json["order"],
  );
}
