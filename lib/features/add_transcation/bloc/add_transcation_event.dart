abstract class TranscationEvent {}

class AddTranscationEvent extends TranscationEvent {
  final String note;
  final String category;
  final double amount;
  final String date;
  final String transcationalType;

  AddTranscationEvent(
      {required this.note,
      required this.category,
      required this.amount,
      required this.date,
      required this.transcationalType});
}

class ResetAddTranscationEvent extends TranscationEvent {}
