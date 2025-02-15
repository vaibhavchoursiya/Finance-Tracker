class TranscationalModel {
  final String note;
  final String category;
  final DateTime date;
  final double amount;
  final String transcationalType;

  TranscationalModel({
    required this.category,
    required this.date,
    required this.amount,
    required this.transcationalType,
    required this.note,
  });
}
