import 'package:finence_tracker/utitlies/app_theme.dart';
import 'package:finence_tracker/widget/transaction_chart_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TranscationScreen extends StatelessWidget {
  const TranscationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(28.0),
      child: Column(
        children: [
          SizedBox(
            height: 14.0,
          ),
          TransactionScreenNavbar(),
          SizedBox(
            height: 28.0,
          ),
          TransactionTabRow(),
          SizedBox(
            height: 28.0,
          ),
          TransactionChartWidget(),
        ],
      ),
    );
  }
}

class TransactionTabRow extends StatelessWidget {
  const TransactionTabRow({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: SizedBox(
            height: 60.0,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                backgroundColor: AppTheme.light.withOpacity(0.125),
              ),
              onPressed: () {},
              child: Text(
                "Income",
                style: GoogleFonts.aDLaMDisplay(color: AppTheme.light),
              ),
            ),
          ),
        ),
        const SizedBox(
          width: 10.0,
        ),
        Expanded(
          child: SizedBox(
            height: 60.0,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                backgroundColor: AppTheme.light.withOpacity(0.125),
              ),
              onPressed: () {},
              child: Text(
                "Expenses",
                style: GoogleFonts.aDLaMDisplay(
                  color: AppTheme.light.withOpacity(0.7),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class TransactionScreenNavbar extends StatelessWidget {
  const TransactionScreenNavbar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Transacations",
          style:
              GoogleFonts.aDLaMDisplay(color: AppTheme.light, fontSize: 22.0),
        ),
      ],
    );
  }
}
