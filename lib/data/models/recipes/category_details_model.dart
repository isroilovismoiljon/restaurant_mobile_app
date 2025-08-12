class CategoryDetailsModel {
  final int id, categoryId, timeRequired;
  final num rating;
  final String title, description, difficulty, photo;

  CategoryDetailsModel({
    required this.id,
    required this.categoryId,
    required this.timeRequired,
    required this.rating,
    required this.title,
    required this.description,
    required this.difficulty,
    required this.photo,
  });

  factory CategoryDetailsModel.fromJson(Map<String, dynamic> json){
    return CategoryDetailsModel(id: json['id'],
        categoryId: json['categoryId'],
        timeRequired: json['timeRequired'],
        rating: json['rating'],
        title: json['title'],
        description: json['description'],
        difficulty: json['difficulty'],
        photo: json['photo']);
  }
}
