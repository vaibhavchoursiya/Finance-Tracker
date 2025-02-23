import 'package:finence_tracker/models/transaction_model.dart';
import 'package:finence_tracker/widget/transaction_tile.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionView extends StatelessWidget {
  final List transactions;
  final bool doYouWantToShowDateFormat;
  const TransactionView({
    super.key,
    required this.transactions,
    this.doYouWantToShowDateFormat = true,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: transactions.length,
        itemBuilder: (context, index) {
          final TransactionModel transaction = transactions[index];

          return TransactionTile(
            doYouWantToShowDateFormat: doYouWantToShowDateFormat,
            note: transaction.note,
            transactionType: transaction.transactionType,
            id: transaction.id,
            amount: transaction.amount,
            category: transaction.category,
            date: DateFormat("yyyy-MM-dd").format(transaction.date),
          );
        });
  }
}
