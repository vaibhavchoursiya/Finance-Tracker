import 'package:finence_tracker/utitlies/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class GraphScreenTabs extends StatelessWidget {
  const GraphScreenTabs({
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
