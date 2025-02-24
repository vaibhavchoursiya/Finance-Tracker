import 'package:finence_tracker/models/transaction_model.dart';

abstract class SearchState {}

class LoadingSearchState extends SearchState {}

class LoadedSearchState extends SearchState {
  final List<TransactionModel> transactions;

  LoadedSearchState({required this.transactions});
}
