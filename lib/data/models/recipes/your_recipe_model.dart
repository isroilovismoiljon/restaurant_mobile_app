class YourRecipeModel {
  final int id, categoryId;
  final String title, description, difficulty, photo;
  final int timeRequired;
  final num rating;

  YourRecipeModel({
    required this.id,
    required this.categoryId,
    required this.title,
    required this.description,
    required this.difficulty,
    required this.photo,
    required this.timeRequired,
    required this.rating,
  });

  factory YourRecipeModel.fromJson(Map<String, dynamic> json) => YourRecipeModel(
    id: json["id"],
    categoryId: json["categoryId"],
    title: json["title"],
    description: json["description"],
    difficulty: json["difficulty"],
    photo: json["photo"],
    timeRequired: json["timeRequired"],
    rating: json["rating"],
  );
}
