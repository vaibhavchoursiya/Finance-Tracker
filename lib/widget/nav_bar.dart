import 'dart:ui';
import 'package:finence_tracker/utitlies/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:flutter/cupertino.dart';

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
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.menu,
                color: AppTheme.light,
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
            color: AppTheme.primary,
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
