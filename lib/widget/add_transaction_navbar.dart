import 'package:finence_tracker/utitlies/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

class ScreenNavBar extends StatelessWidget {
  final String title;
  const ScreenNavBar({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          onPressed: () {
            context.pop();
          },
          icon: const Icon(
            Icons.arrow_back_ios,
            color: AppTheme.light,
            size: 38.0,
          ),
        ),
        const SizedBox(
          width: 6.0,
        ),
        Text(
          title,
          style:
              GoogleFonts.aDLaMDisplay(color: AppTheme.light, fontSize: 22.0),
        ),
      ],
    );
  }
}
