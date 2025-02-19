import 'package:finence_tracker/features/login/bloc/login_event.dart';
import 'package:finence_tracker/features/login/bloc/login_state.dart';
import 'package:finence_tracker/models/user_model.dart';
import 'package:finence_tracker/services/firebase_services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginInitialState()) {
    on<LoginUserEvent>((event, emit) async {
      emit(LoginLoadingState());

      final UserModel user =
          UserModel.login({"email": event.email, "password": event.password});

      final res = await FirebaseServices.loginUser(user);

      if (res["status"] == "success") {
        emit(LoginSuccessState(name: res["name"]));
      } else {
        emit(LoginFailedState(errorMessage: res["errorMessage"]));
      }
    });

    on<LoginOutEvent>((event, emit) async {
      await FirebaseServices.logoutUser();
      emit(LoginInitialState());
    });
  }
}
