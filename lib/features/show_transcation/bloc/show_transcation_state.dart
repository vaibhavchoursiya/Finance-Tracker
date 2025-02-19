abstract class ShowTranscationState {}

class ShowTranscationInitialState extends ShowTranscationState {}

class ShowTranscationLoadingState extends ShowTranscationState {}

class ShowTranscationSuccessState extends ShowTranscationState {
  final List transcatins;

  ShowTranscationSuccessState({required this.transcatins});
}

class ShowTranscationFailedState extends ShowTranscationState {
  final String errorMessage;

  ShowTranscationFailedState({required this.errorMessage});
}
