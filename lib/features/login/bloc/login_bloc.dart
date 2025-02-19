import 'package:finence_tracker/features/login/bloc/login_event.dart';
import 'package:finence_tracker/features/login/bloc/login_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginInitialState()) {
    on<LoginUserEvent>((event, emit) async {
      emit(LoginLoadingState());
      final res = await Future.delayed(const Duration(seconds: 2), () {
        return true;
      });

      if (res) {
        emit(LoginSuccessState(name: "vaibhav"));
      } else {
        emit(LoginFailedState(errorMessage: "unable to login"));
      }
    });

    on<LoginOutEvent>((event, emit) {});
  }
}
