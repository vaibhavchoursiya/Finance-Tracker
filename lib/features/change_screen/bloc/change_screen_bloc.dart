import 'package:finence_tracker/features/change_screen/bloc/change_screen_event.dart';
import 'package:finence_tracker/features/change_screen/bloc/change_screen_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChangeScreenBloc extends Bloc<ChangeScreenEvent, ChangeScreenState> {
  ChangeScreenBloc() : super(ChangeScreenState(currentIndex: 0)) {
    on<ChangeScreen>((event, emit) {
      emit(ChangeScreenState(currentIndex: event.currentIndex));
    });
  }
}
