import 'package:d_chart/d_chart.dart';
import 'package:finence_tracker/features/graph/graph_event.dart';
import 'package:finence_tracker/features/graph/graph_state.dart';
import 'package:finence_tracker/models/transaction_model.dart';
import 'package:finence_tracker/services/db_services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class GraphBloc extends Bloc<GraphEvent, GraphState> {
  GraphBloc() : super(LoadingGraphState()) {
    on<LoadDataGraphEvent>(_loadDataGraphEvent);
    on<SwitchGraphExpensesEvent>(_switchGraphExpensesEvent);
    on<SwitchGraphIncomeEvent>(_switchGraphIncomeEvent);

    on<SelectDateEvent>(_selectDateEvent);
  }

  /// /////////////////// Helper Methods ///////////////////////////////////////////////////
  int covertFormatedDateIntoUnixDate(DateTime date) {
    return date.millisecondsSinceEpoch ~/ 1000;
  }

  convertTransactionDataToTimeData(List<TransactionModel> transactions) async {
    final List<TimeData> series = [];
    for (var t in transactions) {
      series.add(TimeData(domain: t.date, measure: t.amount));
    }
    print("series data: $series");
    return series;
  }

  getTransactionsAndSeriesData(
      DateTime startDate, DateTime endDate, String transactionType) async {
    List<TransactionModel> transactions = [];
    transactions = await DbServices.getTransactionBetweenTwoDates(
        covertFormatedDateIntoUnixDate(startDate),
        covertFormatedDateIntoUnixDate(endDate),
        transactionType);

    print(transactions);
    List series = await convertTransactionDataToTimeData(transactions);

    return {"transactions": transactions, "series": series};
  }

  getGraphInitalDataBasedOnTransactionType(String transactionType) async {
    final currentDate = DateTime.now();
    final startDate = DateTime.parse(DateFormat('yyyy-MM-dd')
        .format(currentDate.subtract(const Duration(days: 15))));
    final endDate = DateTime.parse(
      DateFormat('yyyy-MM-dd').format(
        currentDate.add(
          const Duration(days: 15),
        ),
      ),
    );

    final transactionAndSeriesData =
        await getTransactionsAndSeriesData(startDate, endDate, transactionType);

    return {
      "startDate": startDate,
      "endDate": endDate,
      "series": transactionAndSeriesData["series"],
      "transactions": transactionAndSeriesData["transactions"],
      "transactionType": transactionType
    };
  }

/////////////////////////////////////////////////////////////////////
  void _loadDataGraphEvent(event, emit) async {
    emit(LoadingGraphState());

    final data = await getGraphInitalDataBasedOnTransactionType("Inc");

    emit(LoadedGraphState(
        transactionType: data["transactionType"],
        startDate: data["startDate"],
        endDate: data["endDate"],
        series: data["series"],
        transcations: data["transactions"]));
  }

  void _switchGraphExpensesEvent(event, emit) async {
    emit(LoadingGraphState());

    final data = await getGraphInitalDataBasedOnTransactionType("Exp");

    emit(LoadedGraphState(
        transactionType: data["transactionType"],
        startDate: data["startDate"],
        endDate: data["endDate"],
        series: data["series"],
        transcations: data["transactions"]));
  }

  void _switchGraphIncomeEvent(event, emit) async {
    emit(LoadingGraphState());

    final data = await getGraphInitalDataBasedOnTransactionType("Inc");

    emit(LoadedGraphState(
        transactionType: data["transactionType"],
        startDate: data["startDate"],
        endDate: data["endDate"],
        series: data["series"],
        transcations: data["transactions"]));
  }

  void _selectDateEvent(event, emit) async {
    emit(LoadingGraphState());
    final transactionAndSeriesData = await getTransactionsAndSeriesData(
        event.startDate, event.endDate, event.transactionType);

    emit(LoadedGraphState(
        transactionType: event.transactionType,
        startDate: event.startDate,
        endDate: event.endDate,
        series: transactionAndSeriesData["series"],
        transcations: transactionAndSeriesData["transactions"]));
  }
}
