import 'dart:math';

import 'package:finence_tracker/features/transaction/bloc/transaction_bloc.dart';
import 'package:finence_tracker/features/transaction/bloc/transaction_event.dart';
import 'package:finence_tracker/utitlies/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class TransactionTile extends StatelessWidget {
  final String transactionType;
  final String note;
  final int id;
  final String category;
  final double amount;
  final String date;

  const TransactionTile({
    super.key,
    required this.transactionType,
    required this.category,
    required this.amount,
    required this.date,
    required this.id,
    required this.note,
  });

  @override
  Widget build(BuildContext context) {
    final transactionBloc = context.read<TransactionBloc>();

    return GestureDetector(
      onDoubleTap: () {
        transactionBloc.add(DeleteTransactionEvent(id: id));
      },
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 10.0),
        padding: const EdgeInsets.all(14.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(
            10.0,
          ),
          gradient: LinearGradient(
            colors: [
              AppTheme.dark.withOpacity(0.125),
              (transactionType == "Exp") ? Colors.redAccent : Colors.green,
            ],
            transform: const GradientRotation(pi / 4),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Container(
                  width: 55,
                  height: 55,
                  decoration: BoxDecoration(
                    color: AppTheme.light.withOpacity(0.125),
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  child: Icon(
                    (transactionType == "Inc")
                        ? Icons.monetization_on
                        : Icons.monitor_heart_rounded,
                    color: AppTheme.light,
                  ),
                ),
                const SizedBox(
                  width: 12.0,
                ),
                SizedBox(
                  width: 110.0,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        category,
                        style: GoogleFonts.aDLaMDisplay(
                          color: AppTheme.light,
                          fontSize: 18.0,
                        ),
                      ),
                      Text(
                        note,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: GoogleFonts.aDLaMDisplay(
                          color: AppTheme.light.withOpacity(0.5),
                          fontSize: 12.0,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    "\$ ${amount.toStringAsFixed(2)}",
                    style: GoogleFonts.aDLaMDisplay(
                      color: AppTheme.light,
                      fontSize: 18.0,
                    ),
                  ),
                  Text(
                    date,
                    style: GoogleFonts.aDLaMDisplay(
                      color: AppTheme.light.withOpacity(0.6),
                      fontSize: 14.0,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
