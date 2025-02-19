import 'package:finence_tracker/features/auth/bloc/auth_event.dart';
import 'package:finence_tracker/features/auth/bloc/auth_state.dart';
import 'package:finence_tracker/models/user_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitialState()) {
    on<RegisterEvent>((event, emit) async {
      emit(AuthLoadingState());
      final res = await Future.delayed(const Duration(seconds: 2), () {
        return true;
      });

      final UserModel user = UserModel(
          name: event.name, email: event.email, password: event.password);
      if (res) {
        emit(AuthSuccessState(user: user));
      } else {
        emit(AuthFailedState(errorMessage: "unable to register"));
      }
    });
  }
}
