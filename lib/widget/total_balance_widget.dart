import 'package:finence_tracker/utitlies/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TotalBalanceWidget extends StatelessWidget {
  final double totalBalance;
  const TotalBalanceWidget({
    super.key,
    required this.totalBalance,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: AppTheme.light.withOpacity(0.125),
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: Column(
              children: [
                Chip(
                  backgroundColor: AppTheme.dark,
                  label: Text(
                    maxLines: 1,
                    overflow: TextOverflow.fade,
                    "Total balance",
                    style: GoogleFonts.aDLaMDisplay(
                      fontSize: 14.0,
                      color: AppTheme.light.withOpacity(0.6),
                      height: 1.2,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 4.5,
                ),
                Text(
                  "\$ $totalBalance",
                  style: GoogleFonts.roboto(
                    fontSize: 32.0,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
