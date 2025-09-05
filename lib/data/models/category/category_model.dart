import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

part 'category_model.g.dart';

@JsonSerializable()
@HiveType(typeId: 0)
class CategoryModel {
  @HiveField(0)
  @JsonKey(includeToJson: false)
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
