class UserModel {
  final String name;
  final String email;
  final String password;

  UserModel({this.name = "", required this.email, required this.password});

  factory UserModel.login(Map map) {
    return UserModel(email: map["email"], password: map["password"]);
  }

  toMap() {
    return {"name": name, "email": email, "password": password};
  }
}
