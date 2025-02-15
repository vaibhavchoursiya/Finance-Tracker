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
    return Row(
      children: [
        Container(
          width: 28.0,
          height: 28.0,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.25),
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
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: GoogleFonts.roboto(
                color: Colors.white70,
              ),
            ),
            Text(
              amount.toStringAsFixed(2),
              style: GoogleFonts.aDLaMDisplay(
                color: Colors.white,
                fontSize: 16.0,
              ),
            ),
          ],
        )
      ],
    );
  }
}
