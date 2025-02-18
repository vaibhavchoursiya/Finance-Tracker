class RegistrationState {
  final bool? showPassword;
  final String? name;
  final String? email;
  final String? password;
  final String message;
  final bool isSuccess;

  RegistrationState(
      {this.name,
      this.email,
      this.password,
      this.showPassword,
      this.isSuccess = false,
      this.message = ""});
}
