abstract class SearchEvent {}

class SearchTransactionEvent extends SearchEvent {
  final String? query;

  SearchTransactionEvent({this.query});
}
