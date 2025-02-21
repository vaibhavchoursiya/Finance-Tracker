class TransactionModel {
  final int id;
  final String note;
  final String category;
  final DateTime date;
  final double amount;
  final String transactionType;

  TransactionModel({
    this.id = -1,
    required this.category,
    required this.date,
    required this.amount,
    required this.transactionType,
    required this.note,
  });

  toMap() {
    return {
      "note": note,
      "category": category,
      "date": date.toString(),
      "amount": amount,
      "transactionType": transactionType
    };
  }
}
