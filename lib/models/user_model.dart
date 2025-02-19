class UserModel {
  final String name;
  final String email;
  final String password;

  UserModel({required this.name, required this.email, required this.password});

  toMap() {
    return {"name": name, "email": email, "password": password};
  }
}
