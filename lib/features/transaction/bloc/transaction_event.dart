abstract class TransactionEvent {}

class LoadTransactionEvent extends TransactionEvent {}

class DeleteTransactionEvent extends TransactionEvent {
  final int id;
  DeleteTransactionEvent({required this.id});
}

class AddTransactionEvent extends TransactionEvent {
  final String note;
  final String category;
  final String transactionType;
  final String date;
  final double amount;

  AddTransactionEvent(
      {required this.note,
      required this.category,
      required this.transactionType,
      required this.date,
      required this.amount});
}
