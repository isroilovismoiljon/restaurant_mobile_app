class RegisterModel {
  final String username, firstName, lastName, email, phoneNumber, birthDate, password;
  final int? cookingLevelId;
  final List<int>? allergicIngredients, cuisines;

  RegisterModel({
    required this.username,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.phoneNumber,
    required this.birthDate,
    required this.password,
    this.cookingLevelId,
    this.allergicIngredients,
    this.cuisines,
  });

  Map<String, dynamic> toJson() => {
    "username": username,
    "firstName": firstName,
    "lastName": lastName,
    "email": email,
    "phoneNumber": phoneNumber,
    "birthDate": birthDate,
    "password": password,
    "cookingLevelId": cookingLevelId,
    "allergicIngredients": allergicIngredients == null
        ? null
        : List<dynamic>.from(allergicIngredients!.map((x) => x)),
    "cuisines": cuisines == null
        ? null
        : List<dynamic>.from(cuisines!.map((x) => x)),
  };
}
