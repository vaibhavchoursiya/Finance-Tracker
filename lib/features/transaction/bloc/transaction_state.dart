abstract class TransactionState {}

class InitialTransaction extends TransactionState {}

class LoadingTransaction extends TransactionState {}

class LoadedTransaction extends TransactionState {
  final List transactions;
  final double totalBalance;
  final double totalIncome;
  final double totalExpenses;

  LoadedTransaction(
      {required this.transactions,
      required this.totalBalance,
      required this.totalIncome,
      required this.totalExpenses});
}

class FailedTransaction extends TransactionState {
  final String message;

  FailedTransaction({required this.message});
}
