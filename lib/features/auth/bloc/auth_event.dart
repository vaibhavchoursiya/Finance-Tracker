abstract class AuthEvent {}

class RegisterEvent extends AuthEvent {
  final String name;
  final String email;
  final String password;

  RegisterEvent(
      {required this.name, required this.email, required this.password});
}

class ReInitializeRegisterEvent extends AuthEvent {}
