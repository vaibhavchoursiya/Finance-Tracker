import 'package:finence_tracker/utitlies/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class GraphScreenNavBar extends StatelessWidget {
  const GraphScreenNavBar({
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
