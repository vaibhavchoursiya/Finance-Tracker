import 'package:finence_tracker/widget/graph_screen_navbar.dart';
import 'package:finence_tracker/widget/graph_screen_tabs.dart';
import 'package:finence_tracker/widget/transaction_chart_widget.dart';
import 'package:flutter/material.dart';

class GraphScreen extends StatelessWidget {
  const GraphScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(28.0),
      child: Column(
        children: [
          SizedBox(
            height: 14.0,
          ),
          GraphScreenNavBar(),
          SizedBox(
            height: 28.0,
          ),
          GraphScreenTabs(),
          SizedBox(
            height: 14.0,
          ),
          SizedBox(
            height: 28.0,
          ),
          TransactionChartWidget(),
        ],
      ),
    );
  }
}
