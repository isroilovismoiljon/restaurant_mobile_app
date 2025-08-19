import 'package:restourant_mobile_app/data/models/users/chef.dart';

class ReviewModel {
  final int id, reviewsCount;
  final String title, photo;
  final num rating;
  final ChefModel chef;

  ReviewModel({
    required this.id,
    required this.reviewsCount,
    required this.title,
    required this.photo,
    required this.rating,
    required this.chef,
  });

  factory ReviewModel.fromJson(Map<String, dynamic> json) {
    return ReviewModel(
      id: json['id'],
      reviewsCount: json['reviewsCount'],
      title: json['title'],
      photo: json['photo'],
      rating: json['rating'],
      chef: ChefModel.fromJson(json["user"]),
    );
  }
}
