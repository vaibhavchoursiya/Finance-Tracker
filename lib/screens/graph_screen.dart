import 'package:finence_tracker/features/graph/graph_bloc.dart';
import 'package:finence_tracker/features/graph/graph_event.dart';
import 'package:finence_tracker/widget/graph_screen_navbar.dart';
import 'package:finence_tracker/widget/graph_screen_tabs.dart';
import 'package:finence_tracker/widget/transaction_chart_widget.dart';
import 'package:finence_tracker/widget/transaction_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GraphScreen extends StatefulWidget {
  const GraphScreen({super.key});

  @override
  State<GraphScreen> createState() => _GraphScreenState();
}

class _GraphScreenState extends State<GraphScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await initialization();
    });
  }

  Future<void> initialization() async {
    final graphBloc = context.read<GraphBloc>();
    graphBloc.add(LoadDataGraphEvent());
  }

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
