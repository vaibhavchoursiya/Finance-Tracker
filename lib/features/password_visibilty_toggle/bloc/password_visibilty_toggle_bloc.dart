import 'package:finence_tracker/features/password_visibilty_toggle/bloc/password_visibilty_toggle_event.dart';
import 'package:finence_tracker/features/password_visibilty_toggle/bloc/password_visibilty_toggle_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PasswordVisibiltyToggleBloc
    extends Bloc<PasswordVisibiltyToggleEvent, PasswordVisibiltyToggleState> {
  PasswordVisibiltyToggleBloc() : super(PasswordVisibiltyToggleState()) {
    // Toggle Password Visbility
    on<PasswordVisibiltyToggle>((event, emit) {
      emit(PasswordVisibiltyToggleState(
          passwordVisibilty: !state.passwordVisibilty));
    });
  }
}
