import 'package:finence_tracker/models/user_model.dart';

abstract class AuthState {}

class AuthInitialState extends AuthState {}

class AuthLoadingState extends AuthState {}

class AuthSuccessState extends AuthState {
  final UserModel user;
  AuthSuccessState({required this.user});
}

class AuthFailedState extends AuthState {
  final String errorMessage;
  AuthFailedState({required this.errorMessage});
}
