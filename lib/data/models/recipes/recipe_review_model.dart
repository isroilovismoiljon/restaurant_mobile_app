import 'package:restourant_mobile_app/data/models/users/chef.dart';

class RecipeReviewModel {
  final int id, reviewsCount;
  final String title, photo;
  final num rating;
  final ChefModel chef;

  RecipeReviewModel({
    required this.id,
    required this.reviewsCount,
    required this.title,
    required this.photo,
    required this.rating,
    required this.chef,
  });

  factory RecipeReviewModel.fromJson(Map<String, dynamic> json) {
    return RecipeReviewModel(
      id: json['id'],
      reviewsCount: json['reviewsCount'],
      title: json['title'],
      photo: json['photo'],
      rating: json['rating'],
      chef: ChefModel.fromJson(json["user"]),
    );
  }
}
