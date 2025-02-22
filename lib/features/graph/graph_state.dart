abstract class GraphState {}

class LoadingGraphState extends GraphState {}

class LoadedGraphState extends GraphState {
  final String transactionType;

  LoadedGraphState({required this.transactionType});
}
