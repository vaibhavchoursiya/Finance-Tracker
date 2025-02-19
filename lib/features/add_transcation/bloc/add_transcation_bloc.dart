import 'package:finence_tracker/features/add_transcation/bloc/add_transcation_event.dart';
import 'package:finence_tracker/features/add_transcation/bloc/transcation_state.dart';
import 'package:finence_tracker/models/transcational_model.dart';
import 'package:finence_tracker/services/db_services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddTranscationBloc extends Bloc<TranscationEvent, TranscationState> {
  AddTranscationBloc() : super(TranscationInitialState()) {
    on<AddTranscationEvent>((event, emit) async {
      emit(TranscationLoadingState());

      final TranscationalModel transcation = TranscationalModel(
          category: event.category,
          date: DateTime.parse(event.date),
          amount: event.amount,
          transcationalType: event.transcationalType,
          note: event.note);

      final res = await DbServices.insertTranscation(transcation);
      if (res["status"] == "success") {
        emit(TranscationSuccessState(message: res["message"]));
      } else {
        emit(TranscationFailedState(errorMessage: res["errorMessage"]));
      }
    });

    on<ResetAddTranscationEvent>((event, emit) {
      emit(TranscationInitialState());
    });
  }
}
