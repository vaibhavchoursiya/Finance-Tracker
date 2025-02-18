import 'dart:ui';
import 'package:finence_tracker/utitlies/app_theme.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NavBar extends StatelessWidget {
  const NavBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 1.2, sigmaY: 1.5),
              child: Container(
                width: 47.0,
                height: 47.0,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: AppTheme.accent.withOpacity(0.24),
                  shape: BoxShape.circle,
                ),
                child: const Text(
                  "🧢",
                  style: TextStyle(
                    fontSize: 24.0,
                  ),
                ),
              ),
            ),
            const SizedBox(
              width: 15.0,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "welcome 👋",
                  style: GoogleFonts.aDLaMDisplay(
                    fontSize: 15.0,
                    height: 1.2,
                    color: AppTheme.light.withOpacity(0.8),
                  ),
                ),
                Text(
                  "Jone Doe",
                  style: GoogleFonts.roboto(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                    color: AppTheme.light,
                  ),
                ),
              ],
            ),
          ],
        ),
        Container(
          width: 45.0,
          height: 45.0,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            color: AppTheme.accent,
          ),
          child: const Icon(
            CupertinoIcons.settings,
            color: AppTheme.light,
          ),
        )
      ],
    );
  }
}
