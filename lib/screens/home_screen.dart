import 'package:finence_tracker/utitlies/app_theme.dart';
import 'package:finence_tracker/widget/balance_card.dart';
import 'package:finence_tracker/widget/nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(28.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const NavBar(),
            const SizedBox(
              height: 35.0,
            ),
            const Stack(
              children: [
                // LightEffectLine(),
                BalanceCard(),
              ],
            ),
            const SizedBox(
              height: 22.0,
            ),
            Text(
              "Transcations",
              style: GoogleFonts.roboto(
                fontWeight: FontWeight.w600,
                color: AppTheme.light,
                fontSize: 24.0,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class LightEffectLine extends StatelessWidget {
  const LightEffectLine({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 0.0,
      left: 10.0,
      child: Container(
        width: 100.0,
        height: 4.0,
        decoration: BoxDecoration(
            color: AppTheme.light,
            borderRadius: BorderRadius.circular(10.0),
            boxShadow: [
              BoxShadow(
                color: Colors.blue.withOpacity(0.8), // Light color
                spreadRadius: 10, // How much it spreads
                blurRadius: 30, // Soft blur effect
                offset: Offset(0, 0), // Centered glow
              ),
              // Subtle bottom shadow for depth
              BoxShadow(
                color: Colors.black.withOpacity(0.5),
                spreadRadius: 2,
                blurRadius: 10,
                offset: Offset(0, 5), // Positioned at bottom
              ),
            ]),
      ),
    );
  }
}
