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
    print(date.millisecondsSinceEpoch ~/ 1000);
    return {
      "note": note,
      "category": category,
      "date": (date.millisecondsSinceEpoch ~/ 1000),
      "amount": amount,
      "transactionType": transactionType
    };
  }
}
