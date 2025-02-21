import 'package:finence_tracker/features/transaction/bloc/transaction_event.dart';
import 'package:finence_tracker/features/transaction/bloc/transaction_state.dart';
import 'package:finence_tracker/services/db_services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TransactionBloc extends Bloc<TransactionEvent, TransactionState> {
  TransactionBloc() : super(InitialTransaction()) {
    on<LoadTransactionEvent>(_loadTransactionEvent);
    on<DeleteTransactionEvent>(_deleteTransactionEvent);
  }

  void _loadTransactionEvent(event, emit) async {
    emit(LoadingTransaction());
    final List transactions = await DbServices.getTranscations();
    final Map balanceInfo = await DbServices.getBalance();
    emit(LoadedTransaction(
        transactions: transactions,
        totalBalance: balanceInfo["totalBalance"],
        totalIncome: balanceInfo["totalIncome"],
        totalExpenses: balanceInfo["totalExpenses"]));
  }

  void _deleteTransactionEvent(event, emit) async {
    emit(LoadingTransaction());
    await DbServices.deleteTranscation(event.id);
    final List transactions = await DbServices.getTranscations();
    final Map balanceInfo = await DbServices.getBalance();
    emit(LoadedTransaction(
        transactions: transactions,
        totalBalance: balanceInfo["totalBalance"],
        totalIncome: balanceInfo["totalIncome"],
        totalExpenses: balanceInfo["totalExpenses"]));
  }
}
