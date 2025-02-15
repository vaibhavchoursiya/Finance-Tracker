import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TotalBalanceWidget extends StatelessWidget {
  const TotalBalanceWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Column(
          children: [
            const SizedBox(
              height: 24.0,
            ),
            Text(
              "Total balance",
              style: GoogleFonts.roboto(
                fontSize: 16.0,
                color: Colors.white.withOpacity(0.9),
              ),
            ),
            const SizedBox(
              height: 6.0,
            ),
            Text(
              "\$ 3000.00",
              style: GoogleFonts.roboto(
                fontSize: 42.0,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
