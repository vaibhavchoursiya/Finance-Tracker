import 'package:finence_tracker/features/transaction/bloc/transaction_event.dart';
import 'package:finence_tracker/features/transaction/bloc/transaction_state.dart';
import 'package:finence_tracker/models/transaction_model.dart';
import 'package:finence_tracker/services/db_services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TransactionBloc extends Bloc<TransactionEvent, TransactionState> {
  TransactionBloc() : super(InitialTransaction()) {
    on<LoadTransactionEvent>(_loadTransactionEvent);
    on<DeleteTransactionEvent>(_deleteTransactionEvent);
    on<AddTransactionEvent>(_addTransactionEvent);
  }

  void _loadTransactionEvent(event, emit) async {
    emit(LoadingTransaction());
    await Future.delayed(const Duration(milliseconds: 200));
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
    await Future.delayed(const Duration(milliseconds: 200));

    await DbServices.deleteTranscation(event.id);
    final List transactions = await DbServices.getTranscations();
    final Map balanceInfo = await DbServices.getBalance();
    emit(LoadedTransaction(
        transactions: transactions,
        totalBalance: balanceInfo["totalBalance"],
        totalIncome: balanceInfo["totalIncome"],
        totalExpenses: balanceInfo["totalExpenses"]));
  }

  void _addTransactionEvent(event, emit) async {
    emit(LoadingTransaction());
    await Future.delayed(const Duration(milliseconds: 200));

    final TransactionModel transaction = TransactionModel(
        category: event.category,
        date: DateTime.parse(event.date),
        amount: event.amount,
        transactionType: event.transactionType,
        note: event.note);

    final res = await DbServices.insertTranscation(transaction);

    if (res["status"] == "success") {
      // successfully added item;
      emit(AddedTransacation(message: res["message"]));
    } else {
      // unsuccessfully
      emit(FailedAddedTransaction(errorMessage: res["errorMessage"]));
    }
  }
}
