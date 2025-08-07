class ChefModel {
  int id;
  String profilePhoto;
  String username;
  String firstName;
  String lastName;

  ChefModel({
    required this.id,
    required this.profilePhoto,
    required this.username,
    required this.firstName,
    required this.lastName,
  });

  factory ChefModel.fromJson(Map<String, dynamic> json) => ChefModel(
    id: json["id"],
    profilePhoto: json["profilePhoto"],
    username: json["username"],
    firstName: json["firstName"],
    lastName: json["lastName"],
  );

}