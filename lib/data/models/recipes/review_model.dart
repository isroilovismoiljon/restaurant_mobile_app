import 'dart:io';

import 'package:restourant_mobile_app/data/models/users/chef.dart';

class ReviewModel {
  final int? id;
  final int? recipeId;
  final num rating;
  final String comment;
  final File? image;
  final String? imageUrl;
  final ChefModel? user;
  final String? created;
  final bool? recommend;

  ReviewModel({
    this.id,
    required this.rating,
    required this.comment,
    this.image,
    this.imageUrl,
    this.user,
    this.created,
    this.recipeId,
    required this.recommend,
  });

  factory ReviewModel.fromJson(Map<String, dynamic> json) {
    return ReviewModel(
      id: json['id'],
      rating: json['rating'],
      comment: json['comment'],
      imageUrl: json['image'],
      user: ChefModel.fromJson(json['user']),
      created: json['created'],
      recommend: json['recommend'],
    );
  }

  Map<String, dynamic> toJson() => {
    "RecipeId": recipeId,
    "Comment": comment,
    "Rating": rating,
    "Recommend": recommend,
  };
}
