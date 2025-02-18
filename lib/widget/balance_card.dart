import 'dart:math';

import 'package:finence_tracker/utitlies/app_theme.dart';
import 'package:finence_tracker/widget/display_amount_widget.dart';
import 'package:finence_tracker/widget/total_balance_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BalanceCard extends StatelessWidget {
  const BalanceCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: Stack(
        children: [
          Container(
            width: double.infinity,
            height: 210.0,
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [
                  AppTheme.accent,
                  AppTheme.dark,
                  AppTheme.primary,
                  AppTheme.ternary,
                ],
                transform: GradientRotation(pi / 4),
              ),
              borderRadius: BorderRadius.circular(20.0),
            ),
          ),
          const Positioned.fill(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TotalBalanceWidget(),
                Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 18.0, vertical: 25.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      DisplayAmountWidget(
                        amount: 25000.00,
                        iconData: CupertinoIcons.arrow_down,
                        title: "Income",
                        color: Colors.green,
                      ),
                      DisplayAmountWidget(
                        amount: 24000.00,
                        iconData: CupertinoIcons.arrow_up,
                        title: "Expenses",
                        color: Colors.red,
                      ),
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

class PatternPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    // Define a paint for the pattern
    final paint = Paint()
      ..color = Colors.blue.withOpacity(0.2)
      ..strokeWidth = 2;

    // Define the spacing for the pattern lines
    const double spacing = 20.0;

    // Draw diagonal lines starting from the left and top edges
    for (double x = -size.height; x < size.width; x += spacing) {
      canvas.drawLine(
        Offset(x, 0),
        Offset(x + size.height, size.height),
        paint,
      );
    }

    // Optionally, you can draw additional shapes or patterns here.
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    // Return true if the painter should repaint when something changes.
    // Here it's static, so we return false.
    return false;
  }
}
