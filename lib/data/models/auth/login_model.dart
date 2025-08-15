class LoginModel{
  final String login, password;

  LoginModel({required this.login, required this.password});

  Map<String, dynamic> toJson() => {
    'login': login,
    'password': password
  };
}