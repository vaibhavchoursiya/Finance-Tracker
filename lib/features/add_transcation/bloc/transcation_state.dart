abstract class TranscationState {}

class TranscationInitialState extends TranscationState {}

class TranscationLoadingState extends TranscationState {}

class TranscationSuccessState extends TranscationState {
  final String message;

  TranscationSuccessState({required this.message});
}

class TranscationFailedState extends TranscationState {
  final String errorMessage;

  TranscationFailedState({required this.errorMessage});
}
