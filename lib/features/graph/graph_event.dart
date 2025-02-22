abstract class GraphEvent {}

class SwitchGraphIncomeEvent extends GraphEvent {}

class SwitchGraphExpensesEvent extends GraphEvent {}

class LoadDataGraphEvent extends GraphEvent {}

class SelectDateEvent extends GraphEvent {
  final DateTime startDate;
  final DateTime endDate;
  final String transactionType;

  SelectDateEvent(
      {required this.startDate,
      required this.endDate,
      required this.transactionType});
}
