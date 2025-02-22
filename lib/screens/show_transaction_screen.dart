import 'package:finence_tracker/models/transaction_model.dart';
import 'package:finence_tracker/utitlies/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

class ShowTransactionScreen extends StatelessWidget {
  final TransactionModel transaction;
  const ShowTransactionScreen({super.key, required this.transaction});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.dark,
      body: Padding(
        padding: const EdgeInsets.all(28.0),
        child: Column(
          children: [
            const SizedBox(
              height: 30.0,
            ),
            Row(
              children: [
                IconButton(
                  onPressed: () {
                    context.pop();
                  },
                  icon: const Icon(
                    Icons.arrow_back_ios_new,
                    color: AppTheme.light,
                    size: 32.0,
                  ),
                ),
                const SizedBox(
                  width: 10.0,
                ),
                Text(
                  transaction.note,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: GoogleFonts.aDLaMDisplay(
                    color: AppTheme.light,
                    fontSize: 22.0,
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 30.0,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Table(
                border: TableBorder.all(color: AppTheme.light),
                children: [
                  tableRow(
                    "Amount",
                    transaction.amount.toString(),
                  ),
                  tableRow(
                    "Category",
                    transaction.category.toString(),
                  ),
                  tableRow(
                    "Date",
                    transaction.date.toString(),
                  ),
                  tableRow(
                    "Note",
                    transaction.note.toString(),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  TableRow tableRow(String title, String value) {
    return TableRow(children: [
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          title,
          textAlign: TextAlign.center,
          style: GoogleFonts.aDLaMDisplay(
            color: AppTheme.light,
          ),
        ),
      ),
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          value.toString(),
          textAlign: TextAlign.center,
          style: GoogleFonts.aDLaMDisplay(color: AppTheme.light),
        ),
      ),
    ]);
  }
}
