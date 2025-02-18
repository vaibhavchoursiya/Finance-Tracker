import 'package:finence_tracker/utitlies/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

scaffoldSnackBar(BuildContext context, Color color, String message) {
  return ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      backgroundColor: color,
      duration: const Duration(seconds: 1),
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
        topLeft: Radius.circular(10.0),
        topRight: Radius.circular(10.0),
      )),
      content: Text(
        message,
        style: GoogleFonts.aDLaMDisplay(color: AppTheme.light),
      ),
    ),
  );
}
