import 'dart:math';

import 'package:finence_tracker/features/graph/graph_bloc.dart';
import 'package:finence_tracker/features/graph/graph_event.dart';
import 'package:finence_tracker/features/search/bloc/search_bloc.dart';
import 'package:finence_tracker/features/search/bloc/search_event.dart';
import 'package:finence_tracker/features/transaction/bloc/transaction_bloc.dart';
import 'package:finence_tracker/features/transaction/bloc/transaction_event.dart';
import 'package:finence_tracker/models/transaction_model.dart';
import 'package:finence_tracker/utitlies/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class TransactionTile extends StatelessWidget {
  final String transactionType;
  final String note;
  final int id;
  final String category;
  final double amount;
  final String date;
  final bool doYouWantToShowDateFormat;

  const TransactionTile({
    super.key,
    required this.transactionType,
    required this.category,
    required this.amount,
    required this.date,
    required this.id,
    required this.note,
    required this.doYouWantToShowDateFormat,
  });

  String getTodayTomorrowYesterday({String? stringDate}) {
    final todayFormatedDate = DateFormat("yyyy-MM-dd").format(DateTime.now());
    final DateTime today = DateTime.parse(todayFormatedDate);

    final date = DateTime.parse(stringDate!);

    if (date.isAfter(today) == true) {
      return "Tomorrow";
    } else if (date.isBefore(today)) {
      return "Yesterday";
    }
    return "Today";
  }

  @override
  Widget build(BuildContext context) {
    final transactionBloc = context.read<TransactionBloc>();
    final graphBloc = context.read<GraphBloc>();
    final searchBloc = context.read<SearchBloc>();
    return GestureDetector(
      onTap: () {
        context.push("/show_transaction", extra: {
          "data": TransactionModel(
              amount: amount,
              category: category,
              date: DateTime.parse(date),
              note: note,
              transactionType: transactionType,
              id: id)
        });
      },
      onDoubleTap: () {
        transactionBloc.add(DeleteTransactionEvent(id: id));
        graphBloc.add(LoadDataGraphEvent());
        searchBloc.add(SearchTransactionEvent());
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
                    "\₹ ${amount.toStringAsFixed(2)}",
                    style: GoogleFonts.aDLaMDisplay(
                      color: AppTheme.light,
                      fontSize: 18.0,
                    ),
                  ),
                  Text(
                    doYouWantToShowDateFormat
                        ? date
                        : getTodayTomorrowYesterday(stringDate: date),
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
