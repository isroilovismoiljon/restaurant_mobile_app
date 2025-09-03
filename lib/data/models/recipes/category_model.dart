import 'package:hive/hive.dart';

part 'category_model.g.dart';

@HiveType(typeId: 0)
class CategoryModel {
  @HiveField(0)
  final int id;
  @HiveField(1)
  final String image;
  @HiveField(2)
  final String title;

  CategoryModel({required this.id, required this.image, required this.title});

  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    return CategoryModel(
      id: json['id'],
      image: json['image'],
      title: json['title'],
    );
  }
}
