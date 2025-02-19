import 'package:finence_tracker/features/auth/bloc/auth_event.dart';
import 'package:finence_tracker/features/auth/bloc/auth_state.dart';
import 'package:finence_tracker/models/user_model.dart';
import 'package:finence_tracker/services/firebase_services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitialState()) {
    on<RegisterEvent>((event, emit) async {
      emit(AuthLoadingState());

      final UserModel user = UserModel(
          name: event.name, email: event.email, password: event.password);

      final res = await FirebaseServices.createUser(user);

      if (res["status"] == "success") {
        emit(AuthSuccessState(id: res["id"]));
      } else {
        emit(AuthFailedState(errorMessage: res["errorMessage"]));
      }
    });
  }
}
