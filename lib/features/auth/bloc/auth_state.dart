abstract class AuthState {}

class AuthInitialState extends AuthState {}

class AuthLoadingState extends AuthState {}

class AuthSuccessState extends AuthState {
  final String id;
  AuthSuccessState({required this.id});
}

class AuthFailedState extends AuthState {
  final String errorMessage;
  AuthFailedState({required this.errorMessage});
}
