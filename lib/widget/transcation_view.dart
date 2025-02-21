import 'package:finence_tracker/models/transaction_model.dart';
import 'package:finence_tracker/widget/transaction_tile.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TranscationView extends StatelessWidget {
  final List transcations;
  const TranscationView({
    super.key,
    required this.transcations,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: transcations.length,
        itemBuilder: (context, index) {
          final TransactionModel transcation = transcations[index];

          return TransactionTile(
            id: transcation.id,
            amount: transcation.amount,
            category: transcation.category,
            date: DateFormat('yyyy-MM-dd').format(transcation.date),
          );
        });
  }
}
