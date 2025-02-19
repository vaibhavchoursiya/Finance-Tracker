import 'package:finence_tracker/utitlies/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AddTranscationButtonWidget extends StatelessWidget {
  const AddTranscationButtonWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 50.0,
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          backgroundColor: AppTheme.primary,
        ),
        child: Text(
          "Transcation",
          style: GoogleFonts.aDLaMDisplay(color: AppTheme.light),
        ),
      ),
    );
  }
}
