class CuisineModel {
  final int id;
  final String image, title;

  CuisineModel({required this.id, required this.image, required this.title});

  factory CuisineModel.fromJson(Map<String, dynamic> json) {
    return CuisineModel(
      id: json['id'],
      image: json['photo'],
      title: json['title'],
    );
  }
}
