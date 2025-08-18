class ChefModel {
  int id;
  String profilePhoto, username, firstName, lastName;
  String? presentation;
  int? recipesCount, followingCount, followerCount;

  ChefModel({
    required this.id,
    required this.profilePhoto,
    required this.username,
    required this.firstName,
    required this.lastName,
    required this.presentation,
    required this.recipesCount,
    required this.followingCount,
    required this.followerCount,
  });

  factory ChefModel.fromJson(Map<String, dynamic> json) => ChefModel(
    id: json["id"],
    profilePhoto: json["profilePhoto"],
    username: json["username"],
    firstName: json["firstName"],
    lastName: json["lastName"],
    presentation: json["presentation"],
    recipesCount: json["recipesCount"],
    followingCount: json["followingCount"],
    followerCount: json["followerCount"],
  );
}