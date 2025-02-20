import 'package:finence_tracker/features/show_balance/bloc/show_balance_bloc.dart';
import 'package:finence_tracker/features/show_balance/bloc/show_balance_state.dart';
import 'package:finence_tracker/utitlies/app_theme.dart';
import 'package:finence_tracker/widget/display_amount_widget.dart';
import 'package:finence_tracker/widget/total_balance_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BalanceCard extends StatelessWidget {
  const BalanceCard({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ShowBalanceBloc, ShowBalanceState>(
        builder: (context, state) {
      if (state is ShowBalanceLoadingState) {
        return const CircularProgressIndicator();
      }
      if (state is ShowBalanceInitialState) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TotalBalanceWidget(
              totalBalance: state.totalBalance,
            ),
            const SizedBox(
              height: 16.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                DisplayAmountWidget(
                  amount: state.income,
                  iconData: CupertinoIcons.arrow_down,
                  title: "Income",
                  color: Colors.green,
                ),
                const SizedBox(
                  width: 16.0,
                ),
                DisplayAmountWidget(
                  amount: state.expenses,
                  iconData: CupertinoIcons.arrow_up,
                  title: "Expenses",
                  color: Colors.red,
                ),
              ],
            ),
          ],
        );
      }
      return const CircularProgressIndicator(
        color: AppTheme.primary,
      );
    });
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
