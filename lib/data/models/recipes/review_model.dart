import 'package:restourant_mobile_app/data/models/users/chef.dart';

class ReviewModel {
  final int id;
  final int? recipeId;
  final num rating;
  final String comment;
  final String? image;
  final ChefModel user;
  final String created;
  final bool? recommend;

  ReviewModel({
    required this.id,
    required this.rating,
    required this.comment,
    required this.image,
    required this.user,
    required this.created,
    required this.recipeId,
    required this.recommend,
  });

  factory ReviewModel.fromJson(Map<String, dynamic> json) {
    return ReviewModel(
      id: json['id'],
      rating: json['rating'],
      comment: json['comment'],
      image: json['image'],
      user: ChefModel.fromJson(json['user']),
      created: json['created'],
      recipeId: json['recipeId'],
      recommend: json['recommend'],
    );
  }

  Map<String, dynamic> toJson() => {
    "recipeId": recipeId,
    "comment": comment,
    "rating": rating,
    "image": image,
    "recommend": recommend,
  };
}
