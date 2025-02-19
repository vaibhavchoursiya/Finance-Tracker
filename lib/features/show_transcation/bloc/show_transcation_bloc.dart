import 'package:finence_tracker/features/show_transcation/bloc/show_transcation_event.dart';
import 'package:finence_tracker/features/show_transcation/bloc/show_transcation_state.dart';
import 'package:finence_tracker/services/db_services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ShowTranscationBloc
    extends Bloc<ShowTranscationEvent, ShowTranscationState> {
  ShowTranscationBloc() : super(ShowTranscationInitialState()) {
    on<ShowTranscationEvent>((event, emit) async {
      emit(ShowTranscationLoadingState());
      final List transcatins = await DbServices.getTranscations();
      emit(ShowTranscationSuccessState(transcatins: transcatins));
    });
  }
}
