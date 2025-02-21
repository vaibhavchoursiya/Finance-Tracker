import 'package:finence_tracker/widget/display_amount_widget.dart';
import 'package:finence_tracker/widget/total_balance_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BalanceCard extends StatelessWidget {
  final double totalBalance;
  final double totalExpenses;
  final double totalIncome;

  const BalanceCard(
      {super.key,
      required this.totalBalance,
      required this.totalExpenses,
      required this.totalIncome});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        TotalBalanceWidget(
          totalBalance: totalBalance,
        ),
        const SizedBox(
          height: 16.0,
        ),
        IncomeAndExpensesRow(
          expenses: totalExpenses,
          income: totalIncome,
        ),
      ],
    );
  }
}

class IncomeAndExpensesRow extends StatelessWidget {
  final double income;
  final double expenses;
  const IncomeAndExpensesRow({
    super.key,
    required this.income,
    required this.expenses,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        DisplayAmountWidget(
          amount: income,
          iconData: CupertinoIcons.arrow_down,
          title: "Income",
          color: Colors.green,
        ),
        const SizedBox(
          width: 16.0,
        ),
        DisplayAmountWidget(
          amount: expenses,
          iconData: CupertinoIcons.arrow_up,
          title: "Expenses",
          color: Colors.red,
        ),
      ],
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
