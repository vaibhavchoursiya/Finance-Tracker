abstract class TransactionEvent {}

class LoadTransactionEvent extends TransactionEvent {}

class DeleteTransactionEvent extends TransactionEvent {
  final int id;
  DeleteTransactionEvent({required this.id});
}
