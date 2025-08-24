import 'package:restourant_mobile_app/data/models/users/chef.dart';

class CommunityModel {
  final int id;
  final String title;
  final String description;
  final String photo;
  final int timeRequired;
  final num rating;
  final int reviewsCount;
  final DateTime created;
  final ChefModel user;

  CommunityModel({
    required this.id,
    required this.title,
    required this.description,
    required this.photo,
    required this.timeRequired,
    required this.rating,
    required this.reviewsCount,
    required this.created,
    required this.user,
  });

  factory CommunityModel.fromJson(Map<String, dynamic> json) => CommunityModel(
    id: json["id"],
    title: json["title"],
    description: json["description"],
    photo: json["photo"],
    timeRequired: json["timeRequired"],
    rating: json["rating"],
    reviewsCount: json["reviewsCount"],
    created: DateTime.parse(json["created"]),
    user: ChefModel.fromJson(json["user"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
    "description": description,
    "photo": photo,
    "timeRequired": timeRequired,
    "rating": rating,
    "reviewsCount": reviewsCount,
    "created": created.toIso8601String(),
    "user": user.toJson(),
  };
}