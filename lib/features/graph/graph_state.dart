import 'package:d_chart/d_chart.dart';
import 'package:finence_tracker/models/transaction_model.dart';

abstract class GraphState {}

class LoadingGraphState extends GraphState {}

class LoadedGraphState extends GraphState {
  final String transactionType;
  final DateTime startDate;
  final DateTime endDate;
  final List<TimeData> series;
  final List<TransactionModel> transcations;

  LoadedGraphState(
      {required this.startDate,
      required this.endDate,
      required this.series,
      required this.transcations,
      required this.transactionType});
}
