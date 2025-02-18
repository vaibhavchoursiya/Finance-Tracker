import 'package:finence_tracker/utitlies/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TotalBalanceWidget extends StatelessWidget {
  const TotalBalanceWidget({
    super.key,
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
          Column(
            children: [
              Chip(
                backgroundColor: AppTheme.dark,
                label: Text(
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
                "\$ 3000.00",
                style: GoogleFonts.roboto(
                  fontSize: 32.0,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
