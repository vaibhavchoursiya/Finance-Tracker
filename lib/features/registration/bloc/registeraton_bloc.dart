import 'package:finence_tracker/features/registration/bloc/registration_event.dart';
import 'package:finence_tracker/features/registration/bloc/registration_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterationBloc extends Bloc<RegistrationEvent, RegistrationState> {
  RegisterationBloc() : super(RegistrationState(showPassword: false)) {
    on<PasswordToggleEvent>((event, emit) {
      emit(RegistrationState(showPassword: !state.showPassword!));
    });
    on<RegisterationUserEvent>((event, emit) async {
      await Future.delayed(const Duration(seconds: 2));

      emit(RegistrationState(
          showPassword: false,
          message: "User is not registered.",
          isSuccess: true));
    });
  }
}
