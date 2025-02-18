abstract class RegistrationEvent {}

class PasswordToggleEvent extends RegistrationEvent {}

class RegisterationUserEvent extends RegistrationEvent {
  final String name;
  final String email;
  final String password;

  RegisterationUserEvent(
      {required this.name, required this.email, required this.password});
}
