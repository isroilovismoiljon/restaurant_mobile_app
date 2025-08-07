class AllergicModel {
  final int id;
  final String image, title;

  AllergicModel({required this.id, required this.image, required this.title});

  factory AllergicModel.fromJson(Map<String, dynamic> json) {
    return AllergicModel(
      id: json['id'],
      image: json['image'],
      title: json['title'],
    );
  }
}
