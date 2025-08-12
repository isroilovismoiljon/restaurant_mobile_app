class TrendingRecipeModel {
  final int id;
  final int categoryId;
  final String title;
  final String description;
  final String difficulty;
  final String photo;
  final int timeRequired;
  final int rating;

  TrendingRecipeModel({
    required this.id,
    required this.categoryId,
    required this.title,
    required this.description,
    required this.difficulty,
    required this.photo,
    required this.timeRequired,
    required this.rating,
  });

  factory TrendingRecipeModel.fromJson(Map<String, dynamic> json) => TrendingRecipeModel(
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