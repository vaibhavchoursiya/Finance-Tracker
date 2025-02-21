import 'dart:math';

import 'package:finence_tracker/utitlies/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DisplayAmountWidget extends StatelessWidget {
  final IconData iconData;
  final String title;
  final double amount;
  final Color color;
  const DisplayAmountWidget({
    super.key,
    required this.iconData,
    required this.title,
    required this.amount,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          gradient: LinearGradient(colors: [
            AppTheme.dark.withOpacity(0.125),
            color,
          ], transform: const GradientRotation(pi / 4)),
        ),
        child: Row(
          children: [
            Container(
              width: 28.0,
              height: 28.0,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: color.withOpacity(0.25),
                shape: BoxShape.circle,
              ),
              child: Icon(
                iconData,
                color: color,
                size: 16.0,
              ),
            ),
            const SizedBox(
              width: 10.0,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: GoogleFonts.aDLaMDisplay(
                      color: AppTheme.light.withOpacity(0.5),
                      height: 1.2,
                    ),
                  ),
                  const SizedBox(
                    height: 4.0,
                  ),
                  Text(
                    maxLines: 1,
                    overflow: TextOverflow.fade,
                    amount.toStringAsFixed(2),
                    style: GoogleFonts.aDLaMDisplay(
                      color: Colors.white,
                      fontSize: 16.0,
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
