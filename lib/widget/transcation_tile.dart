import 'package:finence_tracker/utitlies/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TranscationTile extends StatelessWidget {
  final String category;
  final double amount;
  final String date;
  const TranscationTile({
    super.key,
    required this.category,
    required this.amount,
    required this.date,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10.0),
      padding: const EdgeInsets.all(14.0),
      decoration: BoxDecoration(
        color: AppTheme.light.withOpacity(0.125),
        borderRadius: BorderRadius.circular(
          10.0,
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 67, 71, 92),
                  borderRadius: BorderRadius.circular(30.0),
                ),
                child: const Icon(
                  Icons.shopping_bag,
                  color: Colors.cyan,
                ),
              ),
              const SizedBox(
                width: 12.0,
              ),
              Text(
                category,
                style: GoogleFonts.aDLaMDisplay(
                  color: AppTheme.light,
                  fontSize: 18.0,
                ),
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
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
          )
        ],
      ),
    );
  }
}
